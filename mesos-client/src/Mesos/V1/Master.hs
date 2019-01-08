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
import           Text.ProtocolBuffers

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
