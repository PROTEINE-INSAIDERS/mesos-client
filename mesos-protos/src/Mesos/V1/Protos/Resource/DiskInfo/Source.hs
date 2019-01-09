{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Resource.DiskInfo.Source (Source(..), type', path, mount, vendor, id, metadata, profile) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.Resource.DiskInfo.Source.Mount as Protos.Resource.DiskInfo.Source (Mount)
import qualified Mesos.V1.Protos.Resource.DiskInfo.Source.Path as Protos.Resource.DiskInfo.Source (Path)
import qualified Mesos.V1.Protos.Resource.DiskInfo.Source.Type as Protos.Resource.DiskInfo.Source (Type)

data Source = Source{_type' :: !(Protos.Resource.DiskInfo.Source.Type), _path :: !(P'.Maybe Protos.Resource.DiskInfo.Source.Path),
                     _mount :: !(P'.Maybe Protos.Resource.DiskInfo.Source.Mount), _vendor :: !(P'.Maybe P'.Utf8),
                     _id :: !(P'.Maybe P'.Utf8), _metadata :: !(P'.Maybe Protos.Labels), _profile :: !(P'.Maybe P'.Utf8)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Source

instance P'.ToJSON Source where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (type' msg)), ("path", P'.toJSON (Prelude'.fmap P'.toJSON (path msg))),
        ("mount", P'.toJSON (Prelude'.fmap P'.toJSON (mount msg))), ("vendor", P'.toJSON (Prelude'.fmap P'.toJSON (vendor msg))),
        ("id", P'.toJSON (Prelude'.fmap P'.toJSON (id msg))), ("metadata", P'.toJSON (Prelude'.fmap P'.toJSON (metadata msg))),
        ("profile", P'.toJSON (Prelude'.fmap P'.toJSON (profile msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Source where
  parseJSON
   = P'.withObject "Source"
      (\ o ->
        do
          type' <- P'.explicitParseField P'.parseJSON o "type"
          path <- P'.explicitParseFieldMaybe P'.parseJSON o "path"
          mount <- P'.explicitParseFieldMaybe P'.parseJSON o "mount"
          vendor <- P'.explicitParseFieldMaybe P'.parseJSON o "vendor"
          id <- P'.explicitParseFieldMaybe P'.parseJSON o "id"
          metadata <- P'.explicitParseFieldMaybe P'.parseJSON o "metadata"
          profile <- P'.explicitParseFieldMaybe P'.parseJSON o "profile"
          Prelude'.return
           P'.defaultValue{_type' = type', _path = path, _mount = mount, _vendor = vendor, _id = id, _metadata = metadata,
                           _profile = profile})

instance P'.Mergeable Source where
  mergeAppend (Source x'1 x'2 x'3 x'4 x'5 x'6 x'7) (Source y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = Source (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default Source where
  defaultValue
   = Source P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Source where
  wireSize ft' self'@(Source x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 9 x'7)
  wirePutWithSize ft' self'@(Source x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 9 x'5, P'.wirePutOptWithSize 42 11 x'6, P'.wirePutOptWithSize 50 9 x'7,
             P'.wirePutOptWithSize 58 9 x'4]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_path = P'.mergeAppend (_path old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_mount = P'.mergeAppend (_mount old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_vendor = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_metadata = P'.mergeAppend (_metadata old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_profile = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Source) Source where
  getVal m' f' = f' m'

instance P'.GPB Source

instance P'.ReflectDescriptor Source where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Source\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\"], baseName = MName \"Source\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Resource\",\"DiskInfo\",\"Source.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Source.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Source.Path\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName = MName \"Path\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.mount\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"mount\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Source.Mount\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName = MName \"Mount\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.vendor\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"vendor\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.metadata\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"metadata\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Source.profile\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Source\"], baseName' = FName \"profile\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Source where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Source where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "path" (_path msg)
       P'.tellT "mount" (_mount msg)
       P'.tellT "vendor" (_vendor msg)
       P'.tellT "id" (_id msg)
       P'.tellT "metadata" (_metadata msg)
       P'.tellT "profile" (_profile msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'_type', parse'_path, parse'_mount, parse'_vendor, parse'_id, parse'_metadata, parse'_profile])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_path
         = P'.try
            (do
               v <- P'.getT "path"
               Prelude'.return (\ o -> o{_path = v}))
        parse'_mount
         = P'.try
            (do
               v <- P'.getT "mount"
               Prelude'.return (\ o -> o{_mount = v}))
        parse'_vendor
         = P'.try
            (do
               v <- P'.getT "vendor"
               Prelude'.return (\ o -> o{_vendor = v}))
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_metadata
         = P'.try
            (do
               v <- P'.getT "metadata"
               Prelude'.return (\ o -> o{_metadata = v}))
        parse'_profile
         = P'.try
            (do
               v <- P'.getT "profile"
               Prelude'.return (\ o -> o{_profile = v}))