{- # LANGUAGE OverloadedStrings #-}
{- # LANGUAGE DisambiguateRecordFields #-}

import           Network.HTTP.Client            ( defaultManagerSettings
                                                , managerSetProxy
                                                , newManager
                                                , proxyEnvironment
                                                )
import Mesos.V1.Client.HTTP.Master

{-
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
-}
main :: IO ()
main = do
        let
          settings = managerSetProxy (proxyEnvironment Nothing) defaultManagerSettings
        man <- newManager settings
        endpoint <- newEndpoint man "http://localhost:5050/api/v1"
        a  <- getHealth endpoint jsonCodec
        Prelude.print a
        b <- getFlags  endpoint protobufCodec
        Prelude.print b
        return ()