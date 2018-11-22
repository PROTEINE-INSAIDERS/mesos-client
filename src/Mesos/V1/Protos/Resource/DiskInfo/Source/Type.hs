{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Resource.DiskInfo.Source.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | PATH
          | MOUNT
          | BLOCK
          | RAW
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = RAW

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just PATH
toMaybe'Enum 2 = Prelude'.Just MOUNT
toMaybe'Enum 3 = Prelude'.Just BLOCK
toMaybe'Enum 4 = Prelude'.Just RAW
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum PATH = 1
  fromEnum MOUNT = 2
  fromEnum BLOCK = 3
  fromEnum RAW = 4
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Resource.DiskInfo.Source.Type") .
      toMaybe'Enum
  succ UNKNOWN = PATH
  succ PATH = MOUNT
  succ MOUNT = BLOCK
  succ BLOCK = RAW
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Resource.DiskInfo.Source.Type"
  pred PATH = UNKNOWN
  pred MOUNT = PATH
  pred BLOCK = MOUNT
  pred RAW = BLOCK
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Resource.DiskInfo.Source.Type"

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
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "PATH", PATH), (2, "MOUNT", MOUNT), (3, "BLOCK", BLOCK), (4, "RAW", RAW)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.Resource.DiskInfo.Source.Type") ["Mesos", "V1"] ["Protos", "Resource", "DiskInfo", "Source"]
        "Type")
      ["Mesos", "V1", "Protos", "Resource", "DiskInfo", "Source", "Type.hs"]
      [(0, "UNKNOWN"), (1, "PATH"), (2, "MOUNT"), (3, "BLOCK"), (4, "RAW")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead