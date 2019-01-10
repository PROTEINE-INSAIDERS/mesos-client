{-# LANGUAGE ScopedTypeVariables #-}

module Mesos.V1.Client.HTTP.Scheduler where

import UnliftIO
import Mesos.V1.Protos.FrameworkID
import Mesos.V1.Client.HTTP.Internal
import qualified Mesos.V1.Scheduler.Call as Call
import qualified Mesos.V1.Client.HTTP.Internal as Internal 
import Mesos.V1.Scheduler


newtype SchedulerT m a = SchedulerT { runSchedulerT :: FrameworkID -> m a  }

--TODO: add codec
subscribe :: (MonadUnliftIO m) => Endpoint -> SchedulerT m a -> m a 
subscribe endpoint sheduler = Internal.subscribe endpoint Internal.jsonEncoder Internal.jsonDecoder (undefined :: Call.Call) undefined

teardown ::  SchedulerT m ()
teardown = undefined -- TODO: send teardown message with the current FrameworkID