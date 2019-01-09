{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Volume (Volume(..), mode, container_path, host_path, image, source) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Image as Protos (Image)
import qualified Mesos.V1.Protos.Volume.Mode as Protos.Volume (Mode)
import qualified Mesos.V1.Protos.Volume.Source as Protos.Volume (Source)

data Volume = Volume{_mode :: !(Protos.Volume.Mode), _container_path :: !(P'.Utf8), _host_path :: !(P'.Maybe P'.Utf8),
                     _image :: !(P'.Maybe Protos.Image), _source :: !(P'.Maybe Protos.Volume.Source)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Volume

instance P'.ToJSON Volume where
  toJSON msg
   = P'.objectNoEmpty
      ([("mode", P'.toJSON (mode msg)), ("container_path", P'.toJSON (container_path msg)),
        ("host_path", P'.toJSON (Prelude'.fmap P'.toJSON (host_path msg))),
        ("image", P'.toJSON (Prelude'.fmap P'.toJSON (image msg))), ("source", P'.toJSON (Prelude'.fmap P'.toJSON (source msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Volume where
  parseJSON
   = P'.withObject "Volume"
      (\ o ->
        do
          mode <- P'.explicitParseField P'.parseJSON o "mode"
          container_path <- P'.explicitParseField P'.parseJSON o "container_path"
          host_path <- P'.explicitParseFieldMaybe P'.parseJSON o "host_path"
          image <- P'.explicitParseFieldMaybe P'.parseJSON o "image"
          source <- P'.explicitParseFieldMaybe P'.parseJSON o "source"
          Prelude'.return
           P'.defaultValue{_mode = mode, _container_path = container_path, _host_path = host_path, _image = image,
                           _source = source})

instance P'.Mergeable Volume where
  mergeAppend (Volume x'1 x'2 x'3 x'4 x'5) (Volume y'1 y'2 y'3 y'4 y'5)
   = Volume (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default Volume where
  defaultValue = Volume P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Volume where
  wireSize ft' self'@(Volume x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5)
  wirePutWithSize ft' self'@(Volume x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'2, P'.wirePutOptWithSize 18 9 x'3, P'.wirePutReqWithSize 24 14 x'1,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5]
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
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_mode = new'Field}) (P'.wireGet 14)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_container_path = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_host_path = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_image = P'.mergeAppend (_image old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_source = P'.mergeAppend (_source old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Volume) Volume where
  getVal m' f' = f' m'

instance P'.GPB Volume

instance P'.ReflectDescriptor Volume where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 24]) (P'.fromDistinctAscList [10, 18, 24, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Volume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Volume\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Volume.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.mode\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume.Mode\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\"], baseName = MName \"Mode\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.container_path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"container_path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.host_path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"host_path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.image\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"image\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Image\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Image\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.source\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\"], baseName' = FName \"source\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume.Source\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\"], baseName = MName \"Source\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Volume where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Volume where
  textPut msg
   = do
       P'.tellT "mode" (_mode msg)
       P'.tellT "container_path" (_container_path msg)
       P'.tellT "host_path" (_host_path msg)
       P'.tellT "image" (_image msg)
       P'.tellT "source" (_source msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_mode, parse'_container_path, parse'_host_path, parse'_image, parse'_source]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_mode
         = P'.try
            (do
               v <- P'.getT "mode"
               Prelude'.return (\ o -> o{_mode = v}))
        parse'_container_path
         = P'.try
            (do
               v <- P'.getT "container_path"
               Prelude'.return (\ o -> o{_container_path = v}))
        parse'_host_path
         = P'.try
            (do
               v <- P'.getT "host_path"
               Prelude'.return (\ o -> o{_host_path = v}))
        parse'_image
         = P'.try
            (do
               v <- P'.getT "image"
               Prelude'.return (\ o -> o{_image = v}))
        parse'_source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{_source = v}))