<<<<<<< HEAD
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
=======
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}

module Mesos.V1.Master where

import Data.Singletons
import qualified Mesos.V1.Master.Protos.Call   as Call
import qualified Mesos.V1.Master.Protos.Call.Type
                                               as Call
import qualified Mesos.V1.Master.Protos.Response.Type
                                               as Response
import qualified Mesos.V1.Master.Protos.Response.GetHealth
                                               as Response
>>>>>>> 6e6b1b1cc0c57732d46bdce56b12c4eeadba2304
import           Text.ProtocolBuffers
import Data.Singletons.TH
import Mesos.V1.Internal

-- $(genSingletons [''Master.Type ])

-- часть логики можно убрать, если предоставить линзу и имя тэга.

instance UnionTag Master.GET_HEALTH where
    type TaggedUnion Master.GET_HEALTH = Master.Call
    type UnionCase Master.GET_HEALTH = ()

<<<<<<< HEAD
    construct _ _ = defaultValue { Master.type' = Just Master.GET_HEALTH } 
    extract _ a = case Master.type' a of 
        Just Master.GET_HEALTH -> Just ()
        _ -> Nothing
=======
{-
-- TODO: 
-- 1. Создать мэппинги типов между запросами и ответами.
-- 2. Создать Union типы для событий. Возможно имеет смысл создать Unions для всех типов 
--    сообщений, но это не точно 
-- 3. Возможно имеет смысл закодировать тип call/responce, call/event.

-- TODO: это общий паттерн для всех компонентов.
type family Response (a :: Call.Type) :: *

type instance Response Call.GET_HEALTH = Int
-- arg: Call.Type - call-type всегда есть но иногда он может означать необходимость наличия 
-- некоторого call-сообщения, но не всегда. Это означает, что call-сообщение находтся в функциональной 
-- зависимости от Call.Type и call-сообщение может быть Unit. 
-- result: Response.GetHealth или Response.GET_HEALTH? Возможно нам следует кодировать больше информации..
-}
class Call (a :: Call.Type) where
    type Request a :: *
    type Response a :: *
    reify :: Demote a

instance Call Call.GET_HEALTH where
    type Request Call.GET_HEALTH = ()
    type Response Call.GET_HEALTH = Response.GetHealth

getHealth :: Call.Call
getHealth = defaultValue { Call.type' = Just Call.GET_HEALTH }
>>>>>>> 6e6b1b1cc0c57732d46bdce56b12c4eeadba2304
