{-# LANGUAGE OverloadedStrings #-}
--TODO: возможно recordIODecoder надо положить сюда же.
--TODO: возможно сюда надо перенести sink и conduit

module Mesos.V1.Client.HTTP.Internal.Codec where

import           Data.Aeson                     ( FromJSON, ToJSON )
import qualified Data.Aeson                    as Aeson
import qualified Data.Attoparsec.ByteString    as Atto
import           Data.ByteString                ( ByteString )
import qualified Data.ByteString               as BS
import qualified Data.ByteString.Lazy          as LBS
import Data.Maybe
import Data.Typeable (Typeable)
import Control.Exception (Exception, SomeException, toException)
import qualified Text.ProtocolBuffers as ProtocolBuffers
import           Text.ProtocolBuffers (ReflectDescriptor, Wire, Int64)
import qualified Text.ProtocolBuffers.Get as ProtocolBuffers

data RequestEncoder a = RequestEncoder
    { contentType :: ByteString
    , encode      :: a -> LBS.ByteString
    -- ^ encode result is a LAZY ByteString because encoder may want to generate a stream with unknown number of chunks in advance.  
    } 

jsonEncoder :: (ToJSON a) => RequestEncoder a
jsonEncoder =
    RequestEncoder { contentType = "application/json", encode = Aeson.encode }

protobufEncoder :: (ReflectDescriptor a, Wire a) => RequestEncoder a
protobufEncoder =
    RequestEncoder { contentType = "application/x-protobuf", encode = ProtocolBuffers.messagePut }

data ResponseDecoder a = ResponseDecoder
    { accept :: ByteString
    , decode :: ByteString -> DecodeResult a
    -- ^ decode operates on STRICT ByteString because input buffers are generally strict, and decode function have an ability
    -- to request more input via Partial result.
    -- It may also return unconsumed part of input buffer and strict ByteString since input is strict. 
    }

data DecodeResult a = Finished ByteString a
                    | Partial (Maybe ByteString -> DecodeResult a) -- ^ Using Maybe allow us explicictly pass eof condition to underlying decoder.   
                    | Failed SomeException

data AttoparsecException = AttoparsecException ByteString [String] String deriving (Show, Typeable) -- ^ Exception wrapper for Attoparsec errors.
instance Exception AttoparsecException

decodeAtto
    :: Atto.Parser a
    -> (ByteString -> a -> DecodeResult b)
    -> ByteString
    -> DecodeResult b
decodeAtto p c = go . Atto.parse p
    where
    go (Atto.Fail i ctx e) = Failed $ toException $ AttoparsecException i ctx e
    go (Atto.Partial f   ) = Partial $ go . f . fromMaybe BS.empty
    go (Atto.Done i r    ) = c i r

-- | Exception wrapper for Aeson errors. Also holds unconsumed part of the input buffer and parsed JSON value.
data AesonException = AesonException ByteString Aeson.Value String deriving (Show, Typeable)
instance Exception AesonException

decodeJson :: (FromJSON a) => ByteString -> DecodeResult a
decodeJson = decodeAtto Aeson.json' $ \i r -> case Aeson.fromJSON r of
    Aeson.Error   e -> Failed $ toException $ AesonException i r e
    Aeson.Success a -> Finished i a

jsonDecoder :: (FromJSON a) => ResponseDecoder a
jsonDecoder =
    ResponseDecoder { accept = "application/json", decode = decodeJson }

data DecodeProtobufException = ProtobufException Int64 String deriving (Show, Typeable)

instance Exception DecodeProtobufException

decodeProtobuf :: (ReflectDescriptor a, Wire a) => ByteString -> DecodeResult a
decodeProtobuf = go . ProtocolBuffers.runGet ProtocolBuffers.messageGetM . LBS.fromStrict
    where
    go (ProtocolBuffers.Failed i s) = Failed $ toException $ ProtobufException i s
    go (ProtocolBuffers.Finished i _ a) = Finished (LBS.toStrict i) a
    go (ProtocolBuffers.Partial f     ) = Partial $ go . f . fmap LBS.fromStrict

protobufDecoder :: (ReflectDescriptor a, Wire a) => ResponseDecoder a
protobufDecoder =
    ResponseDecoder { accept = "application/x-protobuf", decode = decodeProtobuf }

data Codec a b = Codec { encoder :: RequestEncoder a, decoder :: ResponseDecoder b }

jsonCodec :: (ToJSON a, FromJSON b) => Codec a b  
jsonCodec = Codec jsonEncoder jsonDecoder

protobufCodec :: (ReflectDescriptor a, Wire a, ReflectDescriptor b, Wire b) => Codec a b  
protobufCodec = Codec protobufEncoder protobufDecoder
