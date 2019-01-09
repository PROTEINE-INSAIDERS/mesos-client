{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.NetworkInfo (NetworkInfo(..), ip_addresses, name, groups, labels, port_mappings) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.NetworkInfo.IPAddress as Protos.NetworkInfo (IPAddress)
import qualified Mesos.V1.Protos.NetworkInfo.PortMapping as Protos.NetworkInfo (PortMapping)

data NetworkInfo = NetworkInfo{_ip_addresses :: !(P'.Seq Protos.NetworkInfo.IPAddress), _name :: !(P'.Maybe P'.Utf8),
                               _groups :: !(P'.Seq P'.Utf8), _labels :: !(P'.Maybe Protos.Labels),
                               _port_mappings :: !(P'.Seq Protos.NetworkInfo.PortMapping)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''NetworkInfo

instance P'.ToJSON NetworkInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("ip_addresses", P'.toJSON (Prelude'.fmap P'.toJSON (ip_addresses msg))),
        ("name", P'.toJSON (Prelude'.fmap P'.toJSON (name msg))), ("groups", P'.toJSON (Prelude'.fmap P'.toJSON (groups msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg))),
        ("port_mappings", P'.toJSON (Prelude'.fmap P'.toJSON (port_mappings msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON NetworkInfo where
  parseJSON
   = P'.withObject "NetworkInfo"
      (\ o ->
        do
          ip_addresses <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "ip_addresses")
          name <- P'.explicitParseFieldMaybe P'.parseJSON o "name"
          groups <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                     (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "groups")
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          port_mappings <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "port_mappings")
          Prelude'.return
           P'.defaultValue{_ip_addresses = ip_addresses, _name = name, _groups = groups, _labels = labels,
                           _port_mappings = port_mappings})

instance P'.Mergeable NetworkInfo where
  mergeAppend (NetworkInfo x'1 x'2 x'3 x'4 x'5) (NetworkInfo y'1 y'2 y'3 y'4 y'5)
   = NetworkInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default NetworkInfo where
  defaultValue = NetworkInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire NetworkInfo where
  wireSize ft' self'@(NetworkInfo x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeRep 1 9 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeRep 1 11 x'5)
  wirePutWithSize ft' self'@(NetworkInfo x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutRepWithSize 26 9 x'3, P'.wirePutOptWithSize 34 11 x'4, P'.wirePutRepWithSize 42 11 x'1,
             P'.wirePutOptWithSize 50 9 x'2, P'.wirePutRepWithSize 58 11 x'5]
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
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_ip_addresses = P'.append (_ip_addresses old'Self) new'Field})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_groups = P'.append (_groups old'Self) new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_port_mappings = P'.append (_port_mappings old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> NetworkInfo) NetworkInfo where
  getVal m' f' = f' m'

instance P'.GPB NetworkInfo

instance P'.ReflectDescriptor NetworkInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [26, 34, 42, 50, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"NetworkInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"NetworkInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.ip_addresses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\"], baseName' = FName \"ip_addresses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo.IPAddress\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"NetworkInfo\"], baseName = MName \"IPAddress\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.groups\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\"], baseName' = FName \"groups\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.port_mappings\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\"], baseName' = FName \"port_mappings\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo.PortMapping\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"NetworkInfo\"], baseName = MName \"PortMapping\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType NetworkInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg NetworkInfo where
  textPut msg
   = do
       P'.tellT "ip_addresses" (_ip_addresses msg)
       P'.tellT "name" (_name msg)
       P'.tellT "groups" (_groups msg)
       P'.tellT "labels" (_labels msg)
       P'.tellT "port_mappings" (_port_mappings msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_ip_addresses, parse'_name, parse'_groups, parse'_labels, parse'_port_mappings])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_ip_addresses
         = P'.try
            (do
               v <- P'.getT "ip_addresses"
               Prelude'.return (\ o -> o{_ip_addresses = P'.append (_ip_addresses o) v}))
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_groups
         = P'.try
            (do
               v <- P'.getT "groups"
               Prelude'.return (\ o -> o{_groups = P'.append (_groups o) v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))
        parse'_port_mappings
         = P'.try
            (do
               v <- P'.getT "port_mappings"
               Prelude'.return (\ o -> o{_port_mappings = P'.append (_port_mappings o) v}))