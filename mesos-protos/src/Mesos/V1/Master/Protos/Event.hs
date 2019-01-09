{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Event
       (Event(..), type', subscribed, task_added, task_updated, agent_added, agent_removed, framework_added, framework_updated,
        framework_removed)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Event.AgentAdded as Protos.Event (AgentAdded)
import qualified Mesos.V1.Master.Protos.Event.AgentRemoved as Protos.Event (AgentRemoved)
import qualified Mesos.V1.Master.Protos.Event.FrameworkAdded as Protos.Event (FrameworkAdded)
import qualified Mesos.V1.Master.Protos.Event.FrameworkRemoved as Protos.Event (FrameworkRemoved)
import qualified Mesos.V1.Master.Protos.Event.FrameworkUpdated as Protos.Event (FrameworkUpdated)
import qualified Mesos.V1.Master.Protos.Event.Subscribed as Protos.Event (Subscribed)
import qualified Mesos.V1.Master.Protos.Event.TaskAdded as Protos.Event (TaskAdded)
import qualified Mesos.V1.Master.Protos.Event.TaskUpdated as Protos.Event (TaskUpdated)
import qualified Mesos.V1.Master.Protos.Event.Type as Protos.Event (Type)

data Event = Event{_type' :: !(P'.Maybe Protos.Event.Type), _subscribed :: !(P'.Maybe Protos.Event.Subscribed),
                   _task_added :: !(P'.Maybe Protos.Event.TaskAdded), _task_updated :: !(P'.Maybe Protos.Event.TaskUpdated),
                   _agent_added :: !(P'.Maybe Protos.Event.AgentAdded), _agent_removed :: !(P'.Maybe Protos.Event.AgentRemoved),
                   _framework_added :: !(P'.Maybe Protos.Event.FrameworkAdded),
                   _framework_updated :: !(P'.Maybe Protos.Event.FrameworkUpdated),
                   _framework_removed :: !(P'.Maybe Protos.Event.FrameworkRemoved)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Event

instance P'.ToJSON Event where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("subscribed", P'.toJSON (Prelude'.fmap P'.toJSON (subscribed msg))),
        ("task_added", P'.toJSON (Prelude'.fmap P'.toJSON (task_added msg))),
        ("task_updated", P'.toJSON (Prelude'.fmap P'.toJSON (task_updated msg))),
        ("agent_added", P'.toJSON (Prelude'.fmap P'.toJSON (agent_added msg))),
        ("agent_removed", P'.toJSON (Prelude'.fmap P'.toJSON (agent_removed msg))),
        ("framework_added", P'.toJSON (Prelude'.fmap P'.toJSON (framework_added msg))),
        ("framework_updated", P'.toJSON (Prelude'.fmap P'.toJSON (framework_updated msg))),
        ("framework_removed", P'.toJSON (Prelude'.fmap P'.toJSON (framework_removed msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Event where
  parseJSON
   = P'.withObject "Event"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          subscribed <- P'.explicitParseFieldMaybe P'.parseJSON o "subscribed"
          task_added <- P'.explicitParseFieldMaybe P'.parseJSON o "task_added"
          task_updated <- P'.explicitParseFieldMaybe P'.parseJSON o "task_updated"
          agent_added <- P'.explicitParseFieldMaybe P'.parseJSON o "agent_added"
          agent_removed <- P'.explicitParseFieldMaybe P'.parseJSON o "agent_removed"
          framework_added <- P'.explicitParseFieldMaybe P'.parseJSON o "framework_added"
          framework_updated <- P'.explicitParseFieldMaybe P'.parseJSON o "framework_updated"
          framework_removed <- P'.explicitParseFieldMaybe P'.parseJSON o "framework_removed"
          Prelude'.return
           P'.defaultValue{_type' = type', _subscribed = subscribed, _task_added = task_added, _task_updated = task_updated,
                           _agent_added = agent_added, _agent_removed = agent_removed, _framework_added = framework_added,
                           _framework_updated = framework_updated, _framework_removed = framework_removed})

instance P'.Mergeable Event where
  mergeAppend (Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (Event y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = Event (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)

instance P'.Default Event where
  defaultValue
   = Event P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Event where
  wireSize ft' self'@(Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
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
             + P'.wireSizeOpt 1 11 x'9)
  wirePutWithSize ft' self'@(Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutOptWithSize 50 11 x'6,
             P'.wirePutOptWithSize 58 11 x'7, P'.wirePutOptWithSize 66 11 x'8, P'.wirePutOptWithSize 74 11 x'9]
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
                    (\ !new'Field -> old'Self{_subscribed = P'.mergeAppend (_subscribed old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_task_added = P'.mergeAppend (_task_added old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_task_updated = P'.mergeAppend (_task_updated old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_agent_added = P'.mergeAppend (_agent_added old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_agent_removed = P'.mergeAppend (_agent_removed old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_framework_added = P'.mergeAppend (_framework_added old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_framework_updated = P'.mergeAppend (_framework_updated old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_framework_removed = P'.mergeAppend (_framework_removed old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Event) Event where
  getVal m' f' = f' m'

instance P'.GPB Event

instance P'.ReflectDescriptor Event where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58, 66, 74])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Event\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\"], baseName = MName \"Event\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Event.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.subscribed\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"subscribed\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.Subscribed\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Subscribed\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.task_added\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"task_added\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.TaskAdded\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"TaskAdded\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.task_updated\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"task_updated\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.TaskUpdated\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"TaskUpdated\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.agent_added\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"agent_added\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.AgentAdded\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"AgentAdded\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.agent_removed\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"agent_removed\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.AgentRemoved\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"AgentRemoved\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.framework_added\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"framework_added\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.FrameworkAdded\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"FrameworkAdded\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.framework_updated\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"framework_updated\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.FrameworkUpdated\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"FrameworkUpdated\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.framework_removed\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"framework_removed\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Event.FrameworkRemoved\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"FrameworkRemoved\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Event where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Event where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "subscribed" (_subscribed msg)
       P'.tellT "task_added" (_task_added msg)
       P'.tellT "task_updated" (_task_updated msg)
       P'.tellT "agent_added" (_agent_added msg)
       P'.tellT "agent_removed" (_agent_removed msg)
       P'.tellT "framework_added" (_framework_added msg)
       P'.tellT "framework_updated" (_framework_updated msg)
       P'.tellT "framework_removed" (_framework_removed msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_subscribed, parse'_task_added, parse'_task_updated, parse'_agent_added,
                   parse'_agent_removed, parse'_framework_added, parse'_framework_updated, parse'_framework_removed])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_subscribed
         = P'.try
            (do
               v <- P'.getT "subscribed"
               Prelude'.return (\ o -> o{_subscribed = v}))
        parse'_task_added
         = P'.try
            (do
               v <- P'.getT "task_added"
               Prelude'.return (\ o -> o{_task_added = v}))
        parse'_task_updated
         = P'.try
            (do
               v <- P'.getT "task_updated"
               Prelude'.return (\ o -> o{_task_updated = v}))
        parse'_agent_added
         = P'.try
            (do
               v <- P'.getT "agent_added"
               Prelude'.return (\ o -> o{_agent_added = v}))
        parse'_agent_removed
         = P'.try
            (do
               v <- P'.getT "agent_removed"
               Prelude'.return (\ o -> o{_agent_removed = v}))
        parse'_framework_added
         = P'.try
            (do
               v <- P'.getT "framework_added"
               Prelude'.return (\ o -> o{_framework_added = v}))
        parse'_framework_updated
         = P'.try
            (do
               v <- P'.getT "framework_updated"
               Prelude'.return (\ o -> o{_framework_updated = v}))
        parse'_framework_removed
         = P'.try
            (do
               v <- P'.getT "framework_removed"
               Prelude'.return (\ o -> o{_framework_removed = v}))