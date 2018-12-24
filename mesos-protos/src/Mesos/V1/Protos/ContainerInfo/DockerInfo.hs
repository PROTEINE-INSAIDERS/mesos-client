{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerInfo.DockerInfo (DockerInfo(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.ContainerInfo.DockerInfo.Network as Protos.ContainerInfo.DockerInfo (Network)
import qualified Mesos.V1.Protos.ContainerInfo.DockerInfo.PortMapping as Protos.ContainerInfo.DockerInfo (PortMapping)
import qualified Mesos.V1.Protos.Parameter as Protos (Parameter)

data DockerInfo = DockerInfo{image :: !(P'.Utf8), network :: !(P'.Maybe Protos.ContainerInfo.DockerInfo.Network),
                             port_mappings :: !(P'.Seq Protos.ContainerInfo.DockerInfo.PortMapping),
                             privileged :: !(P'.Maybe P'.Bool), parameters :: !(P'.Seq Protos.Parameter),
                             force_pull_image :: !(P'.Maybe P'.Bool), volume_driver :: !(P'.Maybe P'.Utf8)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON DockerInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("image", P'.toJSON (image msg)), ("network", P'.toJSON (Prelude'.fmap P'.toJSON (network msg))),
        ("port_mappings", P'.toJSON (Prelude'.fmap P'.toJSON (port_mappings msg))),
        ("privileged", P'.toJSON (Prelude'.fmap P'.toJSON (privileged msg))),
        ("parameters", P'.toJSON (Prelude'.fmap P'.toJSON (parameters msg))),
        ("force_pull_image", P'.toJSON (Prelude'.fmap P'.toJSON (force_pull_image msg))),
        ("volume_driver", P'.toJSON (Prelude'.fmap P'.toJSON (volume_driver msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON DockerInfo where
  parseJSON
   = P'.withObject "DockerInfo"
      (\ o ->
        do
          image <- P'.explicitParseField P'.parseJSON o "image"
          network <- do
                       tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "network"
                       Prelude'.return (Prelude'.maybe (Prelude'.Just ((Prelude'.read "HOST"))) Prelude'.Just tmp)
          port_mappings <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "port_mappings")
          privileged <- do
                          tmp <- P'.explicitParseFieldMaybe P'.parseJSONBool o "privileged"
                          Prelude'.return (Prelude'.maybe (Prelude'.Just (Prelude'.False)) Prelude'.Just tmp)
          parameters <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "parameters")
          force_pull_image <- P'.explicitParseFieldMaybe P'.parseJSONBool o "force_pull_image"
          volume_driver <- P'.explicitParseFieldMaybe P'.parseJSON o "volume_driver"
          Prelude'.return
           P'.defaultValue{image = image, network = network, port_mappings = port_mappings, privileged = privileged,
                           parameters = parameters, force_pull_image = force_pull_image, volume_driver = volume_driver})

instance P'.Mergeable DockerInfo where
  mergeAppend (DockerInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7) (DockerInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = DockerInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default DockerInfo where
  defaultValue
   = DockerInfo P'.defaultValue (Prelude'.Just (Prelude'.read "HOST")) P'.defaultValue (Prelude'.Just Prelude'.False)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire DockerInfo where
  wireSize ft' self'@(DockerInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeRep 1 11 x'5
             + P'.wireSizeOpt 1 8 x'6
             + P'.wireSizeOpt 1 9 x'7)
  wirePutWithSize ft' self'@(DockerInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 16 14 x'2, P'.wirePutRepWithSize 26 11 x'3,
             P'.wirePutOptWithSize 32 8 x'4, P'.wirePutRepWithSize 42 11 x'5, P'.wirePutOptWithSize 48 8 x'6,
             P'.wirePutOptWithSize 58 9 x'7]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{image = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{network = Prelude'.Just new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{port_mappings = P'.append (port_mappings old'Self) new'Field})
                    (P'.wireGet 11)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{privileged = Prelude'.Just new'Field}) (P'.wireGet 8)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{parameters = P'.append (parameters old'Self) new'Field}) (P'.wireGet 11)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{force_pull_image = Prelude'.Just new'Field}) (P'.wireGet 8)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{volume_driver = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DockerInfo) DockerInfo where
  getVal m' f' = f' m'

instance P'.GPB DockerInfo

instance P'.ReflectDescriptor DockerInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 26, 32, 42, 48, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.DockerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"DockerInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ContainerInfo\",\"DockerInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.image\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"image\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.network\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"network\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.DockerInfo.Network\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName = MName \"Network\"}), hsRawDefault = Just \"HOST\", hsDefault = Just (HsDef'Enum \"HOST\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.port_mappings\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"port_mappings\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.DockerInfo.PortMapping\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName = MName \"PortMapping\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.privileged\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"privileged\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.parameters\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"parameters\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Parameter\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Parameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.force_pull_image\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"force_pull_image\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.volume_driver\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName' = FName \"volume_driver\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType DockerInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DockerInfo where
  textPut msg
   = do
       P'.tellT "image" (image msg)
       P'.tellT "network" (network msg)
       P'.tellT "port_mappings" (port_mappings msg)
       P'.tellT "privileged" (privileged msg)
       P'.tellT "parameters" (parameters msg)
       P'.tellT "force_pull_image" (force_pull_image msg)
       P'.tellT "volume_driver" (volume_driver msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'image, parse'network, parse'port_mappings, parse'privileged, parse'parameters, parse'force_pull_image,
                   parse'volume_driver])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'image
         = P'.try
            (do
               v <- P'.getT "image"
               Prelude'.return (\ o -> o{image = v}))
        parse'network
         = P'.try
            (do
               v <- P'.getT "network"
               Prelude'.return (\ o -> o{network = v}))
        parse'port_mappings
         = P'.try
            (do
               v <- P'.getT "port_mappings"
               Prelude'.return (\ o -> o{port_mappings = P'.append (port_mappings o) v}))
        parse'privileged
         = P'.try
            (do
               v <- P'.getT "privileged"
               Prelude'.return (\ o -> o{privileged = v}))
        parse'parameters
         = P'.try
            (do
               v <- P'.getT "parameters"
               Prelude'.return (\ o -> o{parameters = P'.append (parameters o) v}))
        parse'force_pull_image
         = P'.try
            (do
               v <- P'.getT "force_pull_image"
               Prelude'.return (\ o -> o{force_pull_image = v}))
        parse'volume_driver
         = P'.try
            (do
               v <- P'.getT "volume_driver"
               Prelude'.return (\ o -> o{volume_driver = v}))