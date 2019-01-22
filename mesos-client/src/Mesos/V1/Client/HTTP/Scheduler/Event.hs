{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TemplateHaskell
           , TypeFamilies
#-}

module Mesos.V1.Client.HTTP.Scheduler.Event (module X, module Mesos.V1.Client.HTTP.Scheduler.Event) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Scheduler.Protos.Event as X
import Mesos.V1.Scheduler.Protos.Event.Type as X

mkLabels [''Event]

genSingletons [''Type]