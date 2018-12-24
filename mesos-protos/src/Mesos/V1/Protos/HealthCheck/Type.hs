{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.HealthCheck.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | COMMAND
          | HTTP
          | TCP
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = TCP

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just COMMAND
toMaybe'Enum 2 = Prelude'.Just HTTP
toMaybe'Enum 3 = Prelude'.Just TCP
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum COMMAND = 1
  fromEnum HTTP = 2
  fromEnum TCP = 3
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.HealthCheck.Type") . toMaybe'Enum
  succ UNKNOWN = COMMAND
  succ COMMAND = HTTP
  succ HTTP = TCP
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.HealthCheck.Type"
  pred COMMAND = UNKNOWN
  pred HTTP = COMMAND
  pred TCP = HTTP
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.HealthCheck.Type"

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
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "COMMAND", COMMAND), (2, "HTTP", HTTP), (3, "TCP", TCP)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.HealthCheck.Type") ["Mesos", "V1"] ["Protos", "HealthCheck"] "Type")
      ["Mesos", "V1", "Protos", "HealthCheck", "Type.hs"]
      [(0, "UNKNOWN"), (1, "COMMAND"), (2, "HTTP"), (3, "TCP")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         COMMAND -> "COMMAND"
         HTTP -> "HTTP"
         TCP -> "TCP")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.HealthCheck.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "COMMAND" -> Prelude'.return COMMAND
          "HTTP" -> Prelude'.return HTTP
          "TCP" -> Prelude'.return TCP
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Protos.HealthCheck.Type.Type"))