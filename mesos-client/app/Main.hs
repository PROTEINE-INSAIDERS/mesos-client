{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

import           Data.Aeson
import           Data.Either
import           Mesos.HTTP.Client
import           Mesos.HTTP.Client.Internal    as M
import qualified          Mesos.V1.Master as Master
import qualified Mesos.V1.Master.Protos.Response
                                               as Master
import           Network.HTTP.Client            ( defaultManagerSettings
                                                , managerSetProxy
                                                , newManager
                                                , proxyEnvironment
                                                )
import           Network.HTTP.Simple
import           Text.ProtocolBuffers
import           Text.ProtocolBuffers.Basic
import           Text.ProtocolBuffers.Header
import qualified Mesos.V1.Scheduler as Scheduler
import qualified Mesos.V1.Scheduler.Protos.Call.Subscribe  as Scheduler
import Data.Sequence
import Mesos.V1.Protos.FrameworkInfo (FrameworkInfo)

main :: IO ()
main = do
    let settings =
            managerSetProxy (proxyEnvironment Nothing) defaultManagerSettings
    man      <- newManager settings
    endpoint <- newEndpoint man "http://localhost:5050/api/v1"
    (res :: Master.Response) <- call endpoint M.protobufEncoder M.protobufSink Master.getHealth
    let s =  Scheduler.Subscribe 
         { Scheduler.framework_info = _
         , Scheduler.suppressed_roles = empty
         }
    stream endpoint M.jsonEncoder (Scheduler.doSubscribe s)
    return ()
