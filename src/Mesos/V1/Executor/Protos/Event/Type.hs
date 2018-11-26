{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Event.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | SUBSCRIBED
          | LAUNCH
          | LAUNCH_GROUP
          | KILL
          | ACKNOWLEDGED
          | MESSAGE
          | ERROR
          | SHUTDOWN
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = SHUTDOWN

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just SUBSCRIBED
toMaybe'Enum 2 = Prelude'.Just LAUNCH
toMaybe'Enum 8 = Prelude'.Just LAUNCH_GROUP
toMaybe'Enum 3 = Prelude'.Just KILL
toMaybe'Enum 4 = Prelude'.Just ACKNOWLEDGED
toMaybe'Enum 5 = Prelude'.Just MESSAGE
toMaybe'Enum 6 = Prelude'.Just ERROR
toMaybe'Enum 7 = Prelude'.Just SHUTDOWN
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum SUBSCRIBED = 1
  fromEnum LAUNCH = 2
  fromEnum LAUNCH_GROUP = 8
  fromEnum KILL = 3
  fromEnum ACKNOWLEDGED = 4
  fromEnum MESSAGE = 5
  fromEnum ERROR = 6
  fromEnum SHUTDOWN = 7
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Executor.Protos.Event.Type") .
      toMaybe'Enum
  succ UNKNOWN = SUBSCRIBED
  succ SUBSCRIBED = LAUNCH
  succ LAUNCH = LAUNCH_GROUP
  succ LAUNCH_GROUP = KILL
  succ KILL = ACKNOWLEDGED
  succ ACKNOWLEDGED = MESSAGE
  succ MESSAGE = ERROR
  succ ERROR = SHUTDOWN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Executor.Protos.Event.Type"
  pred SUBSCRIBED = UNKNOWN
  pred LAUNCH = SUBSCRIBED
  pred LAUNCH_GROUP = LAUNCH
  pred KILL = LAUNCH_GROUP
  pred ACKNOWLEDGED = KILL
  pred MESSAGE = ACKNOWLEDGED
  pred ERROR = MESSAGE
  pred SHUTDOWN = ERROR
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Executor.Protos.Event.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "SUBSCRIBED", SUBSCRIBED), (2, "LAUNCH", LAUNCH), (8, "LAUNCH_GROUP", LAUNCH_GROUP),
      (3, "KILL", KILL), (4, "ACKNOWLEDGED", ACKNOWLEDGED), (5, "MESSAGE", MESSAGE), (6, "ERROR", ERROR), (7, "SHUTDOWN", SHUTDOWN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.executor.Event.Type") ["Mesos", "V1", "Executor"] ["Protos", "Event"] "Type")
      ["Mesos", "V1", "Executor", "Protos", "Event", "Type.hs"]
      [(0, "UNKNOWN"), (1, "SUBSCRIBED"), (2, "LAUNCH"), (8, "LAUNCH_GROUP"), (3, "KILL"), (4, "ACKNOWLEDGED"), (5, "MESSAGE"),
       (6, "ERROR"), (7, "SHUTDOWN")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead