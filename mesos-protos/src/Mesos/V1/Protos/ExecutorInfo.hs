{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ExecutorInfo
       (ExecutorInfo(..), type', executor_id, framework_id, command, container, resources, name, source, data', discovery,
        shutdown_grace_period, labels)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CommandInfo as Protos (CommandInfo)
import qualified Mesos.V1.Protos.ContainerInfo as Protos (ContainerInfo)
import qualified Mesos.V1.Protos.DiscoveryInfo as Protos (DiscoveryInfo)
import qualified Mesos.V1.Protos.DurationInfo as Protos (DurationInfo)
import qualified Mesos.V1.Protos.ExecutorID as Protos (ExecutorID)
import qualified Mesos.V1.Protos.ExecutorInfo.Type as Protos.ExecutorInfo (Type)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data ExecutorInfo = ExecutorInfo{_type' :: !(P'.Maybe Protos.ExecutorInfo.Type), _executor_id :: !(Protos.ExecutorID),
                                 _framework_id :: !(P'.Maybe Protos.FrameworkID), _command :: !(P'.Maybe Protos.CommandInfo),
                                 _container :: !(P'.Maybe Protos.ContainerInfo), _resources :: !(P'.Seq Protos.Resource),
                                 _name :: !(P'.Maybe P'.Utf8), _source :: !(P'.Maybe P'.Utf8), _data' :: !(P'.Maybe P'.ByteString),
                                 _discovery :: !(P'.Maybe Protos.DiscoveryInfo),
                                 _shutdown_grace_period :: !(P'.Maybe Protos.DurationInfo), _labels :: !(P'.Maybe Protos.Labels)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ExecutorInfo

instance P'.ToJSON ExecutorInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))), ("executor_id", P'.toJSON (executor_id msg)),
        ("framework_id", P'.toJSON (Prelude'.fmap P'.toJSON (framework_id msg))),
        ("command", P'.toJSON (Prelude'.fmap P'.toJSON (command msg))),
        ("container", P'.toJSON (Prelude'.fmap P'.toJSON (container msg))),
        ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg))),
        ("name", P'.toJSON (Prelude'.fmap P'.toJSON (name msg))), ("source", P'.toJSON (Prelude'.fmap P'.toJSON (source msg))),
        ("data", P'.toJSON (Prelude'.fmap P'.toJSONByteString (data' msg))),
        ("discovery", P'.toJSON (Prelude'.fmap P'.toJSON (discovery msg))),
        ("shutdown_grace_period", P'.toJSON (Prelude'.fmap P'.toJSON (shutdown_grace_period msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ExecutorInfo where
  parseJSON
   = P'.withObject "ExecutorInfo"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          executor_id <- P'.explicitParseField P'.parseJSON o "executor_id"
          framework_id <- P'.explicitParseFieldMaybe P'.parseJSON o "framework_id"
          command <- P'.explicitParseFieldMaybe P'.parseJSON o "command"
          container <- P'.explicitParseFieldMaybe P'.parseJSON o "container"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          name <- P'.explicitParseFieldMaybe P'.parseJSON o "name"
          source <- P'.explicitParseFieldMaybe P'.parseJSON o "source"
          data' <- P'.explicitParseFieldMaybe P'.parseJSONByteString o "data"
          discovery <- P'.explicitParseFieldMaybe P'.parseJSON o "discovery"
          shutdown_grace_period <- P'.explicitParseFieldMaybe P'.parseJSON o "shutdown_grace_period"
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          Prelude'.return
           P'.defaultValue{_type' = type', _executor_id = executor_id, _framework_id = framework_id, _command = command,
                           _container = container, _resources = resources, _name = name, _source = source, _data' = data',
                           _discovery = discovery, _shutdown_grace_period = shutdown_grace_period, _labels = labels})

instance P'.Mergeable ExecutorInfo where
  mergeAppend (ExecutorInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   (ExecutorInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12)
   = ExecutorInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)

instance P'.Default ExecutorInfo where
  defaultValue
   = ExecutorInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire ExecutorInfo where
  wireSize ft' self'@(ExecutorInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeRep 1 11 x'6
             + P'.wireSizeOpt 1 9 x'7
             + P'.wireSizeOpt 1 9 x'8
             + P'.wireSizeOpt 1 12 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11
             + P'.wireSizeOpt 1 11 x'12)
  wirePutWithSize ft' self'@(ExecutorInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'2, P'.wirePutOptWithSize 34 12 x'9, P'.wirePutRepWithSize 42 11 x'6,
             P'.wirePutOptWithSize 58 11 x'4, P'.wirePutOptWithSize 66 11 x'3, P'.wirePutOptWithSize 74 9 x'7,
             P'.wirePutOptWithSize 82 9 x'8, P'.wirePutOptWithSize 90 11 x'5, P'.wirePutOptWithSize 98 11 x'10,
             P'.wirePutOptWithSize 106 11 x'11, P'.wirePutOptWithSize 114 11 x'12, P'.wirePutOptWithSize 120 14 x'1]
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
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_executor_id = P'.mergeAppend (_executor_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_command = P'.mergeAppend (_command old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_container = P'.mergeAppend (_container old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = Prelude'.Just new'Field}) (P'.wireGet 9)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_data' = Prelude'.Just new'Field}) (P'.wireGet 12)
             98 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_discovery = P'.mergeAppend (_discovery old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_shutdown_grace_period =
                                 P'.mergeAppend (_shutdown_grace_period old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ExecutorInfo) ExecutorInfo where
  getVal m' f' = f' m'

instance P'.GPB ExecutorInfo

instance P'.ReflectDescriptor ExecutorInfo where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 34, 42, 58, 66, 74, 82, 90, 98, 106, 114, 120])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ExecutorInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ExecutorInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorInfo.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ExecutorInfo\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.executor_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"executor_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.command\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"command\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CommandInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CommandInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.container\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"container\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.source\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.data\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"data'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.discovery\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"discovery\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DiscoveryInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DiscoveryInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.shutdown_grace_period\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"shutdown_grace_period\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DurationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DurationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ExecutorInfo.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ExecutorInfo\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType ExecutorInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ExecutorInfo where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "executor_id" (_executor_id msg)
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "command" (_command msg)
       P'.tellT "container" (_container msg)
       P'.tellT "resources" (_resources msg)
       P'.tellT "name" (_name msg)
       P'.tellT "source" (_source msg)
       P'.tellT "data" (_data' msg)
       P'.tellT "discovery" (_discovery msg)
       P'.tellT "shutdown_grace_period" (_shutdown_grace_period msg)
       P'.tellT "labels" (_labels msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_executor_id, parse'_framework_id, parse'_command, parse'_container, parse'_resources,
                   parse'_name, parse'_source, parse'_data', parse'_discovery, parse'_shutdown_grace_period, parse'_labels])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
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
        parse'_command
         = P'.try
            (do
               v <- P'.getT "command"
               Prelude'.return (\ o -> o{_command = v}))
        parse'_container
         = P'.try
            (do
               v <- P'.getT "container"
               Prelude'.return (\ o -> o{_container = v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))
        parse'_data'
         = P'.try
            (do
               v <- P'.getT "data"
               Prelude'.return (\ o -> o{_data' = v}))
        parse'_discovery
         = P'.try
            (do
               v <- P'.getT "discovery"
               Prelude'.return (\ o -> o{_discovery = v}))
        parse'_shutdown_grace_period
         = P'.try
            (do
               v <- P'.getT "shutdown_grace_period"
               Prelude'.return (\ o -> o{_shutdown_grace_period = v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))