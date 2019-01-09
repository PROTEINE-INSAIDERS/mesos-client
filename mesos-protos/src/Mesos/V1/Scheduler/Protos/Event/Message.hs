{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Event.Message (Message(..), agent_id, executor_id, data') where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.ExecutorID as Protos (ExecutorID)

data Message = Message{_agent_id :: !(Protos.AgentID), _executor_id :: !(Protos.ExecutorID), _data' :: !(P'.ByteString)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Message

instance P'.ToJSON Message where
  toJSON msg
   = P'.objectNoEmpty
      ([("agent_id", P'.toJSON (agent_id msg)), ("executor_id", P'.toJSON (executor_id msg)),
        ("data", P'.toJSONByteString (data' msg))]
        ++ Prelude'.concat [])

instance P'.FromJSON Message where
  parseJSON
   = P'.withObject "Message"
      (\ o ->
        do
          agent_id <- P'.explicitParseField P'.parseJSON o "agent_id"
          executor_id <- P'.explicitParseField P'.parseJSON o "executor_id"
          data' <- P'.explicitParseField P'.parseJSONByteString o "data"
          Prelude'.return P'.defaultValue{_agent_id = agent_id, _executor_id = executor_id, _data' = data'})

instance P'.Mergeable Message where
  mergeAppend (Message x'1 x'2 x'3) (Message y'1 y'2 y'3)
   = Message (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Message where
  defaultValue = Message P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Message where
  wireSize ft' self'@(Message x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeReq 1 12 x'3)
  wirePutWithSize ft' self'@(Message x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutReqWithSize 26 12 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_agent_id = P'.mergeAppend (_agent_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_executor_id = P'.mergeAppend (_executor_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_data' = new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Message) Message where
  getVal m' f' = f' m'

instance P'.GPB Message

instance P'.ReflectDescriptor Message where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18, 26]) (P'.fromDistinctAscList [10, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Message\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Message\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Event\",\"Message.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Message.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Message\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Message.executor_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Message\"], baseName' = FName \"executor_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Message.data\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Message\"], baseName' = FName \"data'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Message where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Message where
  textPut msg
   = do
       P'.tellT "agent_id" (_agent_id msg)
       P'.tellT "executor_id" (_executor_id msg)
       P'.tellT "data" (_data' msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_agent_id, parse'_executor_id, parse'_data']) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
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
        parse'_data'
         = P'.try
            (do
               v <- P'.getT "data"
               Prelude'.return (\ o -> o{_data' = v}))