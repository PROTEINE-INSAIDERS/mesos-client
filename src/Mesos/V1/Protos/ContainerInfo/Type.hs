{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerInfo.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = DOCKER
          | MESOS
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = DOCKER
  maxBound = MESOS

instance P'.Default Type where
  defaultValue = DOCKER

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 1 = Prelude'.Just DOCKER
toMaybe'Enum 2 = Prelude'.Just MESOS
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum DOCKER = 1
  fromEnum MESOS = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.ContainerInfo.Type") .
      toMaybe'Enum
  succ DOCKER = MESOS
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.ContainerInfo.Type"
  pred MESOS = DOCKER
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.ContainerInfo.Type"

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
  reflectEnum = [(1, "DOCKER", DOCKER), (2, "MESOS", MESOS)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.ContainerInfo.Type") ["Mesos", "V1"] ["Protos", "ContainerInfo"] "Type")
      ["Mesos", "V1", "Protos", "ContainerInfo", "Type.hs"]
      [(1, "DOCKER"), (2, "MESOS")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead