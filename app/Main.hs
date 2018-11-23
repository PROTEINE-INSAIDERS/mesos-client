{-# LANGUAGE OverloadedStrings #-}

import           Network.HTTP.Client

-- TODO:
-- 1. Write scripts to download .proto and generate files
-- e.g. wget ...
--      hprotoc -d src -Iproto -p  Mesos.V1 -l proto/mesos/v1/mesos.proto proto/mesos/v1/scheduler/scheduler.proto
-- 2. Add operator API

main :: IO ()
main = do
    let settings = managerSetProxy
            (proxyEnvironment Nothing)
            defaultManagerSettings
    man <- newManager settings
    let req = "http://localhost:5050/api/v1"
            { method = "POST"
            , requestBody = RequestBodyLBS "{ \"type\": \"GET_HEALTH\" }"
            , requestHeaders = [ ("Content-Type", "application/json") ]
            }
    httpLbs req man >>= print
