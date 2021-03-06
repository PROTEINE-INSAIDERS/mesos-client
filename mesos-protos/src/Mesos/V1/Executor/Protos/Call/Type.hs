{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Call.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | SUBSCRIBE
          | UPDATE
          | MESSAGE
          | HEARTBEAT
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = HEARTBEAT

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just SUBSCRIBE
toMaybe'Enum 2 = Prelude'.Just UPDATE
toMaybe'Enum 3 = Prelude'.Just MESSAGE
toMaybe'Enum 4 = Prelude'.Just HEARTBEAT
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum SUBSCRIBE = 1
  fromEnum UPDATE = 2
  fromEnum MESSAGE = 3
  fromEnum HEARTBEAT = 4
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Executor.Protos.Call.Type") .
      toMaybe'Enum
  succ UNKNOWN = SUBSCRIBE
  succ SUBSCRIBE = UPDATE
  succ UPDATE = MESSAGE
  succ MESSAGE = HEARTBEAT
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Executor.Protos.Call.Type"
  pred SUBSCRIBE = UNKNOWN
  pred UPDATE = SUBSCRIBE
  pred MESSAGE = UPDATE
  pred HEARTBEAT = MESSAGE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Executor.Protos.Call.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "SUBSCRIBE", SUBSCRIBE), (2, "UPDATE", UPDATE), (3, "MESSAGE", MESSAGE),
      (4, "HEARTBEAT", HEARTBEAT)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.executor.Call.Type") ["Mesos", "V1", "Executor"] ["Protos", "Call"] "Type")
      ["Mesos", "V1", "Executor", "Protos", "Call", "Type.hs"]
      [(0, "UNKNOWN"), (1, "SUBSCRIBE"), (2, "UPDATE"), (3, "MESSAGE"), (4, "HEARTBEAT")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         SUBSCRIBE -> "SUBSCRIBE"
         UPDATE -> "UPDATE"
         MESSAGE -> "MESSAGE"
         HEARTBEAT -> "HEARTBEAT")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Executor.Protos.Call.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "SUBSCRIBE" -> Prelude'.return SUBSCRIBE
          "UPDATE" -> Prelude'.return UPDATE
          "MESSAGE" -> Prelude'.return MESSAGE
          "HEARTBEAT" -> Prelude'.return HEARTBEAT
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Executor.Protos.Call.Type.Type"))