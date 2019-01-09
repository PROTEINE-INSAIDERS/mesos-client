{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response
       (Response(..), type', get_health, get_flags, get_version, get_metrics, get_logging_level, list_files, read_file, get_state,
        get_agents, get_frameworks, get_executors, get_operations, get_tasks, get_roles, get_weights, get_master,
        get_maintenance_status, get_maintenance_schedule, get_quota)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Response.GetAgents as Protos.Response (GetAgents)
import qualified Mesos.V1.Master.Protos.Response.GetExecutors as Protos.Response (GetExecutors)
import qualified Mesos.V1.Master.Protos.Response.GetFlags as Protos.Response (GetFlags)
import qualified Mesos.V1.Master.Protos.Response.GetFrameworks as Protos.Response (GetFrameworks)
import qualified Mesos.V1.Master.Protos.Response.GetHealth as Protos.Response (GetHealth)
import qualified Mesos.V1.Master.Protos.Response.GetLoggingLevel as Protos.Response (GetLoggingLevel)
import qualified Mesos.V1.Master.Protos.Response.GetMaintenanceSchedule as Protos.Response (GetMaintenanceSchedule)
import qualified Mesos.V1.Master.Protos.Response.GetMaintenanceStatus as Protos.Response (GetMaintenanceStatus)
import qualified Mesos.V1.Master.Protos.Response.GetMaster as Protos.Response (GetMaster)
import qualified Mesos.V1.Master.Protos.Response.GetMetrics as Protos.Response (GetMetrics)
import qualified Mesos.V1.Master.Protos.Response.GetOperations as Protos.Response (GetOperations)
import qualified Mesos.V1.Master.Protos.Response.GetQuota as Protos.Response (GetQuota)
import qualified Mesos.V1.Master.Protos.Response.GetRoles as Protos.Response (GetRoles)
import qualified Mesos.V1.Master.Protos.Response.GetState as Protos.Response (GetState)
import qualified Mesos.V1.Master.Protos.Response.GetTasks as Protos.Response (GetTasks)
import qualified Mesos.V1.Master.Protos.Response.GetVersion as Protos.Response (GetVersion)
import qualified Mesos.V1.Master.Protos.Response.GetWeights as Protos.Response (GetWeights)
import qualified Mesos.V1.Master.Protos.Response.ListFiles as Protos.Response (ListFiles)
import qualified Mesos.V1.Master.Protos.Response.ReadFile as Protos.Response (ReadFile)
import qualified Mesos.V1.Master.Protos.Response.Type as Protos.Response (Type)

data Response = Response{_type' :: !(P'.Maybe Protos.Response.Type), _get_health :: !(P'.Maybe Protos.Response.GetHealth),
                         _get_flags :: !(P'.Maybe Protos.Response.GetFlags), _get_version :: !(P'.Maybe Protos.Response.GetVersion),
                         _get_metrics :: !(P'.Maybe Protos.Response.GetMetrics),
                         _get_logging_level :: !(P'.Maybe Protos.Response.GetLoggingLevel),
                         _list_files :: !(P'.Maybe Protos.Response.ListFiles), _read_file :: !(P'.Maybe Protos.Response.ReadFile),
                         _get_state :: !(P'.Maybe Protos.Response.GetState), _get_agents :: !(P'.Maybe Protos.Response.GetAgents),
                         _get_frameworks :: !(P'.Maybe Protos.Response.GetFrameworks),
                         _get_executors :: !(P'.Maybe Protos.Response.GetExecutors),
                         _get_operations :: !(P'.Maybe Protos.Response.GetOperations),
                         _get_tasks :: !(P'.Maybe Protos.Response.GetTasks), _get_roles :: !(P'.Maybe Protos.Response.GetRoles),
                         _get_weights :: !(P'.Maybe Protos.Response.GetWeights),
                         _get_master :: !(P'.Maybe Protos.Response.GetMaster),
                         _get_maintenance_status :: !(P'.Maybe Protos.Response.GetMaintenanceStatus),
                         _get_maintenance_schedule :: !(P'.Maybe Protos.Response.GetMaintenanceSchedule),
                         _get_quota :: !(P'.Maybe Protos.Response.GetQuota)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Response

instance P'.ToJSON Response where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("get_health", P'.toJSON (Prelude'.fmap P'.toJSON (get_health msg))),
        ("get_flags", P'.toJSON (Prelude'.fmap P'.toJSON (get_flags msg))),
        ("get_version", P'.toJSON (Prelude'.fmap P'.toJSON (get_version msg))),
        ("get_metrics", P'.toJSON (Prelude'.fmap P'.toJSON (get_metrics msg))),
        ("get_logging_level", P'.toJSON (Prelude'.fmap P'.toJSON (get_logging_level msg))),
        ("list_files", P'.toJSON (Prelude'.fmap P'.toJSON (list_files msg))),
        ("read_file", P'.toJSON (Prelude'.fmap P'.toJSON (read_file msg))),
        ("get_state", P'.toJSON (Prelude'.fmap P'.toJSON (get_state msg))),
        ("get_agents", P'.toJSON (Prelude'.fmap P'.toJSON (get_agents msg))),
        ("get_frameworks", P'.toJSON (Prelude'.fmap P'.toJSON (get_frameworks msg))),
        ("get_executors", P'.toJSON (Prelude'.fmap P'.toJSON (get_executors msg))),
        ("get_operations", P'.toJSON (Prelude'.fmap P'.toJSON (get_operations msg))),
        ("get_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (get_tasks msg))),
        ("get_roles", P'.toJSON (Prelude'.fmap P'.toJSON (get_roles msg))),
        ("get_weights", P'.toJSON (Prelude'.fmap P'.toJSON (get_weights msg))),
        ("get_master", P'.toJSON (Prelude'.fmap P'.toJSON (get_master msg))),
        ("get_maintenance_status", P'.toJSON (Prelude'.fmap P'.toJSON (get_maintenance_status msg))),
        ("get_maintenance_schedule", P'.toJSON (Prelude'.fmap P'.toJSON (get_maintenance_schedule msg))),
        ("get_quota", P'.toJSON (Prelude'.fmap P'.toJSON (get_quota msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Response where
  parseJSON
   = P'.withObject "Response"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          get_health <- P'.explicitParseFieldMaybe P'.parseJSON o "get_health"
          get_flags <- P'.explicitParseFieldMaybe P'.parseJSON o "get_flags"
          get_version <- P'.explicitParseFieldMaybe P'.parseJSON o "get_version"
          get_metrics <- P'.explicitParseFieldMaybe P'.parseJSON o "get_metrics"
          get_logging_level <- P'.explicitParseFieldMaybe P'.parseJSON o "get_logging_level"
          list_files <- P'.explicitParseFieldMaybe P'.parseJSON o "list_files"
          read_file <- P'.explicitParseFieldMaybe P'.parseJSON o "read_file"
          get_state <- P'.explicitParseFieldMaybe P'.parseJSON o "get_state"
          get_agents <- P'.explicitParseFieldMaybe P'.parseJSON o "get_agents"
          get_frameworks <- P'.explicitParseFieldMaybe P'.parseJSON o "get_frameworks"
          get_executors <- P'.explicitParseFieldMaybe P'.parseJSON o "get_executors"
          get_operations <- P'.explicitParseFieldMaybe P'.parseJSON o "get_operations"
          get_tasks <- P'.explicitParseFieldMaybe P'.parseJSON o "get_tasks"
          get_roles <- P'.explicitParseFieldMaybe P'.parseJSON o "get_roles"
          get_weights <- P'.explicitParseFieldMaybe P'.parseJSON o "get_weights"
          get_master <- P'.explicitParseFieldMaybe P'.parseJSON o "get_master"
          get_maintenance_status <- P'.explicitParseFieldMaybe P'.parseJSON o "get_maintenance_status"
          get_maintenance_schedule <- P'.explicitParseFieldMaybe P'.parseJSON o "get_maintenance_schedule"
          get_quota <- P'.explicitParseFieldMaybe P'.parseJSON o "get_quota"
          Prelude'.return
           P'.defaultValue{_type' = type', _get_health = get_health, _get_flags = get_flags, _get_version = get_version,
                           _get_metrics = get_metrics, _get_logging_level = get_logging_level, _list_files = list_files,
                           _read_file = read_file, _get_state = get_state, _get_agents = get_agents,
                           _get_frameworks = get_frameworks, _get_executors = get_executors, _get_operations = get_operations,
                           _get_tasks = get_tasks, _get_roles = get_roles, _get_weights = get_weights, _get_master = get_master,
                           _get_maintenance_status = get_maintenance_status, _get_maintenance_schedule = get_maintenance_schedule,
                           _get_quota = get_quota})

instance P'.Mergeable Response where
  mergeAppend (Response x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20)
   (Response y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20)
   = Response (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)
      (P'.mergeAppend x'20 y'20)

instance P'.Default Response where
  defaultValue
   = Response P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Response where
  wireSize ft' self'@(Response x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11
             + P'.wireSizeOpt 1 11 x'12
             + P'.wireSizeOpt 2 11 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 1 11 x'16
             + P'.wireSizeOpt 2 11 x'17
             + P'.wireSizeOpt 2 11 x'18
             + P'.wireSizeOpt 2 11 x'19
             + P'.wireSizeOpt 2 11 x'20)
  wirePutWithSize ft' self'@(Response x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutOptWithSize 50 11 x'6,
             P'.wirePutOptWithSize 58 11 x'7, P'.wirePutOptWithSize 66 11 x'8, P'.wirePutOptWithSize 74 11 x'9,
             P'.wirePutOptWithSize 82 11 x'10, P'.wirePutOptWithSize 90 11 x'11, P'.wirePutOptWithSize 98 11 x'12,
             P'.wirePutOptWithSize 106 11 x'14, P'.wirePutOptWithSize 114 11 x'15, P'.wirePutOptWithSize 122 11 x'16,
             P'.wirePutOptWithSize 130 11 x'17, P'.wirePutOptWithSize 138 11 x'18, P'.wirePutOptWithSize 146 11 x'19,
             P'.wirePutOptWithSize 154 11 x'20, P'.wirePutOptWithSize 162 11 x'13]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_health = P'.mergeAppend (_get_health old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_flags = P'.mergeAppend (_get_flags old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_version = P'.mergeAppend (_get_version old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_metrics = P'.mergeAppend (_get_metrics old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_get_logging_level = P'.mergeAppend (_get_logging_level old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_list_files = P'.mergeAppend (_list_files old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_read_file = P'.mergeAppend (_read_file old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_state = P'.mergeAppend (_get_state old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_agents = P'.mergeAppend (_get_agents old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_get_frameworks = P'.mergeAppend (_get_frameworks old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             98 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_executors = P'.mergeAppend (_get_executors old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             162 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_get_operations = P'.mergeAppend (_get_operations old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_get_tasks = P'.mergeAppend (_get_tasks old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_get_roles = P'.mergeAppend (_get_roles old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_get_weights = P'.mergeAppend (_get_weights old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_get_master = P'.mergeAppend (_get_master old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             138 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_get_maintenance_status =
                                 P'.mergeAppend (_get_maintenance_status old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             146 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_get_maintenance_schedule =
                                 P'.mergeAppend (_get_maintenance_schedule old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             154 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_get_quota = P'.mergeAppend (_get_quota old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Response) Response where
  getVal m' f' = f' m'

instance P'.GPB Response

instance P'.ReflectDescriptor Response where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58, 66, 74, 82, 90, 98, 106, 114, 122, 130, 138, 146, 154, 162])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\"], baseName = MName \"Response\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_health\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_health\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetHealth\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetHealth\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_flags\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_flags\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFlags\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetFlags\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_version\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_version\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetVersion\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetVersion\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_metrics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_metrics\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetMetrics\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetMetrics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_logging_level\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_logging_level\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetLoggingLevel\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetLoggingLevel\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.list_files\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"list_files\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.ListFiles\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"ListFiles\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.read_file\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"read_file\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.ReadFile\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"ReadFile\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_state\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_state\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetState\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_agents\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_agents\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetAgents\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_frameworks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_frameworks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetFrameworks\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_executors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_executors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetExecutors\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_operations\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_operations\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 162}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetOperations\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetOperations\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetTasks\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetTasks\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_roles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_roles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetRoles\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetRoles\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_weights\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_weights\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetWeights\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetWeights\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_master\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_master\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetMaster\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetMaster\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_maintenance_status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_maintenance_status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 138}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetMaintenanceStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetMaintenanceStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_maintenance_schedule\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_maintenance_schedule\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetMaintenanceSchedule\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetMaintenanceSchedule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.get_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\"], baseName' = FName \"get_quota\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Response where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Response where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "get_health" (_get_health msg)
       P'.tellT "get_flags" (_get_flags msg)
       P'.tellT "get_version" (_get_version msg)
       P'.tellT "get_metrics" (_get_metrics msg)
       P'.tellT "get_logging_level" (_get_logging_level msg)
       P'.tellT "list_files" (_list_files msg)
       P'.tellT "read_file" (_read_file msg)
       P'.tellT "get_state" (_get_state msg)
       P'.tellT "get_agents" (_get_agents msg)
       P'.tellT "get_frameworks" (_get_frameworks msg)
       P'.tellT "get_executors" (_get_executors msg)
       P'.tellT "get_operations" (_get_operations msg)
       P'.tellT "get_tasks" (_get_tasks msg)
       P'.tellT "get_roles" (_get_roles msg)
       P'.tellT "get_weights" (_get_weights msg)
       P'.tellT "get_master" (_get_master msg)
       P'.tellT "get_maintenance_status" (_get_maintenance_status msg)
       P'.tellT "get_maintenance_schedule" (_get_maintenance_schedule msg)
       P'.tellT "get_quota" (_get_quota msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_get_health, parse'_get_flags, parse'_get_version, parse'_get_metrics,
                   parse'_get_logging_level, parse'_list_files, parse'_read_file, parse'_get_state, parse'_get_agents,
                   parse'_get_frameworks, parse'_get_executors, parse'_get_operations, parse'_get_tasks, parse'_get_roles,
                   parse'_get_weights, parse'_get_master, parse'_get_maintenance_status, parse'_get_maintenance_schedule,
                   parse'_get_quota])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_get_health
         = P'.try
            (do
               v <- P'.getT "get_health"
               Prelude'.return (\ o -> o{_get_health = v}))
        parse'_get_flags
         = P'.try
            (do
               v <- P'.getT "get_flags"
               Prelude'.return (\ o -> o{_get_flags = v}))
        parse'_get_version
         = P'.try
            (do
               v <- P'.getT "get_version"
               Prelude'.return (\ o -> o{_get_version = v}))
        parse'_get_metrics
         = P'.try
            (do
               v <- P'.getT "get_metrics"
               Prelude'.return (\ o -> o{_get_metrics = v}))
        parse'_get_logging_level
         = P'.try
            (do
               v <- P'.getT "get_logging_level"
               Prelude'.return (\ o -> o{_get_logging_level = v}))
        parse'_list_files
         = P'.try
            (do
               v <- P'.getT "list_files"
               Prelude'.return (\ o -> o{_list_files = v}))
        parse'_read_file
         = P'.try
            (do
               v <- P'.getT "read_file"
               Prelude'.return (\ o -> o{_read_file = v}))
        parse'_get_state
         = P'.try
            (do
               v <- P'.getT "get_state"
               Prelude'.return (\ o -> o{_get_state = v}))
        parse'_get_agents
         = P'.try
            (do
               v <- P'.getT "get_agents"
               Prelude'.return (\ o -> o{_get_agents = v}))
        parse'_get_frameworks
         = P'.try
            (do
               v <- P'.getT "get_frameworks"
               Prelude'.return (\ o -> o{_get_frameworks = v}))
        parse'_get_executors
         = P'.try
            (do
               v <- P'.getT "get_executors"
               Prelude'.return (\ o -> o{_get_executors = v}))
        parse'_get_operations
         = P'.try
            (do
               v <- P'.getT "get_operations"
               Prelude'.return (\ o -> o{_get_operations = v}))
        parse'_get_tasks
         = P'.try
            (do
               v <- P'.getT "get_tasks"
               Prelude'.return (\ o -> o{_get_tasks = v}))
        parse'_get_roles
         = P'.try
            (do
               v <- P'.getT "get_roles"
               Prelude'.return (\ o -> o{_get_roles = v}))
        parse'_get_weights
         = P'.try
            (do
               v <- P'.getT "get_weights"
               Prelude'.return (\ o -> o{_get_weights = v}))
        parse'_get_master
         = P'.try
            (do
               v <- P'.getT "get_master"
               Prelude'.return (\ o -> o{_get_master = v}))
        parse'_get_maintenance_status
         = P'.try
            (do
               v <- P'.getT "get_maintenance_status"
               Prelude'.return (\ o -> o{_get_maintenance_status = v}))
        parse'_get_maintenance_schedule
         = P'.try
            (do
               v <- P'.getT "get_maintenance_schedule"
               Prelude'.return (\ o -> o{_get_maintenance_schedule = v}))
        parse'_get_quota
         = P'.try
            (do
               v <- P'.getT "get_quota"
               Prelude'.return (\ o -> o{_get_quota = v}))