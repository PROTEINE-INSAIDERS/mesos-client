{-# LANGUAGE OverloadedStrings #-}

module Mesos.HTTP.Client.Internal where

-- import           Control.Monad.Catch
import           Conduit
import qualified Data.ByteString.Lazy          as LBS
-- import           Network.HTTP.Client
import           Control.Monad.Catch
import           Data.Aeson                     ( FromJSON
                                                , ToJSON
                                                )
import qualified Data.Aeson                    as Aeson
import           Data.ByteString
import           Data.Conduit.Attoparsec        ( sinkParser )
import           Data.Typeable
import           Network.HTTP.Client            ( Manager )
import           Network.HTTP.Simple
import           Network.HTTP.Types
import           Text.ProtocolBuffers

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
  , sink :: ConduitT ByteString Void m a
  }

jsonSink :: (MonadThrow m, FromJSON a) => ResponseSink m a  -- ConduitT ByteString Void m a
jsonSink = ResponseSink 
  { accept = "application/json"
  , sink = do 
      v <- sinkParser Aeson.json'
      case Aeson.fromJSON v of
        Aeson.Error   e -> throwM $ FromJSONException v e
        Aeson.Success a -> return a  
  }

data FromJSONException = FromJSONException Aeson.Value String deriving (Show, Typeable)
instance Exception FromJSONException

call :: (MonadUnliftIO m) => Endpoint -> RequestEncoder req -> req -> m ()
call (Endpoint request) (RequestEncoder contentType encode) msg = do
  res <-
    httpLBS
    $ setRequestHeader hContentType [contentType]
    $ setRequestHeader "Accept"     ["application/json"]
    $ setRequestBodyLBS (encode msg) request
  liftIO $ print res
