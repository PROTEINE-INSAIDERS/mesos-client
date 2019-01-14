{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE PolyKinds  #-}

module Mesos.V1.Internal (module X, module Mesos.V1.Internal) where

import Mesos.V1.Internal.TaggedUnion as X

{- # DEPRECATED EventOf "Should be mapped from tag" #-}
type family EventOf subscribe :: *

{- # DEPRECATED ResponseTo "Should be mapped from tag" #-}
type family ResponseTo request :: *

type family ResponseKind 

-- TODO: эта функция полиморфна по типу k, нужно связать запрос с ответом посредством инъективного в Type типа:
-- data family Request :: k1 -> k2 -> Type
-- data instance RequestTag :: DF -> DG -> Type where
--     RF1 :: RequestTag F1 G1 
type family ResponseTag (a :: k1) :: k2

data family CallTag :: k1 -> k2 -> * 