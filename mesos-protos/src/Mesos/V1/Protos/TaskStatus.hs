{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TaskStatus
       (TaskStatus(..), task_id, state, message, source, reason, data', agent_id, executor_id, timestamp, uuid, healthy,
        check_status, labels, container_status, unreachable_time, limitation)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.CheckStatusInfo as Protos (CheckStatusInfo)
import qualified Mesos.V1.Protos.ContainerStatus as Protos (ContainerStatus)
import qualified Mesos.V1.Protos.ExecutorID as Protos (ExecutorID)
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.TaskID as Protos (TaskID)
import qualified Mesos.V1.Protos.TaskResourceLimitation as Protos (TaskResourceLimitation)
import qualified Mesos.V1.Protos.TaskState as Protos (TaskState)
import qualified Mesos.V1.Protos.TaskStatus.Reason as Protos.TaskStatus (Reason)
import qualified Mesos.V1.Protos.TaskStatus.Source as Protos.TaskStatus (Source)
import qualified Mesos.V1.Protos.TimeInfo as Protos (TimeInfo)

data TaskStatus = TaskStatus{_task_id :: !(Protos.TaskID), _state :: !(Protos.TaskState), _message :: !(P'.Maybe P'.Utf8),
                             _source :: !(P'.Maybe Protos.TaskStatus.Source), _reason :: !(P'.Maybe Protos.TaskStatus.Reason),
                             _data' :: !(P'.Maybe P'.ByteString), _agent_id :: !(P'.Maybe Protos.AgentID),
                             _executor_id :: !(P'.Maybe Protos.ExecutorID), _timestamp :: !(P'.Maybe P'.Double),
                             _uuid :: !(P'.Maybe P'.ByteString), _healthy :: !(P'.Maybe P'.Bool),
                             _check_status :: !(P'.Maybe Protos.CheckStatusInfo), _labels :: !(P'.Maybe Protos.Labels),
                             _container_status :: !(P'.Maybe Protos.ContainerStatus),
                             _unreachable_time :: !(P'.Maybe Protos.TimeInfo),
                             _limitation :: !(P'.Maybe Protos.TaskResourceLimitation)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''TaskStatus

instance P'.ToJSON TaskStatus where
  toJSON msg
   = P'.objectNoEmpty
      ([("task_id", P'.toJSON (task_id msg)), ("state", P'.toJSON (state msg)),
        ("message", P'.toJSON (Prelude'.fmap P'.toJSON (message msg))),
        ("source", P'.toJSON (Prelude'.fmap P'.toJSON (source msg))), ("reason", P'.toJSON (Prelude'.fmap P'.toJSON (reason msg))),
        ("data", P'.toJSON (Prelude'.fmap P'.toJSONByteString (data' msg))),
        ("agent_id", P'.toJSON (Prelude'.fmap P'.toJSON (agent_id msg))),
        ("executor_id", P'.toJSON (Prelude'.fmap P'.toJSON (executor_id msg))),
        ("timestamp", P'.toJSON (Prelude'.fmap P'.toJSON (timestamp msg))),
        ("uuid", P'.toJSON (Prelude'.fmap P'.toJSONByteString (uuid msg))),
        ("healthy", P'.toJSON (Prelude'.fmap P'.toJSON (healthy msg))),
        ("check_status", P'.toJSON (Prelude'.fmap P'.toJSON (check_status msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg))),
        ("container_status", P'.toJSON (Prelude'.fmap P'.toJSON (container_status msg))),
        ("unreachable_time", P'.toJSON (Prelude'.fmap P'.toJSON (unreachable_time msg))),
        ("limitation", P'.toJSON (Prelude'.fmap P'.toJSON (limitation msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON TaskStatus where
  parseJSON
   = P'.withObject "TaskStatus"
      (\ o ->
        do
          task_id <- P'.explicitParseField P'.parseJSON o "task_id"
          state <- P'.explicitParseField P'.parseJSON o "state"
          message <- P'.explicitParseFieldMaybe P'.parseJSON o "message"
          source <- P'.explicitParseFieldMaybe P'.parseJSON o "source"
          reason <- P'.explicitParseFieldMaybe P'.parseJSON o "reason"
          data' <- P'.explicitParseFieldMaybe P'.parseJSONByteString o "data"
          agent_id <- P'.explicitParseFieldMaybe P'.parseJSON o "agent_id"
          executor_id <- P'.explicitParseFieldMaybe P'.parseJSON o "executor_id"
          timestamp <- P'.explicitParseFieldMaybe P'.parseJSON o "timestamp"
          uuid <- P'.explicitParseFieldMaybe P'.parseJSONByteString o "uuid"
          healthy <- P'.explicitParseFieldMaybe P'.parseJSONBool o "healthy"
          check_status <- P'.explicitParseFieldMaybe P'.parseJSON o "check_status"
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          container_status <- P'.explicitParseFieldMaybe P'.parseJSON o "container_status"
          unreachable_time <- P'.explicitParseFieldMaybe P'.parseJSON o "unreachable_time"
          limitation <- P'.explicitParseFieldMaybe P'.parseJSON o "limitation"
          Prelude'.return
           P'.defaultValue{_task_id = task_id, _state = state, _message = message, _source = source, _reason = reason,
                           _data' = data', _agent_id = agent_id, _executor_id = executor_id, _timestamp = timestamp, _uuid = uuid,
                           _healthy = healthy, _check_status = check_status, _labels = labels, _container_status = container_status,
                           _unreachable_time = unreachable_time, _limitation = limitation})

instance P'.Mergeable TaskStatus where
  mergeAppend (TaskStatus x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   (TaskStatus y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16)
   = TaskStatus (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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

instance P'.Default TaskStatus where
  defaultValue
   = TaskStatus P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire TaskStatus where
  wireSize ft' self'@(TaskStatus x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 14 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 14 x'4 +
             P'.wireSizeOpt 1 14 x'5
             + P'.wireSizeOpt 1 12 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 1 x'9
             + P'.wireSizeOpt 1 12 x'10
             + P'.wireSizeOpt 1 8 x'11
             + P'.wireSizeOpt 1 11 x'12
             + P'.wireSizeOpt 1 11 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 2 11 x'16)
  wirePutWithSize ft' self'@(TaskStatus x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 16 14 x'2, P'.wirePutOptWithSize 26 12 x'6,
             P'.wirePutOptWithSize 34 9 x'3, P'.wirePutOptWithSize 42 11 x'7, P'.wirePutOptWithSize 49 1 x'9,
             P'.wirePutOptWithSize 58 11 x'8, P'.wirePutOptWithSize 64 8 x'11, P'.wirePutOptWithSize 72 14 x'4,
             P'.wirePutOptWithSize 80 14 x'5, P'.wirePutOptWithSize 90 12 x'10, P'.wirePutOptWithSize 98 11 x'13,
             P'.wirePutOptWithSize 106 11 x'14, P'.wirePutOptWithSize 114 11 x'15, P'.wirePutOptWithSize 122 11 x'12,
             P'.wirePutOptWithSize 130 11 x'16]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_task_id = P'.mergeAppend (_task_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_state = new'Field}) (P'.wireGet 14)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_message = Prelude'.Just new'Field}) (P'.wireGet 9)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = Prelude'.Just new'Field}) (P'.wireGet 14)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_reason = Prelude'.Just new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_data' = Prelude'.Just new'Field}) (P'.wireGet 12)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_agent_id = P'.mergeAppend (_agent_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_executor_id = P'.mergeAppend (_executor_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             49 -> Prelude'.fmap (\ !new'Field -> old'Self{_timestamp = Prelude'.Just new'Field}) (P'.wireGet 1)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{_uuid = Prelude'.Just new'Field}) (P'.wireGet 12)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_healthy = Prelude'.Just new'Field}) (P'.wireGet 8)
             122 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_check_status = P'.mergeAppend (_check_status old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             98 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_container_status = P'.mergeAppend (_container_status old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_unreachable_time = P'.mergeAppend (_unreachable_time old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_limitation = P'.mergeAppend (_limitation old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TaskStatus) TaskStatus where
  getVal m' f' = f' m'

instance P'.GPB TaskStatus

instance P'.ReflectDescriptor TaskStatus where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16])
      (P'.fromDistinctAscList [10, 16, 26, 34, 42, 49, 58, 64, 72, 80, 90, 98, 106, 114, 122, 130])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.TaskStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskStatus\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"TaskStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.task_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"task_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.state\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"state\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskState\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.message\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"message\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.source\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskStatus.Source\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"TaskStatus\"], baseName = MName \"Source\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.reason\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"reason\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskStatus.Reason\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"TaskStatus\"], baseName = MName \"Reason\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.data\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"data'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.executor_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"executor_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.timestamp\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"timestamp\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.uuid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"uuid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.healthy\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"healthy\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.check_status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"check_status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CheckStatusInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CheckStatusInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.container_status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"container_status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.unreachable_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"unreachable_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TaskStatus.limitation\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TaskStatus\"], baseName' = FName \"limitation\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskResourceLimitation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskResourceLimitation\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType TaskStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TaskStatus where
  textPut msg
   = do
       P'.tellT "task_id" (_task_id msg)
       P'.tellT "state" (_state msg)
       P'.tellT "message" (_message msg)
       P'.tellT "source" (_source msg)
       P'.tellT "reason" (_reason msg)
       P'.tellT "data" (_data' msg)
       P'.tellT "agent_id" (_agent_id msg)
       P'.tellT "executor_id" (_executor_id msg)
       P'.tellT "timestamp" (_timestamp msg)
       P'.tellT "uuid" (_uuid msg)
       P'.tellT "healthy" (_healthy msg)
       P'.tellT "check_status" (_check_status msg)
       P'.tellT "labels" (_labels msg)
       P'.tellT "container_status" (_container_status msg)
       P'.tellT "unreachable_time" (_unreachable_time msg)
       P'.tellT "limitation" (_limitation msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_task_id, parse'_state, parse'_message, parse'_source, parse'_reason, parse'_data', parse'_agent_id,
                   parse'_executor_id, parse'_timestamp, parse'_uuid, parse'_healthy, parse'_check_status, parse'_labels,
                   parse'_container_status, parse'_unreachable_time, parse'_limitation])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_task_id
         = P'.try
            (do
               v <- P'.getT "task_id"
               Prelude'.return (\ o -> o{_task_id = v}))
        parse'_state
         = P'.try
            (do
               v <- P'.getT "state"
               Prelude'.return (\ o -> o{_state = v}))
        parse'_message
         = P'.try
            (do
               v <- P'.getT "message"
               Prelude'.return (\ o -> o{_message = v}))
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))
        parse'_reason
         = P'.try
            (do
               v <- P'.getT "reason"
               Prelude'.return (\ o -> o{_reason = v}))
        parse'_data'
         = P'.try
            (do
               v <- P'.getT "data"
               Prelude'.return (\ o -> o{_data' = v}))
        parse'_agent_id
         = P'.try
            (do
               v <- P'.getT "agent_id"
               Prelude'.return (\ o -> o{_agent_id = v}))
        parse'_executor_id
         = P'.try
            (do
               v <- P'.getT "executor_id"
               Prelude'.return (\ o -> o{_executor_id = v}))
        parse'_timestamp
         = P'.try
            (do
               v <- P'.getT "timestamp"
               Prelude'.return (\ o -> o{_timestamp = v}))
        parse'_uuid
         = P'.try
            (do
               v <- P'.getT "uuid"
               Prelude'.return (\ o -> o{_uuid = v}))
        parse'_healthy
         = P'.try
            (do
               v <- P'.getT "healthy"
               Prelude'.return (\ o -> o{_healthy = v}))
        parse'_check_status
         = P'.try
            (do
               v <- P'.getT "check_status"
               Prelude'.return (\ o -> o{_check_status = v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))
        parse'_container_status
         = P'.try
            (do
               v <- P'.getT "container_status"
               Prelude'.return (\ o -> o{_container_status = v}))
        parse'_unreachable_time
         = P'.try
            (do
               v <- P'.getT "unreachable_time"
               Prelude'.return (\ o -> o{_unreachable_time = v}))
        parse'_limitation
         = P'.try
            (do
               v <- P'.getT "limitation"
               Prelude'.return (\ o -> o{_limitation = v}))