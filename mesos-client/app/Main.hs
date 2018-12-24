{-# LANGUAGE OverloadedStrings #-}

import           Data.Aeson
import           Data.Either
import           Mesos.HTTP.Client
import           Mesos.V1.Master
import qualified Mesos.V1.Master.Protos.Response as Master
import           Network.HTTP.Client
import           Text.ProtocolBuffers
import           Text.ProtocolBuffers.Basic
import           Text.ProtocolBuffers.Header

-- TODO:
-- Разделить интерфейс на два вида ответов
-- 200 - обработано немедленно.
-- 202 - поточная обработка.

-- виды коммуникации с сервером:

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
    initReq <- mesosRequest "http://localhost:5050/api/v1"
    let req = initReq { requestBody = RequestBodyLBS getHealthLBS
            , requestHeaders = [ ("Content-Type", "application/x-protobuf")
                               , ("Accept", "application/x-protobuf")
                               ]
            }
    res <- httpLbs req man
    print "Response: "
    print res
    print "Proto: "
    let pres =  parseResponse  $ responseBody res
    print $ pres
    print $ encode pres
    return ()
