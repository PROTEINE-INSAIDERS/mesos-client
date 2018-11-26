{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerInfo (ContainerInfo(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.ContainerInfo.DockerInfo as Protos.ContainerInfo (DockerInfo)
import qualified Mesos.V1.Protos.ContainerInfo.MesosInfo as Protos.ContainerInfo (MesosInfo)
import qualified Mesos.V1.Protos.ContainerInfo.Type as Protos.ContainerInfo (Type)
import qualified Mesos.V1.Protos.LinuxInfo as Protos (LinuxInfo)
import qualified Mesos.V1.Protos.NetworkInfo as Protos (NetworkInfo)
import qualified Mesos.V1.Protos.RLimitInfo as Protos (RLimitInfo)
import qualified Mesos.V1.Protos.TTYInfo as Protos (TTYInfo)
import qualified Mesos.V1.Protos.Volume as Protos (Volume)

data ContainerInfo = ContainerInfo{type' :: !(Protos.ContainerInfo.Type), volumes :: !(P'.Seq Protos.Volume),
                                   hostname :: !(P'.Maybe P'.Utf8), docker :: !(P'.Maybe Protos.ContainerInfo.DockerInfo),
                                   mesos :: !(P'.Maybe Protos.ContainerInfo.MesosInfo),
                                   network_infos :: !(P'.Seq Protos.NetworkInfo), linux_info :: !(P'.Maybe Protos.LinuxInfo),
                                   rlimit_info :: !(P'.Maybe Protos.RLimitInfo), tty_info :: !(P'.Maybe Protos.TTYInfo)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable ContainerInfo where
  mergeAppend (ContainerInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (ContainerInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = ContainerInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)

instance P'.Default ContainerInfo where
  defaultValue
   = ContainerInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire ContainerInfo where
  wireSize ft' self'@(ContainerInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeRep 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9)
  wirePutWithSize ft' self'@(ContainerInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 8 14 x'1, P'.wirePutRepWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'4,
             P'.wirePutOptWithSize 34 9 x'3, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutRepWithSize 58 11 x'6,
             P'.wirePutOptWithSize 66 11 x'7, P'.wirePutOptWithSize 74 11 x'8, P'.wirePutOptWithSize 82 11 x'9]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{volumes = P'.append (volumes old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{hostname = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{docker = P'.mergeAppend (docker old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{mesos = P'.mergeAppend (mesos old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{network_infos = P'.append (network_infos old'Self) new'Field})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{linux_info = P'.mergeAppend (linux_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{rlimit_info = P'.mergeAppend (rlimit_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{tty_info = P'.mergeAppend (tty_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ContainerInfo) ContainerInfo where
  getVal m' f' = f' m'

instance P'.GPB ContainerInfo

instance P'.ReflectDescriptor ContainerInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 58, 66, 74, 82])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ContainerInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.volumes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"volumes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Volume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.hostname\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"hostname\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.docker\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"docker\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.DockerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"DockerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.mesos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"mesos\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.MesosInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"MesosInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.network_infos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"network_infos\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"NetworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.linux_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"linux_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.LinuxInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"LinuxInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.rlimit_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"rlimit_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.RLimitInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"RLimitInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.tty_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"tty_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TTYInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TTYInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType ContainerInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ContainerInfo where
  textPut msg
   = do
       P'.tellT "type" (type' msg)
       P'.tellT "volumes" (volumes msg)
       P'.tellT "hostname" (hostname msg)
       P'.tellT "docker" (docker msg)
       P'.tellT "mesos" (mesos msg)
       P'.tellT "network_infos" (network_infos msg)
       P'.tellT "linux_info" (linux_info msg)
       P'.tellT "rlimit_info" (rlimit_info msg)
       P'.tellT "tty_info" (tty_info msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'type', parse'volumes, parse'hostname, parse'docker, parse'mesos, parse'network_infos, parse'linux_info,
                   parse'rlimit_info, parse'tty_info])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'volumes
         = P'.try
            (do
               v <- P'.getT "volumes"
               Prelude'.return (\ o -> o{volumes = P'.append (volumes o) v}))
        parse'hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{hostname = v}))
        parse'docker
         = P'.try
            (do
               v <- P'.getT "docker"
               Prelude'.return (\ o -> o{docker = v}))
        parse'mesos
         = P'.try
            (do
               v <- P'.getT "mesos"
               Prelude'.return (\ o -> o{mesos = v}))
        parse'network_infos
         = P'.try
            (do
               v <- P'.getT "network_infos"
               Prelude'.return (\ o -> o{network_infos = P'.append (network_infos o) v}))
        parse'linux_info
         = P'.try
            (do
               v <- P'.getT "linux_info"
               Prelude'.return (\ o -> o{linux_info = v}))
        parse'rlimit_info
         = P'.try
            (do
               v <- P'.getT "rlimit_info"
               Prelude'.return (\ o -> o{rlimit_info = v}))
        parse'tty_info
         = P'.try
            (do
               v <- P'.getT "tty_info"
               Prelude'.return (\ o -> o{tty_info = v}))