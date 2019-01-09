{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DiscoveryInfo (DiscoveryInfo(..), visibility, name, environment, location, version, ports, labels) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.DiscoveryInfo.Visibility as Protos.DiscoveryInfo (Visibility)
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.Ports as Protos (Ports)

data DiscoveryInfo = DiscoveryInfo{_visibility :: !(Protos.DiscoveryInfo.Visibility), _name :: !(P'.Maybe P'.Utf8),
                                   _environment :: !(P'.Maybe P'.Utf8), _location :: !(P'.Maybe P'.Utf8),
                                   _version :: !(P'.Maybe P'.Utf8), _ports :: !(P'.Maybe Protos.Ports),
                                   _labels :: !(P'.Maybe Protos.Labels)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''DiscoveryInfo

instance P'.ToJSON DiscoveryInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("visibility", P'.toJSON (visibility msg)), ("name", P'.toJSON (Prelude'.fmap P'.toJSON (name msg))),
        ("environment", P'.toJSON (Prelude'.fmap P'.toJSON (environment msg))),
        ("location", P'.toJSON (Prelude'.fmap P'.toJSON (location msg))),
        ("version", P'.toJSON (Prelude'.fmap P'.toJSON (version msg))), ("ports", P'.toJSON (Prelude'.fmap P'.toJSON (ports msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON DiscoveryInfo where
  parseJSON
   = P'.withObject "DiscoveryInfo"
      (\ o ->
        do
          visibility <- P'.explicitParseField P'.parseJSON o "visibility"
          name <- P'.explicitParseFieldMaybe P'.parseJSON o "name"
          environment <- P'.explicitParseFieldMaybe P'.parseJSON o "environment"
          location <- P'.explicitParseFieldMaybe P'.parseJSON o "location"
          version <- P'.explicitParseFieldMaybe P'.parseJSON o "version"
          ports <- P'.explicitParseFieldMaybe P'.parseJSON o "ports"
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          Prelude'.return
           P'.defaultValue{_visibility = visibility, _name = name, _environment = environment, _location = location,
                           _version = version, _ports = ports, _labels = labels})

instance P'.Mergeable DiscoveryInfo where
  mergeAppend (DiscoveryInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7) (DiscoveryInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = DiscoveryInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default DiscoveryInfo where
  defaultValue
   = DiscoveryInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire DiscoveryInfo where
  wireSize ft' self'@(DiscoveryInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7)
  wirePutWithSize ft' self'@(DiscoveryInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 8 14 x'1, P'.wirePutOptWithSize 18 9 x'2, P'.wirePutOptWithSize 26 9 x'3,
             P'.wirePutOptWithSize 34 9 x'4, P'.wirePutOptWithSize 42 9 x'5, P'.wirePutOptWithSize 50 11 x'6,
             P'.wirePutOptWithSize 58 11 x'7]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_visibility = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_environment = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_location = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_version = Prelude'.Just new'Field}) (P'.wireGet 9)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_ports = P'.mergeAppend (_ports old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DiscoveryInfo) DiscoveryInfo where
  getVal m' f' = f' m'

instance P'.GPB DiscoveryInfo

instance P'.ReflectDescriptor DiscoveryInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DiscoveryInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DiscoveryInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DiscoveryInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.visibility\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"visibility\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DiscoveryInfo.Visibility\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName = MName \"Visibility\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.environment\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"environment\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.location\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"location\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.version\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"version\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.ports\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"ports\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Ports\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Ports\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiscoveryInfo.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiscoveryInfo\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType DiscoveryInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DiscoveryInfo where
  textPut msg
   = do
       P'.tellT "visibility" (_visibility msg)
       P'.tellT "name" (_name msg)
       P'.tellT "environment" (_environment msg)
       P'.tellT "location" (_location msg)
       P'.tellT "version" (_version msg)
       P'.tellT "ports" (_ports msg)
       P'.tellT "labels" (_labels msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_visibility, parse'_name, parse'_environment, parse'_location, parse'_version, parse'_ports,
                   parse'_labels])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_visibility
         = P'.try
            (do
               v <- P'.getT "visibility"
               Prelude'.return (\ o -> o{_visibility = v}))
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_environment
         = P'.try
            (do
               v <- P'.getT "environment"
               Prelude'.return (\ o -> o{_environment = v}))
        parse'_location
         = P'.try
            (do
               v <- P'.getT "location"
               Prelude'.return (\ o -> o{_location = v}))
        parse'_version
         = P'.try
            (do
               v <- P'.getT "version"
               Prelude'.return (\ o -> o{_version = v}))
        parse'_ports
         = P'.try
            (do
               v <- P'.getT "ports"
               Prelude'.return (\ o -> o{_ports = v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))