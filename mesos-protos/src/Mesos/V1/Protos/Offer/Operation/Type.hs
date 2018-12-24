{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Offer.Operation.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | LAUNCH
          | LAUNCH_GROUP
          | RESERVE
          | UNRESERVE
          | CREATE
          | DESTROY
          | GROW_VOLUME
          | SHRINK_VOLUME
          | CREATE_DISK
          | DESTROY_DISK
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = DESTROY_DISK

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just LAUNCH
toMaybe'Enum 6 = Prelude'.Just LAUNCH_GROUP
toMaybe'Enum 2 = Prelude'.Just RESERVE
toMaybe'Enum 3 = Prelude'.Just UNRESERVE
toMaybe'Enum 4 = Prelude'.Just CREATE
toMaybe'Enum 5 = Prelude'.Just DESTROY
toMaybe'Enum 11 = Prelude'.Just GROW_VOLUME
toMaybe'Enum 12 = Prelude'.Just SHRINK_VOLUME
toMaybe'Enum 13 = Prelude'.Just CREATE_DISK
toMaybe'Enum 14 = Prelude'.Just DESTROY_DISK
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum LAUNCH = 1
  fromEnum LAUNCH_GROUP = 6
  fromEnum RESERVE = 2
  fromEnum UNRESERVE = 3
  fromEnum CREATE = 4
  fromEnum DESTROY = 5
  fromEnum GROW_VOLUME = 11
  fromEnum SHRINK_VOLUME = 12
  fromEnum CREATE_DISK = 13
  fromEnum DESTROY_DISK = 14
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Offer.Operation.Type") .
      toMaybe'Enum
  succ UNKNOWN = LAUNCH
  succ LAUNCH = LAUNCH_GROUP
  succ LAUNCH_GROUP = RESERVE
  succ RESERVE = UNRESERVE
  succ UNRESERVE = CREATE
  succ CREATE = DESTROY
  succ DESTROY = GROW_VOLUME
  succ GROW_VOLUME = SHRINK_VOLUME
  succ SHRINK_VOLUME = CREATE_DISK
  succ CREATE_DISK = DESTROY_DISK
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Offer.Operation.Type"
  pred LAUNCH = UNKNOWN
  pred LAUNCH_GROUP = LAUNCH
  pred RESERVE = LAUNCH_GROUP
  pred UNRESERVE = RESERVE
  pred CREATE = UNRESERVE
  pred DESTROY = CREATE
  pred GROW_VOLUME = DESTROY
  pred SHRINK_VOLUME = GROW_VOLUME
  pred CREATE_DISK = SHRINK_VOLUME
  pred DESTROY_DISK = CREATE_DISK
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Offer.Operation.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "LAUNCH", LAUNCH), (6, "LAUNCH_GROUP", LAUNCH_GROUP), (2, "RESERVE", RESERVE),
      (3, "UNRESERVE", UNRESERVE), (4, "CREATE", CREATE), (5, "DESTROY", DESTROY), (11, "GROW_VOLUME", GROW_VOLUME),
      (12, "SHRINK_VOLUME", SHRINK_VOLUME), (13, "CREATE_DISK", CREATE_DISK), (14, "DESTROY_DISK", DESTROY_DISK)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.Offer.Operation.Type") ["Mesos", "V1"] ["Protos", "Offer", "Operation"] "Type")
      ["Mesos", "V1", "Protos", "Offer", "Operation", "Type.hs"]
      [(0, "UNKNOWN"), (1, "LAUNCH"), (6, "LAUNCH_GROUP"), (2, "RESERVE"), (3, "UNRESERVE"), (4, "CREATE"), (5, "DESTROY"),
       (11, "GROW_VOLUME"), (12, "SHRINK_VOLUME"), (13, "CREATE_DISK"), (14, "DESTROY_DISK")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         LAUNCH -> "LAUNCH"
         LAUNCH_GROUP -> "LAUNCH_GROUP"
         RESERVE -> "RESERVE"
         UNRESERVE -> "UNRESERVE"
         CREATE -> "CREATE"
         DESTROY -> "DESTROY"
         GROW_VOLUME -> "GROW_VOLUME"
         SHRINK_VOLUME -> "SHRINK_VOLUME"
         CREATE_DISK -> "CREATE_DISK"
         DESTROY_DISK -> "DESTROY_DISK")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.Offer.Operation.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "LAUNCH" -> Prelude'.return LAUNCH
          "LAUNCH_GROUP" -> Prelude'.return LAUNCH_GROUP
          "RESERVE" -> Prelude'.return RESERVE
          "UNRESERVE" -> Prelude'.return UNRESERVE
          "CREATE" -> Prelude'.return CREATE
          "DESTROY" -> Prelude'.return DESTROY
          "GROW_VOLUME" -> Prelude'.return GROW_VOLUME
          "SHRINK_VOLUME" -> Prelude'.return SHRINK_VOLUME
          "CREATE_DISK" -> Prelude'.return CREATE_DISK
          "DESTROY_DISK" -> Prelude'.return DESTROY_DISK
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Protos.Offer.Operation.Type.Type"))