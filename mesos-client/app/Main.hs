{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DisambiguateRecordFields #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}

import Data.Proxy
import           Data.Aeson
import           Data.Either
import Mesos.HTTP.Client.Internal
import qualified Mesos.V1.Master               as Master
import qualified Mesos.V1.Master.Protos.Response
                                               as Master
import           Network.HTTP.Client            ( defaultManagerSettings
                                                , managerSetProxy
                                                , newManager
                                                , proxyEnvironment
                                                )
import           Text.ProtocolBuffers
import           Text.ProtocolBuffers.Basic
import           Text.ProtocolBuffers.Header
import qualified Mesos.V1.Scheduler            as Scheduler
import qualified Mesos.V1.Scheduler.Protos.Call.Subscribe
                                               as Scheduler
import qualified Mesos.V1.Scheduler.Protos.Event as Scheduler
import           Data.Sequence
import           Mesos.V1.Protos.FrameworkInfo  ( FrameworkInfo(..) )
import           Mesos.V1.Protos.FrameworkID    ( FrameworkID(..) )
import           Mesos.V1.Protos.FrameworkInfo.Capability
                                                ( Capability(..) )
import           Mesos.V1.Protos.FrameworkInfo.Capability.Type
                                                ( Type(..) )
import           Mesos.V1.Protos.Labels
import           Mesos.V1.Protos.Label
import           Mesos.V1.Internal
import Mesos.V1.Master.Protos.Call.Type as Master

-- import qualified Mesos.V1.Protos.FrameworkInfo as FrameworkInfo

fid = FrameworkID { value = uFromString "haskell prototype framework ID" }

multi_role = Capability { type' = Just MULTI_ROLE }

my_labels = Labels
        { labels = Label { key   = uFromString "mesos-client"
                         , value = Just $ uFromString "prototype"
                         }
                           <| Empty
        }

fin = FrameworkInfo { user             = uFromString "schernichkin"
                    , name = uFromString "haskell prototype framework"
                    , id               = Just fid
                    , failover_timeout = Just 5
                    , checkpoint       = Just True
                    , role             = Nothing
                    , roles            = uFromString "*" <| Empty
                    , hostname         = Nothing
                    , principal        = Just $ uFromString "schernichkin"
                    , webui_url        = Just $ uFromString "localhost"
                    , capabilities     = multi_role <| Empty
                    , labels           = Just my_labels
                    }

main :: IO ()
main = do
        let
          settings = managerSetProxy (proxyEnvironment Nothing) defaultManagerSettings
        man <- newManager settings
        endpoint <- newEndpoint man "http://localhost:5050/api/v1/scheduler"
        (res :: Master.Response) <- call endpoint
                                         jsonEncoder
                                         jsonDecoder
                                         (construct (Proxy :: Proxy Master.GET_HEALTH) ()) 
                                         -- let s = Scheduler.Subscribe { Scheduler.framework_info   = fin
         --                           , Scheduler.suppressed_roles = empty
         --                           }
        --stream endpoint M.jsonEncoder (M.jsonDecoder :: ResponseDecoder Scheduler.Event) (Scheduler.doSubscribe s)
        return ()
