{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.FrameworkInfo.Capability.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | REVOCABLE_RESOURCES
          | TASK_KILLING_STATE
          | GPU_RESOURCES
          | SHARED_RESOURCES
          | PARTITION_AWARE
          | MULTI_ROLE
          | RESERVATION_REFINEMENT
          | REGION_AWARE
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = REGION_AWARE

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just REVOCABLE_RESOURCES
toMaybe'Enum 2 = Prelude'.Just TASK_KILLING_STATE
toMaybe'Enum 3 = Prelude'.Just GPU_RESOURCES
toMaybe'Enum 4 = Prelude'.Just SHARED_RESOURCES
toMaybe'Enum 5 = Prelude'.Just PARTITION_AWARE
toMaybe'Enum 6 = Prelude'.Just MULTI_ROLE
toMaybe'Enum 7 = Prelude'.Just RESERVATION_REFINEMENT
toMaybe'Enum 8 = Prelude'.Just REGION_AWARE
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum REVOCABLE_RESOURCES = 1
  fromEnum TASK_KILLING_STATE = 2
  fromEnum GPU_RESOURCES = 3
  fromEnum SHARED_RESOURCES = 4
  fromEnum PARTITION_AWARE = 5
  fromEnum MULTI_ROLE = 6
  fromEnum RESERVATION_REFINEMENT = 7
  fromEnum REGION_AWARE = 8
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.FrameworkInfo.Capability.Type") .
      toMaybe'Enum
  succ UNKNOWN = REVOCABLE_RESOURCES
  succ REVOCABLE_RESOURCES = TASK_KILLING_STATE
  succ TASK_KILLING_STATE = GPU_RESOURCES
  succ GPU_RESOURCES = SHARED_RESOURCES
  succ SHARED_RESOURCES = PARTITION_AWARE
  succ PARTITION_AWARE = MULTI_ROLE
  succ MULTI_ROLE = RESERVATION_REFINEMENT
  succ RESERVATION_REFINEMENT = REGION_AWARE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.FrameworkInfo.Capability.Type"
  pred REVOCABLE_RESOURCES = UNKNOWN
  pred TASK_KILLING_STATE = REVOCABLE_RESOURCES
  pred GPU_RESOURCES = TASK_KILLING_STATE
  pred SHARED_RESOURCES = GPU_RESOURCES
  pred PARTITION_AWARE = SHARED_RESOURCES
  pred MULTI_ROLE = PARTITION_AWARE
  pred RESERVATION_REFINEMENT = MULTI_ROLE
  pred REGION_AWARE = RESERVATION_REFINEMENT
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.FrameworkInfo.Capability.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "REVOCABLE_RESOURCES", REVOCABLE_RESOURCES), (2, "TASK_KILLING_STATE", TASK_KILLING_STATE),
      (3, "GPU_RESOURCES", GPU_RESOURCES), (4, "SHARED_RESOURCES", SHARED_RESOURCES), (5, "PARTITION_AWARE", PARTITION_AWARE),
      (6, "MULTI_ROLE", MULTI_ROLE), (7, "RESERVATION_REFINEMENT", RESERVATION_REFINEMENT), (8, "REGION_AWARE", REGION_AWARE)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.FrameworkInfo.Capability.Type") ["Mesos", "V1"] ["Protos", "FrameworkInfo", "Capability"]
        "Type")
      ["Mesos", "V1", "Protos", "FrameworkInfo", "Capability", "Type.hs"]
      [(0, "UNKNOWN"), (1, "REVOCABLE_RESOURCES"), (2, "TASK_KILLING_STATE"), (3, "GPU_RESOURCES"), (4, "SHARED_RESOURCES"),
       (5, "PARTITION_AWARE"), (6, "MULTI_ROLE"), (7, "RESERVATION_REFINEMENT"), (8, "REGION_AWARE")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         REVOCABLE_RESOURCES -> "REVOCABLE_RESOURCES"
         TASK_KILLING_STATE -> "TASK_KILLING_STATE"
         GPU_RESOURCES -> "GPU_RESOURCES"
         SHARED_RESOURCES -> "SHARED_RESOURCES"
         PARTITION_AWARE -> "PARTITION_AWARE"
         MULTI_ROLE -> "MULTI_ROLE"
         RESERVATION_REFINEMENT -> "RESERVATION_REFINEMENT"
         REGION_AWARE -> "REGION_AWARE")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.FrameworkInfo.Capability.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "REVOCABLE_RESOURCES" -> Prelude'.return REVOCABLE_RESOURCES
          "TASK_KILLING_STATE" -> Prelude'.return TASK_KILLING_STATE
          "GPU_RESOURCES" -> Prelude'.return GPU_RESOURCES
          "SHARED_RESOURCES" -> Prelude'.return SHARED_RESOURCES
          "PARTITION_AWARE" -> Prelude'.return PARTITION_AWARE
          "MULTI_ROLE" -> Prelude'.return MULTI_ROLE
          "RESERVATION_REFINEMENT" -> Prelude'.return RESERVATION_REFINEMENT
          "REGION_AWARE" -> Prelude'.return REGION_AWARE
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.FrameworkInfo.Capability.Type.Type"))