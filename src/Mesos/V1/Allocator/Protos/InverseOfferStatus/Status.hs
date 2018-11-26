{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Allocator.Protos.InverseOfferStatus.Status (Status(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Status = UNKNOWN
            | ACCEPT
            | DECLINE
              deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Status

instance Prelude'.Bounded Status where
  minBound = UNKNOWN
  maxBound = DECLINE

instance P'.Default Status where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Status
toMaybe'Enum 1 = Prelude'.Just UNKNOWN
toMaybe'Enum 2 = Prelude'.Just ACCEPT
toMaybe'Enum 3 = Prelude'.Just DECLINE
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Status where
  fromEnum UNKNOWN = 1
  fromEnum ACCEPT = 2
  fromEnum DECLINE = 3
  toEnum
   = P'.fromMaybe
      (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Allocator.Protos.InverseOfferStatus.Status")
      . toMaybe'Enum
  succ UNKNOWN = ACCEPT
  succ ACCEPT = DECLINE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Allocator.Protos.InverseOfferStatus.Status"
  pred ACCEPT = UNKNOWN
  pred DECLINE = ACCEPT
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Allocator.Protos.InverseOfferStatus.Status"

instance P'.Wire Status where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Status

instance P'.MessageAPI msg' (msg' -> Status) Status where
  getVal m' f' = f' m'

instance P'.ReflectEnum Status where
  reflectEnum = [(1, "UNKNOWN", UNKNOWN), (2, "ACCEPT", ACCEPT), (3, "DECLINE", DECLINE)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.allocator.InverseOfferStatus.Status") ["Mesos", "V1", "Allocator"]
        ["Protos", "InverseOfferStatus"]
        "Status")
      ["Mesos", "V1", "Allocator", "Protos", "InverseOfferStatus", "Status.hs"]
      [(1, "UNKNOWN"), (2, "ACCEPT"), (3, "DECLINE")]

instance P'.TextType Status where
  tellT = P'.tellShow
  getT = P'.getRead