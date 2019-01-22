{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TemplateHaskell
           , TypeFamilies
#-}

module Mesos.V1.Client.HTTP.Scheduler.Call (module X, module Mesos.V1.Client.HTTP.Scheduler.Call) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Scheduler.Protos.Call as X
import Mesos.V1.Scheduler.Protos.Call.Type as X

mkLabels [''Call]

genSingletons [''Type]