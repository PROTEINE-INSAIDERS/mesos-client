{-# LANGUAGE OverloadedStrings #-}

import           Data.Either
import           Mesos.V1.Master.Protos.Call
import           Mesos.V1.Master.Protos.Call.Type
import qualified Mesos.V1.Master.Protos.Response  as Master
import           Network.HTTP.Client
import           Text.ProtocolBuffers
import           Text.ProtocolBuffers.Basic

-- TODO:
-- Разделить интерфейс на два вида ответов
-- 200 - обработано немедленно.
-- 202 - поточная обработка.

getHealth :: Call
getHealth = defaultValue { type' = Just GET_HEALTH }

getHealthLBS = messagePut getHealth

parseResponse :: ByteString -> Master.Response
parseResponse bs = case messageGet bs of
                     Left e         -> error e
                     Right (msg, _) -> msg

main :: IO ()
main = do
    let settings = managerSetProxy
            (proxyEnvironment Nothing)
            defaultManagerSettings
    man <- newManager settings
    let req = "http://localhost:5050/api/v1"
            { method = "POST"
            , requestBody = RequestBodyLBS getHealthLBS
            , requestHeaders = [ ("Content-Type", "application/x-protobuf")
                               , ("Accept", "application/x-protobuf")
                               ]
            }
    res <- httpLbs req man
    print "Response: "
    print res
    print "Proto: "
    print $ parseResponse  $ responseBody res
    return ()
