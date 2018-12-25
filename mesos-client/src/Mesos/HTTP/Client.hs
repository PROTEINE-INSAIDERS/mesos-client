{-# LANGUAGE OverloadedStrings #-}

module Mesos.HTTP.Client where

import           Control.Monad.Catch
import           Data.Aeson
import           Data.ByteString
import           Data.Conduit
import           Data.Conduit.Attoparsec
import           Data.Typeable
import           Mesos.HTTP.Client.Internal
import           Network.HTTP.Client
import           Network.HTTP.Simple

newConfiguration :: (MonadThrow m) => Manager -> String -> m Configuration
newConfiguration manager address = do
  request <- parseRequest address
  return Configuration
         { baseReqest = setRequestManager manager
                      $ setRequestMethod "POST"
                        request
         }

{-# DEPRECATED mesosRequest "Use Wobble instead" #-}
mesosRequest :: (MonadThrow m) => String -> m Request
mesosRequest url = do
  reqest <- parseRequest url
  return $ setRequestMethod "POST" reqest

-- синхронный запрос:
-- конфигурация
-- -> (закодированное сообщение)/(сообщение + энкодер)
-- -> декодирующий синк
-- -> m сообщение

-- можно задать маппинги на уровне типов из запроса в ответ и сделать
-- call :: Configuration -> encoder -> decoder -> a -> MesosResponse a
-- безтиповую версию положить в Internal, типизированные версии в
-- Client.V1.{endpoint_type}

jsonSink :: (MonadThrow m, FromJSON a) => Response () -> ConduitT ByteString Void m a
jsonSink response = do
  v <- sinkParser json'
  case fromJSON v of
    Error e   -> throwM $ FromJSONException v e
    Success a -> return a

data FromJSONException = FromJSONException Value String deriving (Show, Typeable)
instance Exception FromJSONException

-- добавить синхронный запрос: кодировщик запроса, кодировщик ответа,
-- выполняется запрос, проверяется код возврата, декодируется результат.

-- декодировать сообщение можно по частям (используюя онлайн парсинг из protobuf)
-- так и целиком.

-- добавить асинхронный запрос: кодировщик запроса, кодировщик ответа,
-- обработчик сообщений.
