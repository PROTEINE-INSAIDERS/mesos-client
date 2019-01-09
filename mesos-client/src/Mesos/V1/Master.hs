{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE  TypeFamilies #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}

module Mesos.V1.Master where

import qualified Mesos.V1.Master.Protos.Call as Master
import qualified Mesos.V1.Master.Protos.Call.Type as Master
import           Text.ProtocolBuffers
import Data.Singletons.TH
import Mesos.V1.Internal

-- $(genSingletons [''Master.Type ])

-- часть логики можно убрать, если предоставить линзу и имя тэга.

instance UnionTag Master.GET_HEALTH where
    type TaggedUnion Master.GET_HEALTH = Master.Call
    type UnionCase Master.GET_HEALTH = ()

    construct _ _ = defaultValue { Master.type' = Just Master.GET_HEALTH } 
    extract _ a = case Master.type' a of 
        Just Master.GET_HEALTH -> Just ()
        _ -> Nothing