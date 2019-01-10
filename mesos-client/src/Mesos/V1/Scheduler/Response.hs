{-# LANGUAGE TemplateHaskell #-}

module Mesos.V1.Scheduler.Response (module X, module Mesos.V1.Scheduler.Response) where

import Data.Label 
import Mesos.V1.Scheduler.Protos.Response as X
import Mesos.V1.Scheduler.Protos.Response.Type as X

mkLabels [''Response]