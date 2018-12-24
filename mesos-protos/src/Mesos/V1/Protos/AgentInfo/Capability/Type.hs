{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.AgentInfo.Capability.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | MULTI_ROLE
          | HIERARCHICAL_ROLE
          | RESERVATION_REFINEMENT
          | RESOURCE_PROVIDER
          | RESIZE_VOLUME
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = RESIZE_VOLUME

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just MULTI_ROLE
toMaybe'Enum 2 = Prelude'.Just HIERARCHICAL_ROLE
toMaybe'Enum 3 = Prelude'.Just RESERVATION_REFINEMENT
toMaybe'Enum 4 = Prelude'.Just RESOURCE_PROVIDER
toMaybe'Enum 5 = Prelude'.Just RESIZE_VOLUME
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum MULTI_ROLE = 1
  fromEnum HIERARCHICAL_ROLE = 2
  fromEnum RESERVATION_REFINEMENT = 3
  fromEnum RESOURCE_PROVIDER = 4
  fromEnum RESIZE_VOLUME = 5
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.AgentInfo.Capability.Type") .
      toMaybe'Enum
  succ UNKNOWN = MULTI_ROLE
  succ MULTI_ROLE = HIERARCHICAL_ROLE
  succ HIERARCHICAL_ROLE = RESERVATION_REFINEMENT
  succ RESERVATION_REFINEMENT = RESOURCE_PROVIDER
  succ RESOURCE_PROVIDER = RESIZE_VOLUME
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.AgentInfo.Capability.Type"
  pred MULTI_ROLE = UNKNOWN
  pred HIERARCHICAL_ROLE = MULTI_ROLE
  pred RESERVATION_REFINEMENT = HIERARCHICAL_ROLE
  pred RESOURCE_PROVIDER = RESERVATION_REFINEMENT
  pred RESIZE_VOLUME = RESOURCE_PROVIDER
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.AgentInfo.Capability.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "MULTI_ROLE", MULTI_ROLE), (2, "HIERARCHICAL_ROLE", HIERARCHICAL_ROLE),
      (3, "RESERVATION_REFINEMENT", RESERVATION_REFINEMENT), (4, "RESOURCE_PROVIDER", RESOURCE_PROVIDER),
      (5, "RESIZE_VOLUME", RESIZE_VOLUME)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.AgentInfo.Capability.Type") ["Mesos", "V1"] ["Protos", "AgentInfo", "Capability"] "Type")
      ["Mesos", "V1", "Protos", "AgentInfo", "Capability", "Type.hs"]
      [(0, "UNKNOWN"), (1, "MULTI_ROLE"), (2, "HIERARCHICAL_ROLE"), (3, "RESERVATION_REFINEMENT"), (4, "RESOURCE_PROVIDER"),
       (5, "RESIZE_VOLUME")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         MULTI_ROLE -> "MULTI_ROLE"
         HIERARCHICAL_ROLE -> "HIERARCHICAL_ROLE"
         RESERVATION_REFINEMENT -> "RESERVATION_REFINEMENT"
         RESOURCE_PROVIDER -> "RESOURCE_PROVIDER"
         RESIZE_VOLUME -> "RESIZE_VOLUME")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.AgentInfo.Capability.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "MULTI_ROLE" -> Prelude'.return MULTI_ROLE
          "HIERARCHICAL_ROLE" -> Prelude'.return HIERARCHICAL_ROLE
          "RESERVATION_REFINEMENT" -> Prelude'.return RESERVATION_REFINEMENT
          "RESOURCE_PROVIDER" -> Prelude'.return RESOURCE_PROVIDER
          "RESIZE_VOLUME" -> Prelude'.return RESIZE_VOLUME
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.AgentInfo.Capability.Type.Type"))