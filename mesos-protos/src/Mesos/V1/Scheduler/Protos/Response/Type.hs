{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Response.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | RECONCILE_OPERATIONS
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = RECONCILE_OPERATIONS

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just RECONCILE_OPERATIONS
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum RECONCILE_OPERATIONS = 1
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Scheduler.Protos.Response.Type") .
      toMaybe'Enum
  succ UNKNOWN = RECONCILE_OPERATIONS
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Scheduler.Protos.Response.Type"
  pred RECONCILE_OPERATIONS = UNKNOWN
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Scheduler.Protos.Response.Type"

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
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "RECONCILE_OPERATIONS", RECONCILE_OPERATIONS)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.scheduler.Response.Type") ["Mesos", "V1", "Scheduler"] ["Protos", "Response"] "Type")
      ["Mesos", "V1", "Scheduler", "Protos", "Response", "Type.hs"]
      [(0, "UNKNOWN"), (1, "RECONCILE_OPERATIONS")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         RECONCILE_OPERATIONS -> "RECONCILE_OPERATIONS")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Scheduler.Protos.Response.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "RECONCILE_OPERATIONS" -> Prelude'.return RECONCILE_OPERATIONS
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Scheduler.Protos.Response.Type.Type"))