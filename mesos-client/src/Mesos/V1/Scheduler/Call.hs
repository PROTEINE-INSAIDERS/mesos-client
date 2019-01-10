{-# LANGUAGE DataKinds  #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Mesos.V1.Scheduler.Call (module X, module Mesos.V1.Scheduler.Call) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Scheduler.Protos.Call as X
import Mesos.V1.Scheduler.Protos.Call.Type as X


mkLabels [''Call]

genSingletons [''Type]