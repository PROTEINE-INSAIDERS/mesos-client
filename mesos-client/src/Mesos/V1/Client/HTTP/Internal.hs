{-# LANGUAGE OverloadedStrings #-}

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
import qualified Data.Conduit.Combinators      as Conduit
import           Data.Maybe
import           Data.Typeable
import           Network.HTTP.Client            ( Manager )
import           Network.HTTP.Simple
import           Network.HTTP.Types
import           Text.ProtocolBuffers
import qualified Text.ProtocolBuffers.Get      as ProtocolBuffers
import           UnliftIO.Exception

-- TODO: do not expose constructor.
-- move smart constructor here.
newtype Endpoint = Endpoint
  { request :: Request
  } deriving (Typeable, Show)

newEndpoint :: (MonadThrow m) => Manager -> String -> m Endpoint
newEndpoint manager address = do
  request <- parseRequest address
  return Endpoint
    { request = setRequestManager manager $ setRequestMethod methodPost request
    }

data RequestEncoder a = RequestEncoder
  { contentType :: ByteString
  , encode      :: a -> LBS.ByteString
  -- ^ encode result is a LAZY ByteString because encoder may want to generate a stream with unknown number of chunks in advance.  
  } deriving (Typeable)

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

data AttoparsecException = AttoparsecException ByteString [String] String deriving (Show) -- ^ Exception wrapper for Attoparsec errors.
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
data AesonException = AesonException ByteString Aeson.Value String deriving (Show)
instance Exception AesonException

decodeJson :: (FromJSON a) => ByteString -> DecodeResult a
decodeJson = decodeAtto Aeson.json' $ \i r -> case Aeson.fromJSON r of
  Aeson.Error   e -> Failed $ toException $ AesonException i r e
  Aeson.Success a -> Finished i a

jsonDecoder :: (FromJSON a) => ResponseDecoder a
jsonDecoder =
  ResponseDecoder { accept = "application/json", decode = decodeJson }

data DecodeProtobufException = ProtobufException Int64 String deriving (Show)

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

--TODO: в него можно добавить параметры запроса и ответа.
data DecoderConduitException = NoInput
                             | DecodeException SomeException
                             deriving (Show)

instance Exception DecoderConduitException

decoderSink
  :: (MonadIO m)
  => (ByteString -> DecodeResult a)
  -> ConduitT ByteString Void m a
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
  = setRequestHeader hContentType [contentType]
    $ setRequestHeader hAccept [accept]
    $ setRequestBodyLBS (encode msg) request

-- TODO: add status code check'
call
  :: (MonadUnliftIO m, Show b)
  => Endpoint
  -> RequestEncoder a
  -> ResponseDecoder b
  -> a
  -> m b
call endpoing encoder decoder msg = do
  let request = prepareRequest endpoing encoder (accept decoder) msg
  res <- httpSink request (\_ -> decoderSink $ decode decoder)
  liftIO $ print res
  return res

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

stream :: (MonadUnliftIO m, Show b) => Endpoint -> RequestEncoder a -> ResponseDecoder b -> a -> m ()
stream endpoint encoder decoder msg = do
  let request = prepareRequest endpoint encoder (accept decoder) msg
  httpSink request $ \_ -> recordIOTransformer 
                        .| logger "RecordIO" 
                        .| decoderTransfomer (decode decoder) 
                        .| logger "Message" 
                        .| sinkNull
  return ()

-- TODO: фактически нам нужно 2 метода: call и subscribe. 