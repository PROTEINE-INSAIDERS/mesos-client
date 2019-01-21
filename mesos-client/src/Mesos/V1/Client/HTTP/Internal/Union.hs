{-# LANGUAGE TypeFamilies
           , TypeOperators
           , PolyKinds
           , ConstraintKinds
           , FlexibleContexts 
#-}

module Mesos.V1.Client.HTTP.Internal.Union where

import           Control.Monad.Catch
import           Data.Label
import           Data.Singletons
import           Data.Typeable
import           Text.ProtocolBuffers

class UnionTag a where
    type Union a
    lTag :: Union a :-> Maybe a

class UnionCase (a :: k) where
    type Case a
    lCase :: p a -> Union (Demote k) :-> Maybe (Case a)

-- | Helper lense for unit-value unions (enums). 
lUnitCase :: a :-> Maybe ()
lUnitCase = lens (const $ Just ()) (const id)


type Construct (a :: k)  = ( SingKind k
                           , SingI a
                           , UnionCase (a :: k)
                           , UnionTag (Demote k)
                           , Default (Union (Demote k))
                           )

construct :: Construct (a :: k) => p a -> Case a -> Union (Demote k)
construct p a =
    set lTag (Just $ fromSing $ singByProxy p)
  $ set (lCase p) (Just a)
    defaultValue 
    
data ExtractException = MissingTagException 
                      | MismatchedTagException 
                      | MissingFieldException deriving ( Show, Typeable )
instance Exception ExtractException 

type Extract (a :: k) = ( SingKind k
                        , SingI a
                        , UnionCase (a :: k)
                        , UnionTag (Demote k)
                        , Eq (Demote k)
                        )

extract :: ( MonadThrow m
           , Extract (a :: k)
           ) => p a -> Union (Demote k) -> m (Case a)
extract tag a = case get lTag a of
    Just tagValue | tagValue == (fromSing $ singByProxy $ tag) ->
        case get (lCase tag) a of
            Just b  -> return b
            Nothing -> throwM MissingFieldException
    Just _  -> throwM MismatchedTagException
    Nothing -> throwM MissingTagException 