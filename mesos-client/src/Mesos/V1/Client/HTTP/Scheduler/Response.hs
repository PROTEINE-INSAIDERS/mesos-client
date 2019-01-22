{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TemplateHaskell
           , TypeFamilies
#-}

module Mesos.V1.Client.HTTP.Scheduler.Response (module X, module Mesos.V1.Client.HTTP.Scheduler.Response) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Scheduler.Protos.Response as X
import Mesos.V1.Scheduler.Protos.Response.Type as X

mkLabels [''Response]

genSingletons [''Type]