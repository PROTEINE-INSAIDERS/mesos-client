{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Mesos.HTTP.Client.Internal where

import           Conduit
import qualified Data.Conduit.Combinators as Conduit  
import qualified Data.ByteString.Lazy          as LBS
import           Control.Monad.Catch
import           Data.Aeson                     ( FromJSON
                                                , ToJSON
                                                )
import qualified Data.Aeson                    as Aeson
import           Data.ByteString
import           Data.Conduit.Attoparsec        ( sinkParser
                                                , sinkParserEither
                                                )
import           Data.Typeable
import           Network.HTTP.Client            ( Manager )
import           Network.HTTP.Simple
import           Network.HTTP.Types
import           Text.ProtocolBuffers
import           Text.ProtocolBuffers.Get       ( Result )
import qualified Text.ProtocolBuffers.Get as ProtocolBuffers
import UnliftIO.Exception
import qualified Data.Attoparsec.ByteString as Attoparsec 

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

-- TODO: 
-- 1. Унифицировать механизм обработки ошибок в декодерах.
--    JSON - ошибки разбора JSON (JSONParseException parseError - строка), ошибки fromJSON (Aeson.Error converError - строка)
--    Protobuf - ошибка парсера Protobuf (Failed i s - позиция, строка).
--    Таким образом в некоторых случаях у нас может быть позиция, а в некоторых нет, по идее от позиции можно вообще отказаться
--    т.к. эта информация для обработки ошибки не нужна. 
-- 2. Перевести весь код на unliftio
-- 3. Отделить Coduidt от декодеров.

data ResponseDecoder a = ResponseDecoder 
  { accept :: ByteString
  , decode :: ByteString -> DecodeResult (a, ByteString)
  -- ^ decode operates on STRICT ByteString because input buffers are generally strict, and decode function have an ability
  -- to request more input via Partial result.
  -- It may also return unconsumed part of input buffer and strict ByteString since input is strict. 
  } 

data DecodeResult a = Finished a | Partial (ByteString -> DecodeResult a) | Failed SomeException 

data DecodeJSONException = AttoparsecException ByteString [String] String -- ^ Exception wrapper for Attoparsec errors. 
                         | AesonException ByteString Aeson.Value String -- ^ Exception wrapper for Aeson errors. Also holds unconsumed part of the input buffer and parsed JSON value.
                         deriving (Show)

instance Exception DecodeJSONException

jsonDecoder :: (FromJSON a) => ByteString -> DecodeResult (a, ByteString)
jsonDecoder = go . Attoparsec.parse Aeson.json'
  where
    go (Attoparsec.Fail i ctx e) = Failed $ toException $ AttoparsecException i ctx e
    go (Attoparsec.Partial f) = Partial $ go . f
    go (Attoparsec.Done i r) = case Aeson.fromJSON r of
      Aeson.Error e -> Failed $ toException $ AesonException i r e
      Aeson.Success a -> Finished (a, i)

data ResponseSink m a = ResponseSink
  { accept :: ByteString
  -- ТODO: Conduit-ы можно отсюда убрать, оставив только BS -> (a, BS),
  -- a всю потоковую обработку вынеся в соответсвующие функции. 
  
  -- Conduit-ы могут быть полезны при поточной обработке ответов, 
  -- но логика кодирования/декодирования должна быть отделена.   
  , sink :: Request -> Response () -> ConduitT ByteString Void m a
  }

jsonSink :: (MonadThrow m, FromJSON a) => ResponseSink m a  -- ConduitT ByteString Void m a
jsonSink = ResponseSink
  { accept = "application/json"
  , sink   = \request response -> do
               eiherValue <- sinkParserEither Aeson.json' -- TODO: заменить на either, использовать JSONParseException 
               case eiherValue of
                 Left parseError ->
                   throwM $ JSONParseException request response parseError
                 Right value -> case Aeson.fromJSON value of
                   Aeson.Error converError -> throwM $ JSONConversionException
                     request
                     (fmap (const value) response)
                     converError
                   Aeson.Success a -> return a
  }

-- TODO: MonadThrow?
protobufSink :: (Monad m, ReflectDescriptor a, Wire a) => ResponseSink m a
protobufSink = ResponseSink
  { accept = "application/x-protobuf"
  , sink   = \_ _ -> do
               maybeInput <- await
               case maybeInput of
                 Just input -> go $ runGet messageGetM (LBS.fromStrict input)
                  where
                   go (ProtocolBuffers.Failed i s) = fail ("Failed at " ++ show i ++ " : " ++ s)
                   go (ProtocolBuffers.Finished _ _ a) = return a
                   go (ProtocolBuffers.Partial f) = f . fmap LBS.fromStrict <$> await >>= go
                 Nothing -> fail "No input."
  }

prepareRequest :: Endpoint -> RequestEncoder msg -> ByteString -> msg -> Request
prepareRequest (Endpoint request) (RequestEncoder contentType encode) accept msg = 
    setRequestHeader hContentType [contentType]
  $ setRequestHeader hAccept [accept]
  $ setRequestBodyLBS (encode msg) request

-- TODO: add status code check'
call
  :: (MonadUnliftIO m, Show res)
  => Endpoint
  -> RequestEncoder req
  -> ResponseSink m res
  -> req
  -> m res
call endpoing encoder (ResponseSink accept sink) msg
  = do
    let request = prepareRequest endpoing encoder accept msg  
    res <- httpSink request (sink request)
    liftIO $ print res
    return res

stream :: (MonadUnliftIO m) => Endpoint -> RequestEncoder req -> req -> m ()
stream endpoint encoder msg =  do
  let request = prepareRequest endpoint encoder "application/json" msg
  httpSink request (\_ -> Conduit.print)
  return ()