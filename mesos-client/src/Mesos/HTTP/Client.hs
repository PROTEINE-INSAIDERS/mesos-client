{-# LANGUAGE OverloadedStrings #-}

module Mesos.HTTP.Client where

import           Control.Monad.Catch
import           Network.HTTP.Client

mesosRequest :: (MonadThrow m) => String -> m Request
mesosRequest addr  = do
  req <- parseRequest addr
  return req { method = "POST" }

-- добавить синхронный запрос: кодировщик запроса, кодировщик ответа,
-- выполняется запрос, проверяется код возврата, декодируется результат.

-- декодировать сообщение можно по частям (используюя онлайн парсинг из protobuf)
-- так и целиком. JSON сообщения можно декодировать только целиком.

-- добавить асинхронный запрос: кодировщик запроса, кодировщик ответа,
-- обработчик сообщений.

data MessageEncoder = MessageEncoder
