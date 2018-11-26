{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Event.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | SUBSCRIBED
          | TASK_ADDED
          | TASK_UPDATED
          | AGENT_ADDED
          | AGENT_REMOVED
          | FRAMEWORK_ADDED
          | FRAMEWORK_UPDATED
          | FRAMEWORK_REMOVED
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
toMaybe'Enum 1 = Prelude'.Just SUBSCRIBED
toMaybe'Enum 2 = Prelude'.Just TASK_ADDED
toMaybe'Enum 3 = Prelude'.Just TASK_UPDATED
toMaybe'Enum 4 = Prelude'.Just AGENT_ADDED
toMaybe'Enum 5 = Prelude'.Just AGENT_REMOVED
toMaybe'Enum 6 = Prelude'.Just FRAMEWORK_ADDED
toMaybe'Enum 7 = Prelude'.Just FRAMEWORK_UPDATED
toMaybe'Enum 8 = Prelude'.Just FRAMEWORK_REMOVED
toMaybe'Enum 9 = Prelude'.Just HEARTBEAT
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum SUBSCRIBED = 1
  fromEnum TASK_ADDED = 2
  fromEnum TASK_UPDATED = 3
  fromEnum AGENT_ADDED = 4
  fromEnum AGENT_REMOVED = 5
  fromEnum FRAMEWORK_ADDED = 6
  fromEnum FRAMEWORK_UPDATED = 7
  fromEnum FRAMEWORK_REMOVED = 8
  fromEnum HEARTBEAT = 9
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Master.Protos.Event.Type") .
      toMaybe'Enum
  succ UNKNOWN = SUBSCRIBED
  succ SUBSCRIBED = TASK_ADDED
  succ TASK_ADDED = TASK_UPDATED
  succ TASK_UPDATED = AGENT_ADDED
  succ AGENT_ADDED = AGENT_REMOVED
  succ AGENT_REMOVED = FRAMEWORK_ADDED
  succ FRAMEWORK_ADDED = FRAMEWORK_UPDATED
  succ FRAMEWORK_UPDATED = FRAMEWORK_REMOVED
  succ FRAMEWORK_REMOVED = HEARTBEAT
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Master.Protos.Event.Type"
  pred SUBSCRIBED = UNKNOWN
  pred TASK_ADDED = SUBSCRIBED
  pred TASK_UPDATED = TASK_ADDED
  pred AGENT_ADDED = TASK_UPDATED
  pred AGENT_REMOVED = AGENT_ADDED
  pred FRAMEWORK_ADDED = AGENT_REMOVED
  pred FRAMEWORK_UPDATED = FRAMEWORK_ADDED
  pred FRAMEWORK_REMOVED = FRAMEWORK_UPDATED
  pred HEARTBEAT = FRAMEWORK_REMOVED
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Master.Protos.Event.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "SUBSCRIBED", SUBSCRIBED), (2, "TASK_ADDED", TASK_ADDED), (3, "TASK_UPDATED", TASK_UPDATED),
      (4, "AGENT_ADDED", AGENT_ADDED), (5, "AGENT_REMOVED", AGENT_REMOVED), (6, "FRAMEWORK_ADDED", FRAMEWORK_ADDED),
      (7, "FRAMEWORK_UPDATED", FRAMEWORK_UPDATED), (8, "FRAMEWORK_REMOVED", FRAMEWORK_REMOVED), (9, "HEARTBEAT", HEARTBEAT)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.master.Event.Type") ["Mesos", "V1", "Master"] ["Protos", "Event"] "Type")
      ["Mesos", "V1", "Master", "Protos", "Event", "Type.hs"]
      [(0, "UNKNOWN"), (1, "SUBSCRIBED"), (2, "TASK_ADDED"), (3, "TASK_UPDATED"), (4, "AGENT_ADDED"), (5, "AGENT_REMOVED"),
       (6, "FRAMEWORK_ADDED"), (7, "FRAMEWORK_UPDATED"), (8, "FRAMEWORK_REMOVED"), (9, "HEARTBEAT")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead