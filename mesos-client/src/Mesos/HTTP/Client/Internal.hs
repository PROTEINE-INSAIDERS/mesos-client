{-# LANGUAGE OverloadedStrings #-}

module Mesos.HTTP.Client.Internal where

import           Conduit
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
import           Text.ProtocolBuffers.Get       ( Result(..) )

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
  } deriving (Typeable)

jsonEncoder :: (ToJSON a) => RequestEncoder a
jsonEncoder =
  RequestEncoder { contentType = "application/json", encode = Aeson.encode }

protobufEncoder :: (ReflectDescriptor a, Wire a) => RequestEncoder a
protobufEncoder =
  RequestEncoder { contentType = "application/x-protobuf", encode = messagePut }

data ResponseSink m a = ResponseSink
  { accept :: ByteString
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
                   go (Failed i s) = fail ("Failed at " ++ show i ++ " : " ++ s)
                   go (Finished _ _ a) = return a
                   go (Partial f) = f . fmap LBS.fromStrict <$> await >>= go
                 Nothing -> fail "No input."
  }

-- TODO: add status code check
call
  :: (MonadUnliftIO m, Show res)
  => Endpoint
  -> RequestEncoder req
  -> ResponseSink m res
  -> req
  -> m res
call (Endpoint request') (RequestEncoder contentType encode) (ResponseSink accept sink) msg
  = do
    let request =
          setRequestHeader hContentType [contentType]
            $ setRequestHeader hAccept [accept]
            $ setRequestBodyLBS (encode msg) request'
    res <- httpSink request (sink request)
    liftIO $ print res
    return res

stream :: (MonadUnliftIO m) => Endpoint -> RequestEncoder req -> req -> m ()
stream (Endpoint request') (RequestEncoder contentType encode) msg = do
  _
