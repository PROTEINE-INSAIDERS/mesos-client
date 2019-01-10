{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}

module Mesos.V1.Internal.TaggedUnion where

import Data.Label
import Data.Label.Base as Label
import Data.Singletons
import Data.Typeable
import qualified Mesos.V1.Master.Call as Master.Call
import qualified Mesos.V1.Master.Event as Master.Event
import qualified Mesos.V1.Master.Response as Master.Response
import Text.ProtocolBuffers

import Control.Category
import Prelude hiding ((.), id)

class TaggedUnion a where
    type TagType a
    lTag :: a :-> Maybe (TagType a) 

instance TaggedUnion Master.Call.Call where
    type TagType Master.Call.Call = Master.Call.Type
    lTag = Master.Call.lType'

instance TaggedUnion Master.Event.Event where
    type TagType Master.Event.Event = Master.Event.Type
    lTag = Master.Event.lType'
    
instance TaggedUnion Master.Response.Response where
    type TagType Master.Response.Response = Master.Response.Type
    lTag = Master.Response.lType'
    
class UnionTag a where
    type UnionType a
    type CaseType a
    lCase :: proxy a -> UnionType a :-> Maybe (CaseType a)

unitCase :: a :-> Maybe () 
unitCase = lens (const $ Just ()) (const id)

instance UnionTag Master.Call.GET_HEALTH where
    type UnionType Master.Call.GET_HEALTH = Master.Call.Call
    type CaseType Master.Call.GET_HEALTH = ()
    lCase = const unitCase 

construct :: ( UnionTag a
             , TaggedUnion (UnionType a) 
             , Default (UnionType a)
             , SingI a
             , SingKind k
             , TagType (UnionType a) ~ Demote k
             ) => proxy (a :: k) -> CaseType a -> UnionType a 
construct proxy a =
    set lTag (Just $ fromSing (singByProxy proxy)) 
  . set (lCase proxy) (Just a)
  $ defaultValue 

data ExtractError = MissingTag | MismatchedTag | MissingField deriving ( Show, Typeable )

extract :: ( UnionTag a
           , TaggedUnion (UnionType a) 
           , SingI a
           , Eq (TagType (UnionType a))
           , SingKind k
           , TagType (UnionType a) ~ Demote k
           ) => proxy (a :: k) -> UnionType a -> Either ExtractError (CaseType a)
extract proxy a = case get lTag a of
    Just tag | tag == fromSing (singByProxy proxy) -> case get (lCase proxy) a of
        Just b -> Right b
        Nothing -> Left MissingField
    Just _ -> Left MismatchedTag
    Nothing -> Left MissingTag

-- aaaa = construct Master.Call.SGET_HEALTH ()
-- bbbb = extract Master.Call.SGET_HEALTH aaaa