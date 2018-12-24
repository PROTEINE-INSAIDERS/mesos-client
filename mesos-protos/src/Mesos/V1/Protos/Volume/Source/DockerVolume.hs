{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Volume.Source.DockerVolume (DockerVolume(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Parameters as Protos (Parameters)

data DockerVolume = DockerVolume{driver :: !(P'.Maybe P'.Utf8), name :: !(P'.Utf8), driver_options :: !(P'.Maybe Protos.Parameters)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON DockerVolume where
  toJSON msg
   = P'.objectNoEmpty
      ([("driver", P'.toJSON (Prelude'.fmap P'.toJSON (driver msg))), ("name", P'.toJSON (name msg)),
        ("driver_options", P'.toJSON (Prelude'.fmap P'.toJSON (driver_options msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON DockerVolume where
  parseJSON
   = P'.withObject "DockerVolume"
      (\ o ->
        do
          driver <- P'.explicitParseFieldMaybe P'.parseJSON o "driver"
          name <- P'.explicitParseField P'.parseJSON o "name"
          driver_options <- P'.explicitParseFieldMaybe P'.parseJSON o "driver_options"
          Prelude'.return P'.defaultValue{driver = driver, name = name, driver_options = driver_options})

instance P'.Mergeable DockerVolume where
  mergeAppend (DockerVolume x'1 x'2 x'3) (DockerVolume y'1 y'2 y'3)
   = DockerVolume (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default DockerVolume where
  defaultValue = DockerVolume P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire DockerVolume where
  wireSize ft' self'@(DockerVolume x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeOpt 1 11 x'3)
  wirePutWithSize ft' self'@(DockerVolume x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 9 x'1, P'.wirePutReqWithSize 18 9 x'2, P'.wirePutOptWithSize 26 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{driver = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{name = new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{driver_options = P'.mergeAppend (driver_options old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DockerVolume) DockerVolume where
  getVal m' f' = f' m'

instance P'.GPB DockerVolume

instance P'.ReflectDescriptor DockerVolume where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [18]) (P'.fromDistinctAscList [10, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Volume.Source.DockerVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName = MName \"DockerVolume\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Volume\",\"Source\",\"DockerVolume.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.DockerVolume.driver\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\",MName \"DockerVolume\"], baseName' = FName \"driver\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.DockerVolume.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\",MName \"DockerVolume\"], baseName' = FName \"name\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.DockerVolume.driver_options\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\",MName \"DockerVolume\"], baseName' = FName \"driver_options\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Parameters\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Parameters\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType DockerVolume where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DockerVolume where
  textPut msg
   = do
       P'.tellT "driver" (driver msg)
       P'.tellT "name" (name msg)
       P'.tellT "driver_options" (driver_options msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'driver, parse'name, parse'driver_options]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'driver
         = P'.try
            (do
               v <- P'.getT "driver"
               Prelude'.return (\ o -> o{driver = v}))
        parse'name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{name = v}))
        parse'driver_options
         = P'.try
            (do
               v <- P'.getT "driver_options"
               Prelude'.return (\ o -> o{driver_options = v}))