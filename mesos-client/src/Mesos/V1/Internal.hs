{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE PolyKinds #-}

module Mesos.V1.Internal where

-- TODO: мне не нужен Union общего назначения, нужен специализированный класс под протобуфер.
class UnionTag tag where
    type TaggedUnion tag 
    type UnionCase tag 

    construct :: proxy tag -> UnionCase tag -> TaggedUnion tag 
    extract :: proxy tag -> TaggedUnion tag -> Maybe (UnionCase tag)