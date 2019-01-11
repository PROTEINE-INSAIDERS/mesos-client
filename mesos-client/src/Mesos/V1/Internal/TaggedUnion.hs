{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE FlexibleContexts #-}

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
import Data.Kind

class TaggedUnion (a :: *) where
    type TagType a :: *
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

-- | Promoted union tag.
class ( TaggedUnion (UnionType a) -- ^ Union type should be tagged union.
      , SingI a  -- ^ 'a' should be 'SingI' to obtain singleton from a proxy.
      , SingKind k -- ^ 'k' should be 'SingKind' to demote promoted tag.  
      , TagType (UnionType a) ~ Demote k -- ^ Type of the tag of the tagged union should match type of demoted tag.
      , Default (UnionType a) -- ^ 'Default' if required for union type construction.
      , Eq (TagType (UnionType a)) -- ^ 'Eq' is requared for tag equality checking.
      ) => UnionTag (a :: k) where
    type UnionType a :: * -- ^ Type of the union denoted by the promoted tag. 
    type CaseType a  :: * -- ^ Type of the union case denoted by the promoted tag.
    lCase :: Sing a -> UnionType a :-> Maybe (CaseType a)
    -- ^ Lense to field in union type containing case denoted by given tag.
    -- Firt argument should be singleton type and used only for type inference.   

-- | Helper lense for unit-value unions (enums). 
unitCase :: a :-> Maybe ()
unitCase = lens (const $ Just ()) (const id)

-- TODO: Implement tags for all mesos unions.
instance UnionTag Master.Call.GET_HEALTH where
    type UnionType Master.Call.GET_HEALTH = Master.Call.Call
    type CaseType Master.Call.GET_HEALTH = ()
    lCase = const unitCase

construct :: UnionTag a => Sing a -> CaseType a -> UnionType a
construct proxy a =
    set lTag (Just $ fromSing (singByProxy proxy))
        . set (lCase proxy) (Just a)
        $ defaultValue

data ExtractException = MissingTagException 
                      | MismatchedTagException 
                      | MissingFieldException deriving ( Show, Typeable )
instance Exception ExtractException 

extract :: ( UnionTag a, MonadThrow m ) => Sing a -> UnionType a -> m (CaseType a)
extract proxy a = case get lTag a of
    Just tag | tag == fromSing proxy ->
        case get (lCase proxy) a of
            Just b  -> return b
            Nothing -> throwM MissingFieldException
    Just _  -> throwM MismatchedTagException
    Nothing -> throwM MissingTagException