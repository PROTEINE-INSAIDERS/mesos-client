{-# LANGUAGE OverloadedStrings #-}

import           Data.Aeson
import           Data.Either
import           Mesos.HTTP.Client
import           Mesos.HTTP.Client.Internal    as M
import           Mesos.V1.Master
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

-- TODO:
-- Разделить интерфейс на два вида ответов
-- 200 - обработано немедленно.
-- 202 - поточная обработка.

-- виды коммуникации с сервером:

getHealthLBS = messagePut getHealth

parseResponse :: ByteString -> Master.Response
parseResponse bs = case messageGet bs of
    Left  e        -> error e
    Right (msg, _) -> msg

main :: IO ()
main = do
    let settings =
            managerSetProxy (proxyEnvironment Nothing) defaultManagerSettings
    man      <- newManager settings
    endpoint <- newEndpoint man "http://localhost:5050/api/v1"
{-
    request' <- mesosRequest "http://localhost:5050/api/v1"
    let request = addRequestHeader "Content-Type" "application/x-protobuf"
                $ addRequestHeader "Accept" "application/x-protobuf"
                $ setRequestManager man
                $ setRequestBodyLBS getHealthLBS
                $ request'
-}
    res      <- call endpoint M.jsonEncoder getHealth
    res      <- call endpoint M.protobufEncoder getHealth
    return ()
