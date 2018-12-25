module Mesos.HTTP.Client.Internal where

-- import           Control.Monad.Catch
import           Conduit
import           Data.ByteString.Lazy (ByteString)
-- import           Network.HTTP.Client
import           Network.HTTP.Simple

data Configuration = Configuration
  { baseReqest :: Request
  } deriving Show

call :: (MonadUnliftIO m) => Configuration
                  -> (Request -> request -> ByteString)
                  -> request
                  -> m ()
call config = do
  -- httpSink
  undefined
