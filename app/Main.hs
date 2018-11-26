{-# LANGUAGE OverloadedStrings #-}

import           Network.HTTP.Client

-- TODO:
-- Разделить интерфейс на два вида ответов
-- 200 - обработано немедленно.
-- 202 - поточная обработка.

main :: IO ()
main = do
    let settings = managerSetProxy
            (proxyEnvironment Nothing)
            defaultManagerSettings
    man <- newManager settings
    let req = "http://localhost:5050/api/v1"
            { method = "POST"
            , requestBody = RequestBodyLBS "{ \"type\": \"GET_HEALTH\" }"
            , requestHeaders = [ ("Content-Type", "application/json")
                               , ("Accept", "application/x-protobuf")
                               ]
            }
    httpLbs req man >>= print
