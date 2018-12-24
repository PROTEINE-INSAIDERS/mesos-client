{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | GET_HEALTH
          | GET_FLAGS
          | GET_VERSION
          | GET_METRICS
          | GET_LOGGING_LEVEL
          | LIST_FILES
          | READ_FILE
          | GET_STATE
          | GET_AGENTS
          | GET_FRAMEWORKS
          | GET_EXECUTORS
          | GET_OPERATIONS
          | GET_TASKS
          | GET_ROLES
          | GET_WEIGHTS
          | GET_MASTER
          | GET_MAINTENANCE_STATUS
          | GET_MAINTENANCE_SCHEDULE
          | GET_QUOTA
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = GET_QUOTA

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just GET_HEALTH
toMaybe'Enum 2 = Prelude'.Just GET_FLAGS
toMaybe'Enum 3 = Prelude'.Just GET_VERSION
toMaybe'Enum 4 = Prelude'.Just GET_METRICS
toMaybe'Enum 5 = Prelude'.Just GET_LOGGING_LEVEL
toMaybe'Enum 6 = Prelude'.Just LIST_FILES
toMaybe'Enum 7 = Prelude'.Just READ_FILE
toMaybe'Enum 8 = Prelude'.Just GET_STATE
toMaybe'Enum 9 = Prelude'.Just GET_AGENTS
toMaybe'Enum 10 = Prelude'.Just GET_FRAMEWORKS
toMaybe'Enum 11 = Prelude'.Just GET_EXECUTORS
toMaybe'Enum 19 = Prelude'.Just GET_OPERATIONS
toMaybe'Enum 12 = Prelude'.Just GET_TASKS
toMaybe'Enum 13 = Prelude'.Just GET_ROLES
toMaybe'Enum 14 = Prelude'.Just GET_WEIGHTS
toMaybe'Enum 15 = Prelude'.Just GET_MASTER
toMaybe'Enum 16 = Prelude'.Just GET_MAINTENANCE_STATUS
toMaybe'Enum 17 = Prelude'.Just GET_MAINTENANCE_SCHEDULE
toMaybe'Enum 18 = Prelude'.Just GET_QUOTA
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum GET_HEALTH = 1
  fromEnum GET_FLAGS = 2
  fromEnum GET_VERSION = 3
  fromEnum GET_METRICS = 4
  fromEnum GET_LOGGING_LEVEL = 5
  fromEnum LIST_FILES = 6
  fromEnum READ_FILE = 7
  fromEnum GET_STATE = 8
  fromEnum GET_AGENTS = 9
  fromEnum GET_FRAMEWORKS = 10
  fromEnum GET_EXECUTORS = 11
  fromEnum GET_OPERATIONS = 19
  fromEnum GET_TASKS = 12
  fromEnum GET_ROLES = 13
  fromEnum GET_WEIGHTS = 14
  fromEnum GET_MASTER = 15
  fromEnum GET_MAINTENANCE_STATUS = 16
  fromEnum GET_MAINTENANCE_SCHEDULE = 17
  fromEnum GET_QUOTA = 18
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Master.Protos.Response.Type") .
      toMaybe'Enum
  succ UNKNOWN = GET_HEALTH
  succ GET_HEALTH = GET_FLAGS
  succ GET_FLAGS = GET_VERSION
  succ GET_VERSION = GET_METRICS
  succ GET_METRICS = GET_LOGGING_LEVEL
  succ GET_LOGGING_LEVEL = LIST_FILES
  succ LIST_FILES = READ_FILE
  succ READ_FILE = GET_STATE
  succ GET_STATE = GET_AGENTS
  succ GET_AGENTS = GET_FRAMEWORKS
  succ GET_FRAMEWORKS = GET_EXECUTORS
  succ GET_EXECUTORS = GET_OPERATIONS
  succ GET_OPERATIONS = GET_TASKS
  succ GET_TASKS = GET_ROLES
  succ GET_ROLES = GET_WEIGHTS
  succ GET_WEIGHTS = GET_MASTER
  succ GET_MASTER = GET_MAINTENANCE_STATUS
  succ GET_MAINTENANCE_STATUS = GET_MAINTENANCE_SCHEDULE
  succ GET_MAINTENANCE_SCHEDULE = GET_QUOTA
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Master.Protos.Response.Type"
  pred GET_HEALTH = UNKNOWN
  pred GET_FLAGS = GET_HEALTH
  pred GET_VERSION = GET_FLAGS
  pred GET_METRICS = GET_VERSION
  pred GET_LOGGING_LEVEL = GET_METRICS
  pred LIST_FILES = GET_LOGGING_LEVEL
  pred READ_FILE = LIST_FILES
  pred GET_STATE = READ_FILE
  pred GET_AGENTS = GET_STATE
  pred GET_FRAMEWORKS = GET_AGENTS
  pred GET_EXECUTORS = GET_FRAMEWORKS
  pred GET_OPERATIONS = GET_EXECUTORS
  pred GET_TASKS = GET_OPERATIONS
  pred GET_ROLES = GET_TASKS
  pred GET_WEIGHTS = GET_ROLES
  pred GET_MASTER = GET_WEIGHTS
  pred GET_MAINTENANCE_STATUS = GET_MASTER
  pred GET_MAINTENANCE_SCHEDULE = GET_MAINTENANCE_STATUS
  pred GET_QUOTA = GET_MAINTENANCE_SCHEDULE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Master.Protos.Response.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "GET_HEALTH", GET_HEALTH), (2, "GET_FLAGS", GET_FLAGS), (3, "GET_VERSION", GET_VERSION),
      (4, "GET_METRICS", GET_METRICS), (5, "GET_LOGGING_LEVEL", GET_LOGGING_LEVEL), (6, "LIST_FILES", LIST_FILES),
      (7, "READ_FILE", READ_FILE), (8, "GET_STATE", GET_STATE), (9, "GET_AGENTS", GET_AGENTS),
      (10, "GET_FRAMEWORKS", GET_FRAMEWORKS), (11, "GET_EXECUTORS", GET_EXECUTORS), (19, "GET_OPERATIONS", GET_OPERATIONS),
      (12, "GET_TASKS", GET_TASKS), (13, "GET_ROLES", GET_ROLES), (14, "GET_WEIGHTS", GET_WEIGHTS), (15, "GET_MASTER", GET_MASTER),
      (16, "GET_MAINTENANCE_STATUS", GET_MAINTENANCE_STATUS), (17, "GET_MAINTENANCE_SCHEDULE", GET_MAINTENANCE_SCHEDULE),
      (18, "GET_QUOTA", GET_QUOTA)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.master.Response.Type") ["Mesos", "V1", "Master"] ["Protos", "Response"] "Type")
      ["Mesos", "V1", "Master", "Protos", "Response", "Type.hs"]
      [(0, "UNKNOWN"), (1, "GET_HEALTH"), (2, "GET_FLAGS"), (3, "GET_VERSION"), (4, "GET_METRICS"), (5, "GET_LOGGING_LEVEL"),
       (6, "LIST_FILES"), (7, "READ_FILE"), (8, "GET_STATE"), (9, "GET_AGENTS"), (10, "GET_FRAMEWORKS"), (11, "GET_EXECUTORS"),
       (19, "GET_OPERATIONS"), (12, "GET_TASKS"), (13, "GET_ROLES"), (14, "GET_WEIGHTS"), (15, "GET_MASTER"),
       (16, "GET_MAINTENANCE_STATUS"), (17, "GET_MAINTENANCE_SCHEDULE"), (18, "GET_QUOTA")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         GET_HEALTH -> "GET_HEALTH"
         GET_FLAGS -> "GET_FLAGS"
         GET_VERSION -> "GET_VERSION"
         GET_METRICS -> "GET_METRICS"
         GET_LOGGING_LEVEL -> "GET_LOGGING_LEVEL"
         LIST_FILES -> "LIST_FILES"
         READ_FILE -> "READ_FILE"
         GET_STATE -> "GET_STATE"
         GET_AGENTS -> "GET_AGENTS"
         GET_FRAMEWORKS -> "GET_FRAMEWORKS"
         GET_EXECUTORS -> "GET_EXECUTORS"
         GET_OPERATIONS -> "GET_OPERATIONS"
         GET_TASKS -> "GET_TASKS"
         GET_ROLES -> "GET_ROLES"
         GET_WEIGHTS -> "GET_WEIGHTS"
         GET_MASTER -> "GET_MASTER"
         GET_MAINTENANCE_STATUS -> "GET_MAINTENANCE_STATUS"
         GET_MAINTENANCE_SCHEDULE -> "GET_MAINTENANCE_SCHEDULE"
         GET_QUOTA -> "GET_QUOTA")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Master.Protos.Response.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "GET_HEALTH" -> Prelude'.return GET_HEALTH
          "GET_FLAGS" -> Prelude'.return GET_FLAGS
          "GET_VERSION" -> Prelude'.return GET_VERSION
          "GET_METRICS" -> Prelude'.return GET_METRICS
          "GET_LOGGING_LEVEL" -> Prelude'.return GET_LOGGING_LEVEL
          "LIST_FILES" -> Prelude'.return LIST_FILES
          "READ_FILE" -> Prelude'.return READ_FILE
          "GET_STATE" -> Prelude'.return GET_STATE
          "GET_AGENTS" -> Prelude'.return GET_AGENTS
          "GET_FRAMEWORKS" -> Prelude'.return GET_FRAMEWORKS
          "GET_EXECUTORS" -> Prelude'.return GET_EXECUTORS
          "GET_OPERATIONS" -> Prelude'.return GET_OPERATIONS
          "GET_TASKS" -> Prelude'.return GET_TASKS
          "GET_ROLES" -> Prelude'.return GET_ROLES
          "GET_WEIGHTS" -> Prelude'.return GET_WEIGHTS
          "GET_MASTER" -> Prelude'.return GET_MASTER
          "GET_MAINTENANCE_STATUS" -> Prelude'.return GET_MAINTENANCE_STATUS
          "GET_MAINTENANCE_SCHEDULE" -> Prelude'.return GET_MAINTENANCE_SCHEDULE
          "GET_QUOTA" -> Prelude'.return GET_QUOTA
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Master.Protos.Response.Type.Type"))