{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Event (Event(..), type', subscribed, acknowledged, launch, launch_group, kill, message, error) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Executor.Protos.Event.Acknowledged as Protos.Event (Acknowledged)
import qualified Mesos.V1.Executor.Protos.Event.Error as Protos.Event (Error)
import qualified Mesos.V1.Executor.Protos.Event.Kill as Protos.Event (Kill)
import qualified Mesos.V1.Executor.Protos.Event.Launch as Protos.Event (Launch)
import qualified Mesos.V1.Executor.Protos.Event.LaunchGroup as Protos.Event (LaunchGroup)
import qualified Mesos.V1.Executor.Protos.Event.Message as Protos.Event (Message)
import qualified Mesos.V1.Executor.Protos.Event.Subscribed as Protos.Event (Subscribed)
import qualified Mesos.V1.Executor.Protos.Event.Type as Protos.Event (Type)

data Event = Event{_type' :: !(P'.Maybe Protos.Event.Type), _subscribed :: !(P'.Maybe Protos.Event.Subscribed),
                   _acknowledged :: !(P'.Maybe Protos.Event.Acknowledged), _launch :: !(P'.Maybe Protos.Event.Launch),
                   _launch_group :: !(P'.Maybe Protos.Event.LaunchGroup), _kill :: !(P'.Maybe Protos.Event.Kill),
                   _message :: !(P'.Maybe Protos.Event.Message), _error :: !(P'.Maybe Protos.Event.Error)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Event

instance P'.ToJSON Event where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("subscribed", P'.toJSON (Prelude'.fmap P'.toJSON (subscribed msg))),
        ("acknowledged", P'.toJSON (Prelude'.fmap P'.toJSON (acknowledged msg))),
        ("launch", P'.toJSON (Prelude'.fmap P'.toJSON (launch msg))),
        ("launch_group", P'.toJSON (Prelude'.fmap P'.toJSON (launch_group msg))),
        ("kill", P'.toJSON (Prelude'.fmap P'.toJSON (kill msg))), ("message", P'.toJSON (Prelude'.fmap P'.toJSON (message msg))),
        ("error", P'.toJSON (Prelude'.fmap P'.toJSON (error msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Event where
  parseJSON
   = P'.withObject "Event"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          subscribed <- P'.explicitParseFieldMaybe P'.parseJSON o "subscribed"
          acknowledged <- P'.explicitParseFieldMaybe P'.parseJSON o "acknowledged"
          launch <- P'.explicitParseFieldMaybe P'.parseJSON o "launch"
          launch_group <- P'.explicitParseFieldMaybe P'.parseJSON o "launch_group"
          kill <- P'.explicitParseFieldMaybe P'.parseJSON o "kill"
          message <- P'.explicitParseFieldMaybe P'.parseJSON o "message"
          error <- P'.explicitParseFieldMaybe P'.parseJSON o "error"
          Prelude'.return
           P'.defaultValue{_type' = type', _subscribed = subscribed, _acknowledged = acknowledged, _launch = launch,
                           _launch_group = launch_group, _kill = kill, _message = message, _error = error})

instance P'.Mergeable Event where
  mergeAppend (Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (Event y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = Event (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)

instance P'.Default Event where
  defaultValue
   = Event P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue

instance P'.Wire Event where
  wireSize ft' self'@(Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
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
             + P'.wireSizeOpt 1 11 x'8)
  wirePutWithSize ft' self'@(Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'6, P'.wirePutOptWithSize 50 11 x'7,
             P'.wirePutOptWithSize 58 11 x'8, P'.wirePutOptWithSize 66 11 x'5]
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
                    (\ !new'Field -> old'Self{_acknowledged = P'.mergeAppend (_acknowledged old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_launch = P'.mergeAppend (_launch old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_launch_group = P'.mergeAppend (_launch_group old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_kill = P'.mergeAppend (_kill old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_message = P'.mergeAppend (_message old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_error = P'.mergeAppend (_error old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Event) Event where
  getVal m' f' = f' m'

instance P'.GPB Event

instance P'.ReflectDescriptor Event where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58, 66])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.executor.Event\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\"], baseName = MName \"Event\"}, descFilePath = [\"Mesos\",\"V1\",\"Executor\",\"Protos\",\"Event.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.subscribed\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"subscribed\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Subscribed\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Subscribed\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.acknowledged\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"acknowledged\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Acknowledged\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Acknowledged\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.launch\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"launch\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Launch\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Launch\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.launch_group\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"launch_group\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.LaunchGroup\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"LaunchGroup\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.kill\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"kill\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Kill\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Kill\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.message\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"message\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Message\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Message\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Event.error\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"error\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Event.Error\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Error\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Event where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Event where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "subscribed" (_subscribed msg)
       P'.tellT "acknowledged" (_acknowledged msg)
       P'.tellT "launch" (_launch msg)
       P'.tellT "launch_group" (_launch_group msg)
       P'.tellT "kill" (_kill msg)
       P'.tellT "message" (_message msg)
       P'.tellT "error" (_error msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_subscribed, parse'_acknowledged, parse'_launch, parse'_launch_group, parse'_kill,
                   parse'_message, parse'_error])
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
        parse'_acknowledged
         = P'.try
            (do
               v <- P'.getT "acknowledged"
               Prelude'.return (\ o -> o{_acknowledged = v}))
        parse'_launch
         = P'.try
            (do
               v <- P'.getT "launch"
               Prelude'.return (\ o -> o{_launch = v}))
        parse'_launch_group
         = P'.try
            (do
               v <- P'.getT "launch_group"
               Prelude'.return (\ o -> o{_launch_group = v}))
        parse'_kill
         = P'.try
            (do
               v <- P'.getT "kill"
               Prelude'.return (\ o -> o{_kill = v}))
        parse'_message
         = P'.try
            (do
               v <- P'.getT "message"
               Prelude'.return (\ o -> o{_message = v}))
        parse'_error
         = P'.try
            (do
               v <- P'.getT "error"
               Prelude'.return (\ o -> o{_error = v}))