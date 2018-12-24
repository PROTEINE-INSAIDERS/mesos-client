{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TaskState (TaskState(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data TaskState = TASK_STAGING
               | TASK_STARTING
               | TASK_RUNNING
               | TASK_KILLING
               | TASK_FINISHED
               | TASK_FAILED
               | TASK_KILLED
               | TASK_ERROR
               | TASK_LOST
               | TASK_DROPPED
               | TASK_UNREACHABLE
               | TASK_GONE
               | TASK_GONE_BY_OPERATOR
               | TASK_UNKNOWN
                 deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                           Prelude'.Generic)

instance P'.Mergeable TaskState

instance Prelude'.Bounded TaskState where
  minBound = TASK_STAGING
  maxBound = TASK_UNKNOWN

instance P'.Default TaskState where
  defaultValue = TASK_STAGING

toMaybe'Enum :: Prelude'.Int -> P'.Maybe TaskState
toMaybe'Enum 6 = Prelude'.Just TASK_STAGING
toMaybe'Enum 0 = Prelude'.Just TASK_STARTING
toMaybe'Enum 1 = Prelude'.Just TASK_RUNNING
toMaybe'Enum 8 = Prelude'.Just TASK_KILLING
toMaybe'Enum 2 = Prelude'.Just TASK_FINISHED
toMaybe'Enum 3 = Prelude'.Just TASK_FAILED
toMaybe'Enum 4 = Prelude'.Just TASK_KILLED
toMaybe'Enum 7 = Prelude'.Just TASK_ERROR
toMaybe'Enum 5 = Prelude'.Just TASK_LOST
toMaybe'Enum 9 = Prelude'.Just TASK_DROPPED
toMaybe'Enum 10 = Prelude'.Just TASK_UNREACHABLE
toMaybe'Enum 11 = Prelude'.Just TASK_GONE
toMaybe'Enum 12 = Prelude'.Just TASK_GONE_BY_OPERATOR
toMaybe'Enum 13 = Prelude'.Just TASK_UNKNOWN
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum TaskState where
  fromEnum TASK_STAGING = 6
  fromEnum TASK_STARTING = 0
  fromEnum TASK_RUNNING = 1
  fromEnum TASK_KILLING = 8
  fromEnum TASK_FINISHED = 2
  fromEnum TASK_FAILED = 3
  fromEnum TASK_KILLED = 4
  fromEnum TASK_ERROR = 7
  fromEnum TASK_LOST = 5
  fromEnum TASK_DROPPED = 9
  fromEnum TASK_UNREACHABLE = 10
  fromEnum TASK_GONE = 11
  fromEnum TASK_GONE_BY_OPERATOR = 12
  fromEnum TASK_UNKNOWN = 13
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.TaskState") . toMaybe'Enum
  succ TASK_STAGING = TASK_STARTING
  succ TASK_STARTING = TASK_RUNNING
  succ TASK_RUNNING = TASK_KILLING
  succ TASK_KILLING = TASK_FINISHED
  succ TASK_FINISHED = TASK_FAILED
  succ TASK_FAILED = TASK_KILLED
  succ TASK_KILLED = TASK_ERROR
  succ TASK_ERROR = TASK_LOST
  succ TASK_LOST = TASK_DROPPED
  succ TASK_DROPPED = TASK_UNREACHABLE
  succ TASK_UNREACHABLE = TASK_GONE
  succ TASK_GONE = TASK_GONE_BY_OPERATOR
  succ TASK_GONE_BY_OPERATOR = TASK_UNKNOWN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.TaskState"
  pred TASK_STARTING = TASK_STAGING
  pred TASK_RUNNING = TASK_STARTING
  pred TASK_KILLING = TASK_RUNNING
  pred TASK_FINISHED = TASK_KILLING
  pred TASK_FAILED = TASK_FINISHED
  pred TASK_KILLED = TASK_FAILED
  pred TASK_ERROR = TASK_KILLED
  pred TASK_LOST = TASK_ERROR
  pred TASK_DROPPED = TASK_LOST
  pred TASK_UNREACHABLE = TASK_DROPPED
  pred TASK_GONE = TASK_UNREACHABLE
  pred TASK_GONE_BY_OPERATOR = TASK_GONE
  pred TASK_UNKNOWN = TASK_GONE_BY_OPERATOR
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.TaskState"

instance P'.Wire TaskState where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB TaskState

instance P'.MessageAPI msg' (msg' -> TaskState) TaskState where
  getVal m' f' = f' m'

instance P'.ReflectEnum TaskState where
  reflectEnum
   = [(6, "TASK_STAGING", TASK_STAGING), (0, "TASK_STARTING", TASK_STARTING), (1, "TASK_RUNNING", TASK_RUNNING),
      (8, "TASK_KILLING", TASK_KILLING), (2, "TASK_FINISHED", TASK_FINISHED), (3, "TASK_FAILED", TASK_FAILED),
      (4, "TASK_KILLED", TASK_KILLED), (7, "TASK_ERROR", TASK_ERROR), (5, "TASK_LOST", TASK_LOST),
      (9, "TASK_DROPPED", TASK_DROPPED), (10, "TASK_UNREACHABLE", TASK_UNREACHABLE), (11, "TASK_GONE", TASK_GONE),
      (12, "TASK_GONE_BY_OPERATOR", TASK_GONE_BY_OPERATOR), (13, "TASK_UNKNOWN", TASK_UNKNOWN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.TaskState") ["Mesos", "V1"] ["Protos"] "TaskState")
      ["Mesos", "V1", "Protos", "TaskState.hs"]
      [(6, "TASK_STAGING"), (0, "TASK_STARTING"), (1, "TASK_RUNNING"), (8, "TASK_KILLING"), (2, "TASK_FINISHED"),
       (3, "TASK_FAILED"), (4, "TASK_KILLED"), (7, "TASK_ERROR"), (5, "TASK_LOST"), (9, "TASK_DROPPED"), (10, "TASK_UNREACHABLE"),
       (11, "TASK_GONE"), (12, "TASK_GONE_BY_OPERATOR"), (13, "TASK_UNKNOWN")]
      Prelude'.True

instance P'.TextType TaskState where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON TaskState where
  toJSON msg'
   = P'.String
      (case msg' of
         TASK_STAGING -> "TASK_STAGING"
         TASK_STARTING -> "TASK_STARTING"
         TASK_RUNNING -> "TASK_RUNNING"
         TASK_KILLING -> "TASK_KILLING"
         TASK_FINISHED -> "TASK_FINISHED"
         TASK_FAILED -> "TASK_FAILED"
         TASK_KILLED -> "TASK_KILLED"
         TASK_ERROR -> "TASK_ERROR"
         TASK_LOST -> "TASK_LOST"
         TASK_DROPPED -> "TASK_DROPPED"
         TASK_UNREACHABLE -> "TASK_UNREACHABLE"
         TASK_GONE -> "TASK_GONE"
         TASK_GONE_BY_OPERATOR -> "TASK_GONE_BY_OPERATOR"
         TASK_UNKNOWN -> "TASK_UNKNOWN")

instance P'.FromJSON TaskState where
  parseJSON
   = P'.withText "Mesos.V1.Protos.TaskState.TaskState"
      (\ msg' ->
        case msg' of
          "TASK_STAGING" -> Prelude'.return TASK_STAGING
          "TASK_STARTING" -> Prelude'.return TASK_STARTING
          "TASK_RUNNING" -> Prelude'.return TASK_RUNNING
          "TASK_KILLING" -> Prelude'.return TASK_KILLING
          "TASK_FINISHED" -> Prelude'.return TASK_FINISHED
          "TASK_FAILED" -> Prelude'.return TASK_FAILED
          "TASK_KILLED" -> Prelude'.return TASK_KILLED
          "TASK_ERROR" -> Prelude'.return TASK_ERROR
          "TASK_LOST" -> Prelude'.return TASK_LOST
          "TASK_DROPPED" -> Prelude'.return TASK_DROPPED
          "TASK_UNREACHABLE" -> Prelude'.return TASK_UNREACHABLE
          "TASK_GONE" -> Prelude'.return TASK_GONE
          "TASK_GONE_BY_OPERATOR" -> Prelude'.return TASK_GONE_BY_OPERATOR
          "TASK_UNKNOWN" -> Prelude'.return TASK_UNKNOWN
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Protos.TaskState.TaskState"))