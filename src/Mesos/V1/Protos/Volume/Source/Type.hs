{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Volume.Source.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | DOCKER_VOLUME
          | HOST_PATH
          | SANDBOX_PATH
          | SECRET
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = SECRET

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just DOCKER_VOLUME
toMaybe'Enum 4 = Prelude'.Just HOST_PATH
toMaybe'Enum 2 = Prelude'.Just SANDBOX_PATH
toMaybe'Enum 3 = Prelude'.Just SECRET
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum DOCKER_VOLUME = 1
  fromEnum HOST_PATH = 4
  fromEnum SANDBOX_PATH = 2
  fromEnum SECRET = 3
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Volume.Source.Type") .
      toMaybe'Enum
  succ UNKNOWN = DOCKER_VOLUME
  succ DOCKER_VOLUME = HOST_PATH
  succ HOST_PATH = SANDBOX_PATH
  succ SANDBOX_PATH = SECRET
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Volume.Source.Type"
  pred DOCKER_VOLUME = UNKNOWN
  pred HOST_PATH = DOCKER_VOLUME
  pred SANDBOX_PATH = HOST_PATH
  pred SECRET = SANDBOX_PATH
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Volume.Source.Type"

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
  reflectEnum
   = [(0, "UNKNOWN", UNKNOWN), (1, "DOCKER_VOLUME", DOCKER_VOLUME), (4, "HOST_PATH", HOST_PATH), (2, "SANDBOX_PATH", SANDBOX_PATH),
      (3, "SECRET", SECRET)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.Volume.Source.Type") ["Mesos", "V1"] ["Protos", "Volume", "Source"] "Type")
      ["Mesos", "V1", "Protos", "Volume", "Source", "Type.hs"]
      [(0, "UNKNOWN"), (1, "DOCKER_VOLUME"), (4, "HOST_PATH"), (2, "SANDBOX_PATH"), (3, "SECRET")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead