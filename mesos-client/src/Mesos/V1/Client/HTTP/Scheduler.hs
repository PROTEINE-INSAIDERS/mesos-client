{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}

module Mesos.V1.Client.HTTP.Scheduler where

import Control.Applicative
import Control.Monad    
import Control.Monad.Trans.Class 
import Control.Monad.Trans.Reader
import Control.Monad.IO.Class
import Control.Monad.Fail 
import Control.Monad.Fix
import Control.Monad.Zip
import Data.Conduit
import Mesos.V1.Protos.FrameworkID
import Mesos.V1.Client.HTTP.Internal
import qualified Mesos.V1.Client.HTTP.Scheduler.Call as Call
import qualified Mesos.V1.Client.HTTP.Internal as Internal
import UnliftIO

newtype SubscriptionT m a = SubscriptionT { unSubscriptionT :: ReaderT FrameworkID m a } 
    deriving ( Functor, Applicative, Alternative,
               Monad, MonadFail, MonadPlus, MonadFix, MonadTrans, MonadIO, MonadZip )

type SubscriptionC i o m a = ConduitT i o (SubscriptionT m) a

subscriptionC :: Monad m => (FrameworkID -> ConduitT i o m a) -> SubscriptionC i o m a 
subscriptionC k = do 
    i <- lift $ SubscriptionT ask
    transPipe lift (k i) 

teardown :: SubscriptionC i o m ()
teardown = undefined -- TODO: send teardown message with the current FrameworkID

test = do 
    teardown
    teardown
{-
--TODO: add codec
subscribe :: (MonadUnliftIO m) => Endpoint -> SchedulerT m a -> m a 
subscribe endpoint sheduler = Internal.subscribe endpoint Internal.jsonEncoder Internal.jsonDecoder (undefined :: Call.Call) undefined

teardown ::  SchedulerT m ()
-}
{- что-то такое надо использовать для передачи frameworkid
readerC :: Monad m => (r -> ConduitT i o m a) -> ConduitT i o (R.ReaderT r m) a
readerC k = do
    i <- lift R.ask
    transPipe lift (k i)

runReaderC :: Monad m => r -> ConduitT i o (R.ReaderT r m) res -> ConduitT i o m res
runReaderC r = transPipe (`R.runReaderT` r)

stateC
  :: Monad m =>
     (s -> ConduitT i o m (a, s)) -> ConduitT i o (SS.StateT s m) a
stateC k = do
    s <- lift SS.get
    (r, s') <- transPipe lift (k s)
    lift (SS.put s')
    return r
-}