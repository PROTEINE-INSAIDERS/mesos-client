{-# LANGUAGE TypeFamilies #-}

module Mesos.V1.Scheduler where

import           Mesos.V1.Internal
import           Mesos.V1.Scheduler.Call as Call
import           Mesos.V1.Scheduler.Event as Event

-- TODO: move to Call? (this wil introduce Mesos.V1.Scheduler.Call -> Mesos.V1.Scheduler.Event dep)
type instance EventOf Call.Call = Event.Event