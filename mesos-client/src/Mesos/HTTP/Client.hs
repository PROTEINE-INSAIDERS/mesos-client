{-# LANGUAGE OverloadedStrings #-}

module Mesos.HTTP.Client where

import           Control.Monad.Catch
import           Data.Aeson
import           Data.ByteString
import           Data.Conduit
import           Data.Typeable
import           Mesos.HTTP.Client.Internal as Mesos
import           Network.HTTP.Client
import           Network.HTTP.Simple
import           Network.HTTP.Types

-- синхронный запрос:
-- конфигурация
-- -> (закодированное сообщение)/(сообщение + энкодер)
-- -> декодирующий синк
-- -> m сообщение

-- можно задать маппинги на уровне типов из запроса в ответ и сделать
-- call :: Configuration -> encoder -> decoder -> a -> MesosResponse a
-- безтиповую версию положить в Internal, типизированные версии в
-- Client.V1.{endpoint_type}

-- добавить синхронный запрос: кодировщик запроса, кодировщик ответа,
-- выполняется запрос, проверяется код возврата, декодируется результат.

-- декодировать сообщение можно по частям (используюя онлайн парсинг из protobuf)
-- так и целиком.

-- добавить асинхронный запрос: кодировщик запроса, кодировщик ответа,
-- обработчик сообщений.
