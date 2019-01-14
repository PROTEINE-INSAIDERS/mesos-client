{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE PolyKinds  #-}

module Mesos.V1.Client.HTTP.Internal where

import           Conduit
import           Control.Monad
import           Data.Aeson                     ( FromJSON
                                                , ToJSON
                                                )
import qualified Data.Aeson                    as Aeson
import qualified Data.Attoparsec.ByteString    as Atto
import qualified Data.Attoparsec.ByteString.Char8
                                               as Atto8
import           Data.ByteString                ( ByteString )
import qualified Data.ByteString               as BS
import qualified Data.ByteString.Lazy          as LBS
import           Data.Maybe
import           Data.Proxy
import           Data.Typeable
import           Mesos.V1.Internal
import           Mesos.V1.Internal.TaggedUnion
import           Network.HTTP.Client            ( Manager )
import           Network.HTTP.Simple ( Request )
import qualified Network.HTTP.Simple as HTTP
import           Network.HTTP.Types
import           Text.ProtocolBuffers
import qualified Text.ProtocolBuffers.Get      as ProtocolBuffers
import           UnliftIO.Exception
import           Data.Singletons

newtype Endpoint = Endpoint
  { request :: Request
  } deriving (Typeable, Show)

newEndpoint :: (MonadThrow m) => Manager -> String -> m Endpoint
newEndpoint manager address = do
  request <- HTTP.parseRequest address
  return Endpoint
    { request = HTTP.setRequestManager manager $ HTTP.setRequestMethod methodPost request
    }

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
  RequestEncoder { contentType = "application/x-protobuf", encode = messagePut }

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
decodeProtobuf = go . runGet messageGetM . LBS.fromStrict
 where
  go (ProtocolBuffers.Failed i s) =
    Failed $ toException $ ProtobufException i s
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

--TODO: в него можно добавить параметры запроса и ответа.
data DecoderConduitException = NoInput
                             | DecodeException SomeException
                             deriving (Show, Typeable)

instance Exception DecoderConduitException

decoderSink
  :: (MonadIO m)
  => (ByteString -> DecodeResult (a :: *))
  -> ConduitT ByteString Void m (a :: *)
decoderSink decoder = do
  mi <- await
  case mi of
    Just i  -> go $ decoder i
    Nothing -> throwIO NoInput
 where
  go (Failed  e   ) = throwIO $ DecodeException e
  go (Partial f   ) = await >>= go . f
  go (Finished _ a) = return a

prepareRequest :: Endpoint -> RequestEncoder msg -> ByteString -> msg -> Request
prepareRequest (Endpoint request) (RequestEncoder contentType encode) accept msg
  = HTTP.setRequestHeader hContentType [contentType]
    $ HTTP.setRequestHeader hAccept [accept]
    $ HTTP.setRequestBodyLBS (encode msg) request

-- TODO: add status code check'
-- ТODO: сигнатура ::  
call
  :: (MonadUnliftIO m)
  => Endpoint
  -> Codec msg (ResponseTo msg)
  -> msg
  -> m (ResponseTo msg)
call endpoing (Codec encoder decoder) msg = do
  let request = prepareRequest endpoing encoder (accept decoder) msg
  HTTP.httpSink request (\_ -> decoderSink $ decode decoder)

call' :: forall k1 k2 (a :: k1) (b :: k2) m . 
         ( MonadUnliftIO m
         , Construct a 
         , Extract b
         ) => Endpoint
           -> Codec (UnionType a) (UnionType b)
           -> CallTag a b
           -> CaseType a
           -> m (CaseType b)
call' endpoint (Codec encoder decoder) tag msg = do
  let requestMsg = construct (sing @a) msg
      request = prepareRequest endpoint encoder (accept decoder) $ requestMsg
  response <- HTTP.httpSink request $ \_ -> decoderSink $ decode decoder
  liftIO $ extract (sing @b) response
{- 
call' :: forall (m :: * -> *) (a :: k1) k2 . ( MonadUnliftIO m
                      , UnionTag (a :: k1) -- ^ Request should be union type.
                      , UnionTag (ResponseTag (a :: k1) :: k2)  -- ^ Response should be union type.
                      ) => Endpoint 
                        -> Codec (UnionType (a :: k1) :: *) (UnionType (ResponseTag (a :: k1) :: k2) :: *) 
                        -> Sing (a :: k1) 
                        -> (CaseType (a :: k1) :: *) 
                        -> m (CaseType (ResponseTag (a :: k1) :: k2) :: *)
call' endpoint (Codec encoder decoder) proxy msg = do
  let requestMsg :: UnionType (a :: k1) = construct proxy msg
      request :: HTTP.Request = prepareRequest endpoint encoder (accept decoder) $ requestMsg
      sink :: HTTP.Response () -> ConduitT ByteString Void m (UnionType (ResponseTag (a :: k1) :: k2)) = (\_ -> decoderSink $ decode decoder)
  (response :: UnionType (ResponseTag (a :: k1) :: k2)) <- HTTP.httpSink request sink 
  liftIO $ extract sing response  
-}
decoderTransfomer :: (MonadIO m) => (ByteString -> DecodeResult a) -> ConduitT ByteString a m ()
decoderTransfomer decoder = forever $ do
  mi <- await
  case mi of
    Just i  -> go $ decoder i
    Nothing -> throwIO NoInput
 where
  go (Failed  e   ) = throwIO $ DecodeException e
  go (Partial f   ) = await >>= go . f
  go (Finished i a) = yield a

recordIOParser :: Atto.Parser ByteString
recordIOParser = do
  Atto8.skipWhile ('\n' ==)
  recordSize <- Atto8.decimal :: Atto.Parser Word64
  Atto8.char '\n'
  Atto.take $ fromIntegral recordSize

recordIODecoder :: ByteString -> DecodeResult ByteString
recordIODecoder = decodeAtto recordIOParser Finished
  
recordIOTransformer :: (MonadIO m) => ConduitT ByteString ByteString m ()
recordIOTransformer = decoderTransfomer recordIODecoder

logger :: (MonadIO m, Show a) => String -> ConduitT a a m ()
logger name = awaitForever $ \i -> do 
  liftIO $ putStrLn $ name ++ ": " ++ show i 
  yield i

-- subscriptions parameters:
-- endpoint
-- [custom state]
-- decoder 
-- event type 

-- args:
-- call
-- encoder

-- TODO: make more specific (accept only subscribe calls specific for the current endpoint).
subscribe :: (MonadUnliftIO m, Show (EventOf a)) => Endpoint -> RequestEncoder a -> ResponseDecoder (EventOf a) -> a -> ConduitT (EventOf a) Void m r -> m r
subscribe endpoint encoder decoder msg sink = do
  let request = prepareRequest endpoint encoder (accept decoder) msg
  HTTP.httpSink request $ \_ -> recordIOTransformer 
                             .| logger "RecordIO" 
                             .| decoderTransfomer (decode decoder) 
                             .| logger "Message" 
                             .| sink 