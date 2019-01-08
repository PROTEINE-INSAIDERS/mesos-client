module Mesos.V1.Scheduler where

import           Mesos.V1.Scheduler.Protos.Call
import           Mesos.V1.Scheduler.Protos.Call.Type
import           Text.ProtocolBuffers
import           Mesos.V1.Scheduler.Protos.Call.Subscribe
import           Mesos.V1.Protos.FrameworkInfo 
import           Mesos.V1.Protos.FrameworkID

doSubscribe :: Subscribe -> Call
doSubscribe s = defaultValue 
    { type' = Just SUBSCRIBE 
    , subscribe = Just s
  --  , framework_id = TODO: взять айдишник из команды подписки.
    }
