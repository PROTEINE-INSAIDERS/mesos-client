{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Task
       (Task(..), name, task_id, framework_id, executor_id, agent_id, state, resources, statuses, status_update_state,
        status_update_uuid, labels, discovery, container, health_check, user)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.ContainerInfo as Protos (ContainerInfo)
import qualified Mesos.V1.Protos.DiscoveryInfo as Protos (DiscoveryInfo)
import qualified Mesos.V1.Protos.ExecutorID as Protos (ExecutorID)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.HealthCheck as Protos (HealthCheck)
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.TaskID as Protos (TaskID)
import qualified Mesos.V1.Protos.TaskState as Protos (TaskState)
import qualified Mesos.V1.Protos.TaskStatus as Protos (TaskStatus)

data Task = Task{_name :: !(P'.Utf8), _task_id :: !(Protos.TaskID), _framework_id :: !(Protos.FrameworkID),
                 _executor_id :: !(P'.Maybe Protos.ExecutorID), _agent_id :: !(Protos.AgentID), _state :: !(Protos.TaskState),
                 _resources :: !(P'.Seq Protos.Resource), _statuses :: !(P'.Seq Protos.TaskStatus),
                 _status_update_state :: !(P'.Maybe Protos.TaskState), _status_update_uuid :: !(P'.Maybe P'.ByteString),
                 _labels :: !(P'.Maybe Protos.Labels), _discovery :: !(P'.Maybe Protos.DiscoveryInfo),
                 _container :: !(P'.Maybe Protos.ContainerInfo), _health_check :: !(P'.Maybe Protos.HealthCheck),
                 _user :: !(P'.Maybe P'.Utf8)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Task

instance P'.ToJSON Task where
  toJSON msg
   = P'.objectNoEmpty
      ([("name", P'.toJSON (name msg)), ("task_id", P'.toJSON (task_id msg)), ("framework_id", P'.toJSON (framework_id msg)),
        ("executor_id", P'.toJSON (Prelude'.fmap P'.toJSON (executor_id msg))), ("agent_id", P'.toJSON (agent_id msg)),
        ("state", P'.toJSON (state msg)), ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg))),
        ("statuses", P'.toJSON (Prelude'.fmap P'.toJSON (statuses msg))),
        ("status_update_state", P'.toJSON (Prelude'.fmap P'.toJSON (status_update_state msg))),
        ("status_update_uuid", P'.toJSON (Prelude'.fmap P'.toJSONByteString (status_update_uuid msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg))),
        ("discovery", P'.toJSON (Prelude'.fmap P'.toJSON (discovery msg))),
        ("container", P'.toJSON (Prelude'.fmap P'.toJSON (container msg))),
        ("health_check", P'.toJSON (Prelude'.fmap P'.toJSON (health_check msg))),
        ("user", P'.toJSON (Prelude'.fmap P'.toJSON (user msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Task where
  parseJSON
   = P'.withObject "Task"
      (\ o ->
        do
          name <- P'.explicitParseField P'.parseJSON o "name"
          task_id <- P'.explicitParseField P'.parseJSON o "task_id"
          framework_id <- P'.explicitParseField P'.parseJSON o "framework_id"
          executor_id <- P'.explicitParseFieldMaybe P'.parseJSON o "executor_id"
          agent_id <- P'.explicitParseField P'.parseJSON o "agent_id"
          state <- P'.explicitParseField P'.parseJSON o "state"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          statuses <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                       (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "statuses")
          status_update_state <- P'.explicitParseFieldMaybe P'.parseJSON o "status_update_state"
          status_update_uuid <- P'.explicitParseFieldMaybe P'.parseJSONByteString o "status_update_uuid"
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          discovery <- P'.explicitParseFieldMaybe P'.parseJSON o "discovery"
          container <- P'.explicitParseFieldMaybe P'.parseJSON o "container"
          health_check <- P'.explicitParseFieldMaybe P'.parseJSON o "health_check"
          user <- P'.explicitParseFieldMaybe P'.parseJSON o "user"
          Prelude'.return
           P'.defaultValue{_name = name, _task_id = task_id, _framework_id = framework_id, _executor_id = executor_id,
                           _agent_id = agent_id, _state = state, _resources = resources, _statuses = statuses,
                           _status_update_state = status_update_state, _status_update_uuid = status_update_uuid, _labels = labels,
                           _discovery = discovery, _container = container, _health_check = health_check, _user = user})

instance P'.Mergeable Task where
  mergeAppend (Task x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15)
   (Task y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15)
   = Task (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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

instance P'.Default Task where
  defaultValue
   = Task P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Task where
  wireSize ft' self'@(Task x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeReq 1 11 x'5
             + P'.wireSizeReq 1 14 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeOpt 1 14 x'9
             + P'.wireSizeOpt 1 12 x'10
             + P'.wireSizeOpt 1 11 x'11
             + P'.wireSizeOpt 1 11 x'12
             + P'.wireSizeOpt 1 11 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 9 x'15)
  wirePutWithSize ft' self'@(Task x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutReqWithSize 42 11 x'5, P'.wirePutReqWithSize 48 14 x'6,
             P'.wirePutRepWithSize 58 11 x'7, P'.wirePutRepWithSize 66 11 x'8, P'.wirePutOptWithSize 72 14 x'9,
             P'.wirePutOptWithSize 82 12 x'10, P'.wirePutOptWithSize 90 11 x'11, P'.wirePutOptWithSize 98 11 x'12,
             P'.wirePutOptWithSize 106 11 x'13, P'.wirePutOptWithSize 114 9 x'15, P'.wirePutOptWithSize 122 11 x'14]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_task_id = P'.mergeAppend (_task_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_executor_id = P'.mergeAppend (_executor_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_agent_id = P'.mergeAppend (_agent_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_state = new'Field}) (P'.wireGet 14)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_statuses = P'.append (_statuses old'Self) new'Field}) (P'.wireGet 11)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_status_update_state = Prelude'.Just new'Field}) (P'.wireGet 14)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_status_update_uuid = Prelude'.Just new'Field}) (P'.wireGet 12)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             98 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_discovery = P'.mergeAppend (_discovery old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_container = P'.mergeAppend (_container old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_health_check = P'.mergeAppend (_health_check old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap (\ !new'Field -> old'Self{_user = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Task) Task where
  getVal m' f' = f' m'

instance P'.GPB Task

instance P'.ReflectDescriptor Task where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18, 26, 42, 48])
      (P'.fromDistinctAscList [10, 18, 26, 34, 42, 48, 58, 66, 72, 82, 90, 98, 106, 114, 122])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Task\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Task.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.task_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"task_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.executor_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"executor_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.state\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"state\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskState\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.statuses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"statuses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.status_update_state\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"status_update_state\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskState\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.status_update_uuid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"status_update_uuid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.discovery\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"discovery\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DiscoveryInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DiscoveryInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.container\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"container\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.health_check\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"health_check\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.HealthCheck\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"HealthCheck\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Task.user\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Task\"], baseName' = FName \"user\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Task where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Task where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "task_id" (_task_id msg)
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "executor_id" (_executor_id msg)
       P'.tellT "agent_id" (_agent_id msg)
       P'.tellT "state" (_state msg)
       P'.tellT "resources" (_resources msg)
       P'.tellT "statuses" (_statuses msg)
       P'.tellT "status_update_state" (_status_update_state msg)
       P'.tellT "status_update_uuid" (_status_update_uuid msg)
       P'.tellT "labels" (_labels msg)
       P'.tellT "discovery" (_discovery msg)
       P'.tellT "container" (_container msg)
       P'.tellT "health_check" (_health_check msg)
       P'.tellT "user" (_user msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_name, parse'_task_id, parse'_framework_id, parse'_executor_id, parse'_agent_id, parse'_state,
                   parse'_resources, parse'_statuses, parse'_status_update_state, parse'_status_update_uuid, parse'_labels,
                   parse'_discovery, parse'_container, parse'_health_check, parse'_user])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_task_id
         = P'.try
            (do
               v <- P'.getT "task_id"
               Prelude'.return (\ o -> o{_task_id = v}))
        parse'_framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{_framework_id = v}))
        parse'_executor_id
         = P'.try
            (do
               v <- P'.getT "executor_id"
               Prelude'.return (\ o -> o{_executor_id = v}))
        parse'_agent_id
         = P'.try
            (do
               v <- P'.getT "agent_id"
               Prelude'.return (\ o -> o{_agent_id = v}))
        parse'_state
         = P'.try
            (do
               v <- P'.getT "state"
               Prelude'.return (\ o -> o{_state = v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))
        parse'_statuses
         = P'.try
            (do
               v <- P'.getT "statuses"
               Prelude'.return (\ o -> o{_statuses = P'.append (_statuses o) v}))
        parse'_status_update_state
         = P'.try
            (do
               v <- P'.getT "status_update_state"
               Prelude'.return (\ o -> o{_status_update_state = v}))
        parse'_status_update_uuid
         = P'.try
            (do
               v <- P'.getT "status_update_uuid"
               Prelude'.return (\ o -> o{_status_update_uuid = v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))
        parse'_discovery
         = P'.try
            (do
               v <- P'.getT "discovery"
               Prelude'.return (\ o -> o{_discovery = v}))
        parse'_container
         = P'.try
            (do
               v <- P'.getT "container"
               Prelude'.return (\ o -> o{_container = v}))
        parse'_health_check
         = P'.try
            (do
               v <- P'.getT "health_check"
               Prelude'.return (\ o -> o{_health_check = v}))
        parse'_user
         = P'.try
            (do
               v <- P'.getT "user"
               Prelude'.return (\ o -> o{_user = v}))