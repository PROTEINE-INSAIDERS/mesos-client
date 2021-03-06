{-# LANGUAGE OverloadedStrings
           , FlexibleContexts
           , TypeFamilies
           , ScopedTypeVariables
           , PolyKinds
           , TypeApplications
#-}

module Mesos.V1.Client.HTTP.Internal
  ( module Mesos.V1.Client.HTTP.Internal
  , module X
  )
where

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
import           Mesos.V1.Client.HTTP.Internal.Union
                                               as X
import qualified Network.HTTP.Client           as HTTP
import           Network.HTTP.Client            ( Manager )
import           Network.HTTP.Simple            ( Request )
import qualified Network.HTTP.Simple           as HTTP
import qualified Network.HTTP.Types            as HTTP
import           Text.ProtocolBuffers
import qualified Text.ProtocolBuffers.Get      as ProtocolBuffers
import           UnliftIO.Exception
import           Data.Singletons
import           Mesos.V1.Client.HTTP.Internal.Codec
                                               as X

data family CallTag :: k1 -> k2 -> *

newtype Endpoint = Endpoint
  { request :: Request
  } deriving (Typeable, Show)

newEndpoint :: (MonadThrow m) => Manager -> String -> m Endpoint
newEndpoint manager address = do
  request <- HTTP.parseRequest address
  return Endpoint
    { request = HTTP.setRequestManager manager
                  $ HTTP.setRequestMethod HTTP.methodPost request
    }

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

prepareRequest
  :: Endpoint -> RequestEncoder msg -> ByteString -> Int -> msg -> Request
prepareRequest (Endpoint request) (RequestEncoder contentType encode) accept acceptStatus msg
  = HTTP.setRequestHeader HTTP.hContentType [contentType]
    $ HTTP.setRequestHeader HTTP.hAccept [accept]
    $ HTTP.setRequestBodyLBS
        (encode msg)
        request
          { HTTP.checkResponse =
            \request response ->
              when (HTTP.getResponseStatusCode response /= acceptStatus) $ do
                chunk <- HTTP.brReadSome (HTTP.responseBody response) 1024
                let
                  ex = HTTP.StatusCodeException (void response)
                                                (LBS.toStrict chunk)
                throwIO $ HTTP.HttpExceptionRequest request ex
          }

call
  :: forall k1 k2 (a :: k1) (b :: k2) m
   . (MonadUnliftIO m, Construct a, Extract b)
  => CallTag a b
  -> Endpoint
  -> Case a
  -> Codec (Union (Demote k1)) (Union (Demote k2))
  -> m (Case b)
call _ endpoint msg (Codec encoder decoder) = do
  let requestMsg = construct (sing @a) msg
      request = prepareRequest endpoint encoder (accept decoder) 200 requestMsg
  responseUnion <- HTTP.httpSink request $ \_ -> decoderSink $ decode decoder
  liftIO $ extract (sing @b) responseUnion

decoderTransfomer
  :: (MonadIO m) => (ByteString -> DecodeResult a) -> ConduitT ByteString a m ()
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
{-
-- TODO: make more specific (accept only subscribe calls specific for the current endpoint).
subscribe :: (MonadUnliftIO m, Show (EventOf a)) => Endpoint -> RequestEncoder a -> ResponseDecoder (EventOf a) -> a -> ConduitT (EventOf a) Void m r -> m r
subscribe endpoint encoder decoder msg sink = do
  let request = prepareRequest endpoint encoder (accept decoder) msg
  HTTP.httpSink request $ \_ -> recordIOTransformer 
                             .| logger "RecordIO" 
                             .| decoderTransfomer (decode decoder) 
                             .| logger "Message" 
                             .| sink 
-}
