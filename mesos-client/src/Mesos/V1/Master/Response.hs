{-# LANGUAGE TemplateHaskell #-}

module Mesos.V1.Master.Response (module X, module Mesos.V1.Master.Response) where

import Data.Label 
import Mesos.V1.Master.Protos.Response as X
import Mesos.V1.Master.Protos.Response.Type as X

mkLabels [''Response]