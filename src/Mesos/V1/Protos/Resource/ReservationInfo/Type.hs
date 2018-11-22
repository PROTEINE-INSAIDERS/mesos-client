{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Resource.ReservationInfo.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | STATIC
          | DYNAMIC
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = DYNAMIC

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just STATIC
toMaybe'Enum 2 = Prelude'.Just DYNAMIC
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum STATIC = 1
  fromEnum DYNAMIC = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Resource.ReservationInfo.Type") .
      toMaybe'Enum
  succ UNKNOWN = STATIC
  succ STATIC = DYNAMIC
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Resource.ReservationInfo.Type"
  pred STATIC = UNKNOWN
  pred DYNAMIC = STATIC
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Resource.ReservationInfo.Type"

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
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "STATIC", STATIC), (2, "DYNAMIC", DYNAMIC)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.Resource.ReservationInfo.Type") ["Mesos", "V1"] ["Protos", "Resource", "ReservationInfo"]
        "Type")
      ["Mesos", "V1", "Protos", "Resource", "ReservationInfo", "Type.hs"]
      [(0, "UNKNOWN"), (1, "STATIC"), (2, "DYNAMIC")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead