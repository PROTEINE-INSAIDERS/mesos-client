{-# LANGUAGE DataKinds  #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Mesos.V1.Client.HTTP.Master.Call (module X, module Mesos.V1.Client.HTTP.Master.Call) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Master.Protos.Call as X
import Mesos.V1.Master.Protos.Call.Type as X

mkLabels [''Call]

genSingletons [''Type]