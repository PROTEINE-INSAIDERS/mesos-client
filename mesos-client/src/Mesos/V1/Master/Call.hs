{-# LANGUAGE DataKinds  #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Mesos.V1.Master.Call (module X, module Mesos.V1.Master.Call) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Master.Protos.Call as X
import Mesos.V1.Master.Protos.Call.Type as X
import    qualified      Language.Haskell.TH as TH


mkLabels [''Call]

genSingletons [''Type]

-- test = putStrLn $ TH.pprint $ genSingletons [''Type]
