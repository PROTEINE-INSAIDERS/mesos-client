{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Image.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = APPC
          | DOCKER
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = APPC
  maxBound = DOCKER

instance P'.Default Type where
  defaultValue = APPC

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 1 = Prelude'.Just APPC
toMaybe'Enum 2 = Prelude'.Just DOCKER
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum APPC = 1
  fromEnum DOCKER = 2
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Image.Type") . toMaybe'Enum
  succ APPC = DOCKER
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Image.Type"
  pred DOCKER = APPC
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Image.Type"

instance P'.Wire Type where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Type

instance P'.MessageAPI msg' (msg' -> Type) Type where
  getVal m' f' = f' m'

instance P'.ReflectEnum Type where
  reflectEnum = [(1, "APPC", APPC), (2, "DOCKER", DOCKER)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.Image.Type") ["Mesos", "V1"] ["Protos", "Image"] "Type")
      ["Mesos", "V1", "Protos", "Image", "Type.hs"]
      [(1, "APPC"), (2, "DOCKER")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead