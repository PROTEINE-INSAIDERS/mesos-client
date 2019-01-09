{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Operation (Operation(..), framework_id, agent_id, info, latest_status, statuses, uuid) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.Offer.Operation as Protos.Offer (Operation)
import qualified Mesos.V1.Protos.OperationStatus as Protos (OperationStatus)
import qualified Mesos.V1.Protos.UUID as Protos (UUID)

data Operation = Operation{_framework_id :: !(P'.Maybe Protos.FrameworkID), _agent_id :: !(P'.Maybe Protos.AgentID),
                           _info :: !(Protos.Offer.Operation), _latest_status :: !(Protos.OperationStatus),
                           _statuses :: !(P'.Seq Protos.OperationStatus), _uuid :: !(Protos.UUID)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Operation

instance P'.ToJSON Operation where
  toJSON msg
   = P'.objectNoEmpty
      ([("framework_id", P'.toJSON (Prelude'.fmap P'.toJSON (framework_id msg))),
        ("agent_id", P'.toJSON (Prelude'.fmap P'.toJSON (agent_id msg))), ("info", P'.toJSON (info msg)),
        ("latest_status", P'.toJSON (latest_status msg)), ("statuses", P'.toJSON (Prelude'.fmap P'.toJSON (statuses msg))),
        ("uuid", P'.toJSON (uuid msg))]
        ++ Prelude'.concat [])

instance P'.FromJSON Operation where
  parseJSON
   = P'.withObject "Operation"
      (\ o ->
        do
          framework_id <- P'.explicitParseFieldMaybe P'.parseJSON o "framework_id"
          agent_id <- P'.explicitParseFieldMaybe P'.parseJSON o "agent_id"
          info <- P'.explicitParseField P'.parseJSON o "info"
          latest_status <- P'.explicitParseField P'.parseJSON o "latest_status"
          statuses <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                       (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "statuses")
          uuid <- P'.explicitParseField P'.parseJSON o "uuid"
          Prelude'.return
           P'.defaultValue{_framework_id = framework_id, _agent_id = agent_id, _info = info, _latest_status = latest_status,
                           _statuses = statuses, _uuid = uuid})

instance P'.Mergeable Operation where
  mergeAppend (Operation x'1 x'2 x'3 x'4 x'5 x'6) (Operation y'1 y'2 y'3 y'4 y'5 y'6)
   = Operation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default Operation where
  defaultValue = Operation P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Operation where
  wireSize ft' self'@(Operation x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeReq 1 11 x'4 +
             P'.wireSizeRep 1 11 x'5
             + P'.wireSizeReq 1 11 x'6)
  wirePutWithSize ft' self'@(Operation x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutReqWithSize 34 11 x'4, P'.wirePutRepWithSize 42 11 x'5, P'.wirePutReqWithSize 50 11 x'6]
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
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_agent_id = P'.mergeAppend (_agent_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_info = P'.mergeAppend (_info old'Self) (new'Field)}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_latest_status = P'.mergeAppend (_latest_status old'Self) (new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_statuses = P'.append (_statuses old'Self) new'Field}) (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_uuid = P'.mergeAppend (_uuid old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Operation) Operation where
  getVal m' f' = f' m'

instance P'.GPB Operation

instance P'.ReflectDescriptor Operation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [26, 34, 50]) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Operation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Operation\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Operation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Operation.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Operation.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Operation.info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\"], baseName = MName \"Operation\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Operation.latest_status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"latest_status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OperationStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Operation.statuses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"statuses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OperationStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Operation.uuid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Operation\"], baseName' = FName \"uuid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.UUID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"UUID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Operation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Operation where
  textPut msg
   = do
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "agent_id" (_agent_id msg)
       P'.tellT "info" (_info msg)
       P'.tellT "latest_status" (_latest_status msg)
       P'.tellT "statuses" (_statuses msg)
       P'.tellT "uuid" (_uuid msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'_framework_id, parse'_agent_id, parse'_info, parse'_latest_status, parse'_statuses, parse'_uuid])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{_framework_id = v}))
        parse'_agent_id
         = P'.try
            (do
               v <- P'.getT "agent_id"
               Prelude'.return (\ o -> o{_agent_id = v}))
        parse'_info
         = P'.try
            (do
               v <- P'.getT "info"
               Prelude'.return (\ o -> o{_info = v}))
        parse'_latest_status
         = P'.try
            (do
               v <- P'.getT "latest_status"
               Prelude'.return (\ o -> o{_latest_status = v}))
        parse'_statuses
         = P'.try
            (do
               v <- P'.getT "statuses"
               Prelude'.return (\ o -> o{_statuses = P'.append (_statuses o) v}))
        parse'_uuid
         = P'.try
            (do
               v <- P'.getT "uuid"
               Prelude'.return (\ o -> o{_uuid = v}))