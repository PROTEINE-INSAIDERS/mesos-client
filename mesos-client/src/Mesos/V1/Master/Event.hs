{-# LANGUAGE TemplateHaskell #-}

module Mesos.V1.Master.Event (module X, module Mesos.V1.Master.Event) where

import Data.Label 
import Mesos.V1.Master.Protos.Event as X
import Mesos.V1.Master.Protos.Event.Type as X

mkLabels [''Event]