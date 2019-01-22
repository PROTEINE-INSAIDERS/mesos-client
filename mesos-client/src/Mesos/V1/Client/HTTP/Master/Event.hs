{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TemplateHaskell
           , TypeFamilies
#-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Mesos.V1.Client.HTTP.Master.Event (module X, module Mesos.V1.Client.HTTP.Master.Event) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Master.Protos.Event as X
import Mesos.V1.Master.Protos.Event.Type as X

mkLabels [''Event]

genSingletons [''Type]