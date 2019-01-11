{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE PolyKinds  #-}

module Mesos.V1.Internal (module X, module Mesos.V1.Internal) where

import Mesos.V1.Internal.TaggedUnion as X

{- # DEPRECATED EventOf "Should be mapped from tag" #-}
type family EventOf subscribe :: *

{- # DEPRECATED ResponseTo "Should be mapped from tag" #-}
type family ResponseTo request :: *

type family ResponseTag (a :: k1) :: k2