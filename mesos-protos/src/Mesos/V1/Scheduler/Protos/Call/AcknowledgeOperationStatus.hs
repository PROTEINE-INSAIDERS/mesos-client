{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Call.AcknowledgeOperationStatus (AcknowledgeOperationStatus(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.OperationID as Protos (OperationID)
import qualified Mesos.V1.Protos.ResourceProviderID as Protos (ResourceProviderID)

data AcknowledgeOperationStatus = AcknowledgeOperationStatus{agent_id :: !(P'.Maybe Protos.AgentID),
                                                             resource_provider_id :: !(P'.Maybe Protos.ResourceProviderID),
                                                             uuid :: !(P'.ByteString), operation_id :: !(Protos.OperationID)}
                                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                            Prelude'.Generic)

instance P'.ToJSON AcknowledgeOperationStatus where
  toJSON msg
   = P'.objectNoEmpty
      ([("agent_id", P'.toJSON (Prelude'.fmap P'.toJSON (agent_id msg))),
        ("resource_provider_id", P'.toJSON (Prelude'.fmap P'.toJSON (resource_provider_id msg))),
        ("uuid", P'.toJSONByteString (uuid msg)), ("operation_id", P'.toJSON (operation_id msg))]
        ++ Prelude'.concat [])

instance P'.FromJSON AcknowledgeOperationStatus where
  parseJSON
   = P'.withObject "AcknowledgeOperationStatus"
      (\ o ->
        do
          agent_id <- P'.explicitParseFieldMaybe P'.parseJSON o "agent_id"
          resource_provider_id <- P'.explicitParseFieldMaybe P'.parseJSON o "resource_provider_id"
          uuid <- P'.explicitParseField P'.parseJSONByteString o "uuid"
          operation_id <- P'.explicitParseField P'.parseJSON o "operation_id"
          Prelude'.return
           P'.defaultValue{agent_id = agent_id, resource_provider_id = resource_provider_id, uuid = uuid,
                           operation_id = operation_id})

instance P'.Mergeable AcknowledgeOperationStatus where
  mergeAppend (AcknowledgeOperationStatus x'1 x'2 x'3 x'4) (AcknowledgeOperationStatus y'1 y'2 y'3 y'4)
   = AcknowledgeOperationStatus (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default AcknowledgeOperationStatus where
  defaultValue = AcknowledgeOperationStatus P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire AcknowledgeOperationStatus where
  wireSize ft' self'@(AcknowledgeOperationStatus x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeReq 1 12 x'3 + P'.wireSizeReq 1 11 x'4)
  wirePutWithSize ft' self'@(AcknowledgeOperationStatus x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutReqWithSize 26 12 x'3,
             P'.wirePutReqWithSize 34 11 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{agent_id = P'.mergeAppend (agent_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{resource_provider_id = P'.mergeAppend (resource_provider_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{uuid = new'Field}) (P'.wireGet 12)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{operation_id = P'.mergeAppend (operation_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AcknowledgeOperationStatus) AcknowledgeOperationStatus where
  getVal m' f' = f' m'

instance P'.GPB AcknowledgeOperationStatus

instance P'.ReflectDescriptor AcknowledgeOperationStatus where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [26, 34]) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.AcknowledgeOperationStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"AcknowledgeOperationStatus\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Call\",\"AcknowledgeOperationStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.AcknowledgeOperationStatus.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.AcknowledgeOperationStatus.resource_provider_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"resource_provider_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ResourceProviderID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ResourceProviderID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.AcknowledgeOperationStatus.uuid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"uuid\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.AcknowledgeOperationStatus.operation_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcknowledgeOperationStatus\"], baseName' = FName \"operation_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OperationID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType AcknowledgeOperationStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AcknowledgeOperationStatus where
  textPut msg
   = do
       P'.tellT "agent_id" (agent_id msg)
       P'.tellT "resource_provider_id" (resource_provider_id msg)
       P'.tellT "uuid" (uuid msg)
       P'.tellT "operation_id" (operation_id msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'agent_id, parse'resource_provider_id, parse'uuid, parse'operation_id]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'agent_id
         = P'.try
            (do
               v <- P'.getT "agent_id"
               Prelude'.return (\ o -> o{agent_id = v}))
        parse'resource_provider_id
         = P'.try
            (do
               v <- P'.getT "resource_provider_id"
               Prelude'.return (\ o -> o{resource_provider_id = v}))
        parse'uuid
         = P'.try
            (do
               v <- P'.getT "uuid"
               Prelude'.return (\ o -> o{uuid = v}))
        parse'operation_id
         = P'.try
            (do
               v <- P'.getT "operation_id"
               Prelude'.return (\ o -> o{operation_id = v}))