{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE ConstraintKinds #-}

module Mesos.V1.Internal.TaggedUnion where

import           Control.Monad.Catch
import           Data.Label
import           Data.Label.Base               as Label
import           Data.Singletons
import           Data.Typeable
import qualified Mesos.V1.Master.Call          as Master.Call
import qualified Mesos.V1.Master.Event         as Master.Event
import qualified Mesos.V1.Master.Response      as Master.Response
import           Text.ProtocolBuffers

class TaggedUnion a where
    type TagType a 
    lTag :: a :-> Maybe (TagType a)

-- TODO: Implement TaggedUnion instance for all mesos unions.  
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
    type UnionType a  -- ^ Type of the union denoted by the promoted tag. 
    type CaseType a   -- ^ Type of the union case denoted by the promoted tag.
    lCase :: a -> UnionType a :-> Maybe (CaseType a)
    -- ^ Lense to field in union type containing case denoted by given tag.
    -- Firt argument should be singleton type and used only for type inference.   

-- | Helper lense for unit-value unions (enums). 
unitCase :: a :-> Maybe ()
unitCase = lens (const $ Just ()) (const id)

-- TODO: Implement tags for all mesos unions.
instance UnionTag (Sing Master.Call.GET_HEALTH) where
    type UnionType (Sing Master.Call.GET_HEALTH) = Master.Call.Call
    type CaseType (Sing Master.Call.GET_HEALTH) = ()
    lCase = const unitCase

type Construct (a :: k)  = ( SingKind k
                           , UnionTag (Sing (a :: k))
                           , TagType (UnionType (Sing (a :: k))) ~ Demote k
                           , TaggedUnion (UnionType (Sing a))
                           , Default (UnionType (Sing a))
                           )

construct :: Construct (a :: k) => Sing a -> CaseType (Sing a) -> UnionType (Sing a)
construct tag a = 
      set lTag (Just $ fromSing tag)
    . set (lCase tag) (Just a) 
    $ defaultValue
    
data ExtractException = MissingTagException 
                      | MismatchedTagException 
                      | MissingFieldException deriving ( Show, Typeable )
instance Exception ExtractException 

type Extract (a :: k) = ( SingKind k
                        , UnionTag (Sing (a :: k))
                        , TagType (UnionType (Sing (a :: k))) ~ Demote k
                        , TaggedUnion (UnionType (Sing a)) 
                        , Eq (TagType (UnionType (Sing a)))
                        )

extract :: ( MonadThrow m
           , Extract (a :: k)
           ) => Sing a -> UnionType (Sing a) -> m (CaseType (Sing a))
extract tag a = case get lTag a of
    Just tagValue | tagValue == fromSing tag ->
        case get (lCase tag) a of
            Just b  -> return b
            Nothing -> throwM MissingFieldException
    Just _  -> throwM MismatchedTagException
    Nothing -> throwM MissingTagException 