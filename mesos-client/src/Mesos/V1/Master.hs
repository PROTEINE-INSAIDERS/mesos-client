module Mesos.V1.Master where

import           Mesos.V1.Master.Protos.Call
import           Mesos.V1.Master.Protos.Call.Type
import           Text.ProtocolBuffers

getHealth :: Call
getHealth = defaultValue { type' = Just GET_HEALTH }
