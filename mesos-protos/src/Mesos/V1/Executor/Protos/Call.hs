{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Call (Call(..), executor_id, framework_id, type', subscribe, update, message) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Executor.Protos.Call.Message as Protos.Call (Message)
import qualified Mesos.V1.Executor.Protos.Call.Subscribe as Protos.Call (Subscribe)
import qualified Mesos.V1.Executor.Protos.Call.Type as Protos.Call (Type)
import qualified Mesos.V1.Executor.Protos.Call.Update as Protos.Call (Update)
import qualified Mesos.V1.Protos.ExecutorID as Protos (ExecutorID)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)

data Call = Call{_executor_id :: !(Protos.ExecutorID), _framework_id :: !(Protos.FrameworkID),
                 _type' :: !(P'.Maybe Protos.Call.Type), _subscribe :: !(P'.Maybe Protos.Call.Subscribe),
                 _update :: !(P'.Maybe Protos.Call.Update), _message :: !(P'.Maybe Protos.Call.Message)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Call

instance P'.ToJSON Call where
  toJSON msg
   = P'.objectNoEmpty
      ([("executor_id", P'.toJSON (executor_id msg)), ("framework_id", P'.toJSON (framework_id msg)),
        ("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("subscribe", P'.toJSON (Prelude'.fmap P'.toJSON (subscribe msg))),
        ("update", P'.toJSON (Prelude'.fmap P'.toJSON (update msg))),
        ("message", P'.toJSON (Prelude'.fmap P'.toJSON (message msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Call where
  parseJSON
   = P'.withObject "Call"
      (\ o ->
        do
          executor_id <- P'.explicitParseField P'.parseJSON o "executor_id"
          framework_id <- P'.explicitParseField P'.parseJSON o "framework_id"
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          subscribe <- P'.explicitParseFieldMaybe P'.parseJSON o "subscribe"
          update <- P'.explicitParseFieldMaybe P'.parseJSON o "update"
          message <- P'.explicitParseFieldMaybe P'.parseJSON o "message"
          Prelude'.return
           P'.defaultValue{_executor_id = executor_id, _framework_id = framework_id, _type' = type', _subscribe = subscribe,
                           _update = update, _message = message})

instance P'.Mergeable Call where
  mergeAppend (Call x'1 x'2 x'3 x'4 x'5 x'6) (Call y'1 y'2 y'3 y'4 y'5 y'6)
   = Call (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default Call where
  defaultValue = Call P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Call where
  wireSize ft' self'@(Call x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeOpt 1 14 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6)
  wirePutWithSize ft' self'@(Call x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutOptWithSize 24 14 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutOptWithSize 50 11 x'6]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_executor_id = P'.mergeAppend (_executor_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_subscribe = P'.mergeAppend (_subscribe old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_update = P'.mergeAppend (_update old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_message = P'.mergeAppend (_message old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Call) Call where
  getVal m' f' = f' m'

instance P'.GPB Call

instance P'.ReflectDescriptor Call where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18, 24, 34, 42, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.executor.Call\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\"], baseName = MName \"Call\"}, descFilePath = [\"Mesos\",\"V1\",\"Executor\",\"Protos\",\"Call.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.executor_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"executor_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.subscribe\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"subscribe\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Subscribe\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Subscribe\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.update\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Update\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Update\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.message\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"message\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Message\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Message\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Call where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Call where
  textPut msg
   = do
       P'.tellT "executor_id" (_executor_id msg)
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "subscribe" (_subscribe msg)
       P'.tellT "update" (_update msg)
       P'.tellT "message" (_message msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'_executor_id, parse'_framework_id, parse'_type', parse'_subscribe, parse'_update, parse'_message])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_executor_id
         = P'.try
            (do
               v <- P'.getT "executor_id"
               Prelude'.return (\ o -> o{_executor_id = v}))
        parse'_framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{_framework_id = v}))
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_subscribe
         = P'.try
            (do
               v <- P'.getT "subscribe"
               Prelude'.return (\ o -> o{_subscribe = v}))
        parse'_update
         = P'.try
            (do
               v <- P'.getT "update"
               Prelude'.return (\ o -> o{_update = v}))
        parse'_message
         = P'.try
            (do
               v <- P'.getT "message"
               Prelude'.return (\ o -> o{_message = v}))