{-# LANGUAGE TemplateHaskell #-}

module Mesos.V1.Scheduler.Event (module X, module Mesos.V1.Scheduler.Event) where

import Data.Label 
import Mesos.V1.Scheduler.Protos.Event as X
import Mesos.V1.Scheduler.Protos.Event.Type as X

mkLabels [''Event]