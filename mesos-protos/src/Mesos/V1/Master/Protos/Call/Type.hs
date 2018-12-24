{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.Type (Type(..)) where
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
          | SET_LOGGING_LEVEL
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
          | UPDATE_WEIGHTS
          | GET_MASTER
          | SUBSCRIBE
          | RESERVE_RESOURCES
          | UNRESERVE_RESOURCES
          | CREATE_VOLUMES
          | DESTROY_VOLUMES
          | GROW_VOLUME
          | SHRINK_VOLUME
          | GET_MAINTENANCE_STATUS
          | GET_MAINTENANCE_SCHEDULE
          | UPDATE_MAINTENANCE_SCHEDULE
          | START_MAINTENANCE
          | STOP_MAINTENANCE
          | GET_QUOTA
          | UPDATE_QUOTA
          | SET_QUOTA
          | REMOVE_QUOTA
          | TEARDOWN
          | MARK_AGENT_GONE
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = MARK_AGENT_GONE

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just GET_HEALTH
toMaybe'Enum 2 = Prelude'.Just GET_FLAGS
toMaybe'Enum 3 = Prelude'.Just GET_VERSION
toMaybe'Enum 4 = Prelude'.Just GET_METRICS
toMaybe'Enum 5 = Prelude'.Just GET_LOGGING_LEVEL
toMaybe'Enum 6 = Prelude'.Just SET_LOGGING_LEVEL
toMaybe'Enum 7 = Prelude'.Just LIST_FILES
toMaybe'Enum 8 = Prelude'.Just READ_FILE
toMaybe'Enum 9 = Prelude'.Just GET_STATE
toMaybe'Enum 10 = Prelude'.Just GET_AGENTS
toMaybe'Enum 11 = Prelude'.Just GET_FRAMEWORKS
toMaybe'Enum 12 = Prelude'.Just GET_EXECUTORS
toMaybe'Enum 33 = Prelude'.Just GET_OPERATIONS
toMaybe'Enum 13 = Prelude'.Just GET_TASKS
toMaybe'Enum 14 = Prelude'.Just GET_ROLES
toMaybe'Enum 15 = Prelude'.Just GET_WEIGHTS
toMaybe'Enum 16 = Prelude'.Just UPDATE_WEIGHTS
toMaybe'Enum 17 = Prelude'.Just GET_MASTER
toMaybe'Enum 18 = Prelude'.Just SUBSCRIBE
toMaybe'Enum 19 = Prelude'.Just RESERVE_RESOURCES
toMaybe'Enum 20 = Prelude'.Just UNRESERVE_RESOURCES
toMaybe'Enum 21 = Prelude'.Just CREATE_VOLUMES
toMaybe'Enum 22 = Prelude'.Just DESTROY_VOLUMES
toMaybe'Enum 34 = Prelude'.Just GROW_VOLUME
toMaybe'Enum 35 = Prelude'.Just SHRINK_VOLUME
toMaybe'Enum 23 = Prelude'.Just GET_MAINTENANCE_STATUS
toMaybe'Enum 24 = Prelude'.Just GET_MAINTENANCE_SCHEDULE
toMaybe'Enum 25 = Prelude'.Just UPDATE_MAINTENANCE_SCHEDULE
toMaybe'Enum 26 = Prelude'.Just START_MAINTENANCE
toMaybe'Enum 27 = Prelude'.Just STOP_MAINTENANCE
toMaybe'Enum 28 = Prelude'.Just GET_QUOTA
toMaybe'Enum 36 = Prelude'.Just UPDATE_QUOTA
toMaybe'Enum 29 = Prelude'.Just SET_QUOTA
toMaybe'Enum 30 = Prelude'.Just REMOVE_QUOTA
toMaybe'Enum 31 = Prelude'.Just TEARDOWN
toMaybe'Enum 32 = Prelude'.Just MARK_AGENT_GONE
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum GET_HEALTH = 1
  fromEnum GET_FLAGS = 2
  fromEnum GET_VERSION = 3
  fromEnum GET_METRICS = 4
  fromEnum GET_LOGGING_LEVEL = 5
  fromEnum SET_LOGGING_LEVEL = 6
  fromEnum LIST_FILES = 7
  fromEnum READ_FILE = 8
  fromEnum GET_STATE = 9
  fromEnum GET_AGENTS = 10
  fromEnum GET_FRAMEWORKS = 11
  fromEnum GET_EXECUTORS = 12
  fromEnum GET_OPERATIONS = 33
  fromEnum GET_TASKS = 13
  fromEnum GET_ROLES = 14
  fromEnum GET_WEIGHTS = 15
  fromEnum UPDATE_WEIGHTS = 16
  fromEnum GET_MASTER = 17
  fromEnum SUBSCRIBE = 18
  fromEnum RESERVE_RESOURCES = 19
  fromEnum UNRESERVE_RESOURCES = 20
  fromEnum CREATE_VOLUMES = 21
  fromEnum DESTROY_VOLUMES = 22
  fromEnum GROW_VOLUME = 34
  fromEnum SHRINK_VOLUME = 35
  fromEnum GET_MAINTENANCE_STATUS = 23
  fromEnum GET_MAINTENANCE_SCHEDULE = 24
  fromEnum UPDATE_MAINTENANCE_SCHEDULE = 25
  fromEnum START_MAINTENANCE = 26
  fromEnum STOP_MAINTENANCE = 27
  fromEnum GET_QUOTA = 28
  fromEnum UPDATE_QUOTA = 36
  fromEnum SET_QUOTA = 29
  fromEnum REMOVE_QUOTA = 30
  fromEnum TEARDOWN = 31
  fromEnum MARK_AGENT_GONE = 32
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Master.Protos.Call.Type") . toMaybe'Enum
  succ UNKNOWN = GET_HEALTH
  succ GET_HEALTH = GET_FLAGS
  succ GET_FLAGS = GET_VERSION
  succ GET_VERSION = GET_METRICS
  succ GET_METRICS = GET_LOGGING_LEVEL
  succ GET_LOGGING_LEVEL = SET_LOGGING_LEVEL
  succ SET_LOGGING_LEVEL = LIST_FILES
  succ LIST_FILES = READ_FILE
  succ READ_FILE = GET_STATE
  succ GET_STATE = GET_AGENTS
  succ GET_AGENTS = GET_FRAMEWORKS
  succ GET_FRAMEWORKS = GET_EXECUTORS
  succ GET_EXECUTORS = GET_OPERATIONS
  succ GET_OPERATIONS = GET_TASKS
  succ GET_TASKS = GET_ROLES
  succ GET_ROLES = GET_WEIGHTS
  succ GET_WEIGHTS = UPDATE_WEIGHTS
  succ UPDATE_WEIGHTS = GET_MASTER
  succ GET_MASTER = SUBSCRIBE
  succ SUBSCRIBE = RESERVE_RESOURCES
  succ RESERVE_RESOURCES = UNRESERVE_RESOURCES
  succ UNRESERVE_RESOURCES = CREATE_VOLUMES
  succ CREATE_VOLUMES = DESTROY_VOLUMES
  succ DESTROY_VOLUMES = GROW_VOLUME
  succ GROW_VOLUME = SHRINK_VOLUME
  succ SHRINK_VOLUME = GET_MAINTENANCE_STATUS
  succ GET_MAINTENANCE_STATUS = GET_MAINTENANCE_SCHEDULE
  succ GET_MAINTENANCE_SCHEDULE = UPDATE_MAINTENANCE_SCHEDULE
  succ UPDATE_MAINTENANCE_SCHEDULE = START_MAINTENANCE
  succ START_MAINTENANCE = STOP_MAINTENANCE
  succ STOP_MAINTENANCE = GET_QUOTA
  succ GET_QUOTA = UPDATE_QUOTA
  succ UPDATE_QUOTA = SET_QUOTA
  succ SET_QUOTA = REMOVE_QUOTA
  succ REMOVE_QUOTA = TEARDOWN
  succ TEARDOWN = MARK_AGENT_GONE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Master.Protos.Call.Type"
  pred GET_HEALTH = UNKNOWN
  pred GET_FLAGS = GET_HEALTH
  pred GET_VERSION = GET_FLAGS
  pred GET_METRICS = GET_VERSION
  pred GET_LOGGING_LEVEL = GET_METRICS
  pred SET_LOGGING_LEVEL = GET_LOGGING_LEVEL
  pred LIST_FILES = SET_LOGGING_LEVEL
  pred READ_FILE = LIST_FILES
  pred GET_STATE = READ_FILE
  pred GET_AGENTS = GET_STATE
  pred GET_FRAMEWORKS = GET_AGENTS
  pred GET_EXECUTORS = GET_FRAMEWORKS
  pred GET_OPERATIONS = GET_EXECUTORS
  pred GET_TASKS = GET_OPERATIONS
  pred GET_ROLES = GET_TASKS
  pred GET_WEIGHTS = GET_ROLES
  pred UPDATE_WEIGHTS = GET_WEIGHTS
  pred GET_MASTER = UPDATE_WEIGHTS
  pred SUBSCRIBE = GET_MASTER
  pred RESERVE_RESOURCES = SUBSCRIBE
  pred UNRESERVE_RESOURCES = RESERVE_RESOURCES
  pred CREATE_VOLUMES = UNRESERVE_RESOURCES
  pred DESTROY_VOLUMES = CREATE_VOLUMES
  pred GROW_VOLUME = DESTROY_VOLUMES
  pred SHRINK_VOLUME = GROW_VOLUME
  pred GET_MAINTENANCE_STATUS = SHRINK_VOLUME
  pred GET_MAINTENANCE_SCHEDULE = GET_MAINTENANCE_STATUS
  pred UPDATE_MAINTENANCE_SCHEDULE = GET_MAINTENANCE_SCHEDULE
  pred START_MAINTENANCE = UPDATE_MAINTENANCE_SCHEDULE
  pred STOP_MAINTENANCE = START_MAINTENANCE
  pred GET_QUOTA = STOP_MAINTENANCE
  pred UPDATE_QUOTA = GET_QUOTA
  pred SET_QUOTA = UPDATE_QUOTA
  pred REMOVE_QUOTA = SET_QUOTA
  pred TEARDOWN = REMOVE_QUOTA
  pred MARK_AGENT_GONE = TEARDOWN
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Master.Protos.Call.Type"

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
      (4, "GET_METRICS", GET_METRICS), (5, "GET_LOGGING_LEVEL", GET_LOGGING_LEVEL), (6, "SET_LOGGING_LEVEL", SET_LOGGING_LEVEL),
      (7, "LIST_FILES", LIST_FILES), (8, "READ_FILE", READ_FILE), (9, "GET_STATE", GET_STATE), (10, "GET_AGENTS", GET_AGENTS),
      (11, "GET_FRAMEWORKS", GET_FRAMEWORKS), (12, "GET_EXECUTORS", GET_EXECUTORS), (33, "GET_OPERATIONS", GET_OPERATIONS),
      (13, "GET_TASKS", GET_TASKS), (14, "GET_ROLES", GET_ROLES), (15, "GET_WEIGHTS", GET_WEIGHTS),
      (16, "UPDATE_WEIGHTS", UPDATE_WEIGHTS), (17, "GET_MASTER", GET_MASTER), (18, "SUBSCRIBE", SUBSCRIBE),
      (19, "RESERVE_RESOURCES", RESERVE_RESOURCES), (20, "UNRESERVE_RESOURCES", UNRESERVE_RESOURCES),
      (21, "CREATE_VOLUMES", CREATE_VOLUMES), (22, "DESTROY_VOLUMES", DESTROY_VOLUMES), (34, "GROW_VOLUME", GROW_VOLUME),
      (35, "SHRINK_VOLUME", SHRINK_VOLUME), (23, "GET_MAINTENANCE_STATUS", GET_MAINTENANCE_STATUS),
      (24, "GET_MAINTENANCE_SCHEDULE", GET_MAINTENANCE_SCHEDULE), (25, "UPDATE_MAINTENANCE_SCHEDULE", UPDATE_MAINTENANCE_SCHEDULE),
      (26, "START_MAINTENANCE", START_MAINTENANCE), (27, "STOP_MAINTENANCE", STOP_MAINTENANCE), (28, "GET_QUOTA", GET_QUOTA),
      (36, "UPDATE_QUOTA", UPDATE_QUOTA), (29, "SET_QUOTA", SET_QUOTA), (30, "REMOVE_QUOTA", REMOVE_QUOTA),
      (31, "TEARDOWN", TEARDOWN), (32, "MARK_AGENT_GONE", MARK_AGENT_GONE)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.master.Call.Type") ["Mesos", "V1", "Master"] ["Protos", "Call"] "Type")
      ["Mesos", "V1", "Master", "Protos", "Call", "Type.hs"]
      [(0, "UNKNOWN"), (1, "GET_HEALTH"), (2, "GET_FLAGS"), (3, "GET_VERSION"), (4, "GET_METRICS"), (5, "GET_LOGGING_LEVEL"),
       (6, "SET_LOGGING_LEVEL"), (7, "LIST_FILES"), (8, "READ_FILE"), (9, "GET_STATE"), (10, "GET_AGENTS"), (11, "GET_FRAMEWORKS"),
       (12, "GET_EXECUTORS"), (33, "GET_OPERATIONS"), (13, "GET_TASKS"), (14, "GET_ROLES"), (15, "GET_WEIGHTS"),
       (16, "UPDATE_WEIGHTS"), (17, "GET_MASTER"), (18, "SUBSCRIBE"), (19, "RESERVE_RESOURCES"), (20, "UNRESERVE_RESOURCES"),
       (21, "CREATE_VOLUMES"), (22, "DESTROY_VOLUMES"), (34, "GROW_VOLUME"), (35, "SHRINK_VOLUME"), (23, "GET_MAINTENANCE_STATUS"),
       (24, "GET_MAINTENANCE_SCHEDULE"), (25, "UPDATE_MAINTENANCE_SCHEDULE"), (26, "START_MAINTENANCE"), (27, "STOP_MAINTENANCE"),
       (28, "GET_QUOTA"), (36, "UPDATE_QUOTA"), (29, "SET_QUOTA"), (30, "REMOVE_QUOTA"), (31, "TEARDOWN"), (32, "MARK_AGENT_GONE")]
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
         SET_LOGGING_LEVEL -> "SET_LOGGING_LEVEL"
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
         UPDATE_WEIGHTS -> "UPDATE_WEIGHTS"
         GET_MASTER -> "GET_MASTER"
         SUBSCRIBE -> "SUBSCRIBE"
         RESERVE_RESOURCES -> "RESERVE_RESOURCES"
         UNRESERVE_RESOURCES -> "UNRESERVE_RESOURCES"
         CREATE_VOLUMES -> "CREATE_VOLUMES"
         DESTROY_VOLUMES -> "DESTROY_VOLUMES"
         GROW_VOLUME -> "GROW_VOLUME"
         SHRINK_VOLUME -> "SHRINK_VOLUME"
         GET_MAINTENANCE_STATUS -> "GET_MAINTENANCE_STATUS"
         GET_MAINTENANCE_SCHEDULE -> "GET_MAINTENANCE_SCHEDULE"
         UPDATE_MAINTENANCE_SCHEDULE -> "UPDATE_MAINTENANCE_SCHEDULE"
         START_MAINTENANCE -> "START_MAINTENANCE"
         STOP_MAINTENANCE -> "STOP_MAINTENANCE"
         GET_QUOTA -> "GET_QUOTA"
         UPDATE_QUOTA -> "UPDATE_QUOTA"
         SET_QUOTA -> "SET_QUOTA"
         REMOVE_QUOTA -> "REMOVE_QUOTA"
         TEARDOWN -> "TEARDOWN"
         MARK_AGENT_GONE -> "MARK_AGENT_GONE")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Master.Protos.Call.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "GET_HEALTH" -> Prelude'.return GET_HEALTH
          "GET_FLAGS" -> Prelude'.return GET_FLAGS
          "GET_VERSION" -> Prelude'.return GET_VERSION
          "GET_METRICS" -> Prelude'.return GET_METRICS
          "GET_LOGGING_LEVEL" -> Prelude'.return GET_LOGGING_LEVEL
          "SET_LOGGING_LEVEL" -> Prelude'.return SET_LOGGING_LEVEL
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
          "UPDATE_WEIGHTS" -> Prelude'.return UPDATE_WEIGHTS
          "GET_MASTER" -> Prelude'.return GET_MASTER
          "SUBSCRIBE" -> Prelude'.return SUBSCRIBE
          "RESERVE_RESOURCES" -> Prelude'.return RESERVE_RESOURCES
          "UNRESERVE_RESOURCES" -> Prelude'.return UNRESERVE_RESOURCES
          "CREATE_VOLUMES" -> Prelude'.return CREATE_VOLUMES
          "DESTROY_VOLUMES" -> Prelude'.return DESTROY_VOLUMES
          "GROW_VOLUME" -> Prelude'.return GROW_VOLUME
          "SHRINK_VOLUME" -> Prelude'.return SHRINK_VOLUME
          "GET_MAINTENANCE_STATUS" -> Prelude'.return GET_MAINTENANCE_STATUS
          "GET_MAINTENANCE_SCHEDULE" -> Prelude'.return GET_MAINTENANCE_SCHEDULE
          "UPDATE_MAINTENANCE_SCHEDULE" -> Prelude'.return UPDATE_MAINTENANCE_SCHEDULE
          "START_MAINTENANCE" -> Prelude'.return START_MAINTENANCE
          "STOP_MAINTENANCE" -> Prelude'.return STOP_MAINTENANCE
          "GET_QUOTA" -> Prelude'.return GET_QUOTA
          "UPDATE_QUOTA" -> Prelude'.return UPDATE_QUOTA
          "SET_QUOTA" -> Prelude'.return SET_QUOTA
          "REMOVE_QUOTA" -> Prelude'.return REMOVE_QUOTA
          "TEARDOWN" -> Prelude'.return TEARDOWN
          "MARK_AGENT_GONE" -> Prelude'.return MARK_AGENT_GONE
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Master.Protos.Call.Type.Type"))