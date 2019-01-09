{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Event.Subscribed (Subscribed(..), executor_info, framework_info, agent_info, container_id) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentInfo as Protos (AgentInfo)
import qualified Mesos.V1.Protos.ContainerID as Protos (ContainerID)
import qualified Mesos.V1.Protos.ExecutorInfo as Protos (ExecutorInfo)
import qualified Mesos.V1.Protos.FrameworkInfo as Protos (FrameworkInfo)

data Subscribed = Subscribed{_executor_info :: !(Protos.ExecutorInfo), _framework_info :: !(Protos.FrameworkInfo),
                             _agent_info :: !(Protos.AgentInfo), _container_id :: !(P'.Maybe Protos.ContainerID)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Subscribed

instance P'.ToJSON Subscribed where
  toJSON msg
   = P'.objectNoEmpty
      ([("executor_info", P'.toJSON (executor_info msg)), ("framework_info", P'.toJSON (framework_info msg)),
        ("agent_info", P'.toJSON (agent_info msg)), ("container_id", P'.toJSON (Prelude'.fmap P'.toJSON (container_id msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Subscribed where
  parseJSON
   = P'.withObject "Subscribed"
      (\ o ->
        do
          executor_info <- P'.explicitParseField P'.parseJSON o "executor_info"
          framework_info <- P'.explicitParseField P'.parseJSON o "framework_info"
          agent_info <- P'.explicitParseField P'.parseJSON o "agent_info"
          container_id <- P'.explicitParseFieldMaybe P'.parseJSON o "container_id"
          Prelude'.return
           P'.defaultValue{_executor_info = executor_info, _framework_info = framework_info, _agent_info = agent_info,
                           _container_id = container_id})

instance P'.Mergeable Subscribed where
  mergeAppend (Subscribed x'1 x'2 x'3 x'4) (Subscribed y'1 y'2 y'3 y'4)
   = Subscribed (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default Subscribed where
  defaultValue = Subscribed P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Subscribed where
  wireSize ft' self'@(Subscribed x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(Subscribed x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_executor_info = P'.mergeAppend (_executor_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_info = P'.mergeAppend (_framework_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_agent_info = P'.mergeAppend (_agent_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_container_id = P'.mergeAppend (_container_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Subscribed) Subscribed where
  getVal m' f' = f' m'

instance P'.GPB Subscribed

instance P'.ReflectDescriptor Subscribed where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18, 26]) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Subscribed\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Subscribed\"}, descFilePath = [\"Mesos\",\"V1\",\"Executor\",\"Protos\",\"Event\",\"Subscribed.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.Subscribed.executor_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"executor_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.Subscribed.framework_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"framework_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.Subscribed.agent_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"agent_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.Subscribed.container_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"container_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Subscribed where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Subscribed where
  textPut msg
   = do
       P'.tellT "executor_info" (_executor_info msg)
       P'.tellT "framework_info" (_framework_info msg)
       P'.tellT "agent_info" (_agent_info msg)
       P'.tellT "container_id" (_container_id msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_executor_info, parse'_framework_info, parse'_agent_info, parse'_container_id])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_executor_info
         = P'.try
            (do
               v <- P'.getT "executor_info"
               Prelude'.return (\ o -> o{_executor_info = v}))
        parse'_framework_info
         = P'.try
            (do
               v <- P'.getT "framework_info"
               Prelude'.return (\ o -> o{_framework_info = v}))
        parse'_agent_info
         = P'.try
            (do
               v <- P'.getT "agent_info"
               Prelude'.return (\ o -> o{_agent_info = v}))
        parse'_container_id
         = P'.try
            (do
               v <- P'.getT "container_id"
               Prelude'.return (\ o -> o{_container_id = v}))