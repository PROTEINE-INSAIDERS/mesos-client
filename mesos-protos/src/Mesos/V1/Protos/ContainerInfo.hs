{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerInfo
       (ContainerInfo(..), type', volumes, hostname, docker, mesos, network_infos, linux_info, rlimit_info, tty_info) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.ContainerInfo.DockerInfo as Protos.ContainerInfo (DockerInfo)
import qualified Mesos.V1.Protos.ContainerInfo.MesosInfo as Protos.ContainerInfo (MesosInfo)
import qualified Mesos.V1.Protos.ContainerInfo.Type as Protos.ContainerInfo (Type)
import qualified Mesos.V1.Protos.LinuxInfo as Protos (LinuxInfo)
import qualified Mesos.V1.Protos.NetworkInfo as Protos (NetworkInfo)
import qualified Mesos.V1.Protos.RLimitInfo as Protos (RLimitInfo)
import qualified Mesos.V1.Protos.TTYInfo as Protos (TTYInfo)
import qualified Mesos.V1.Protos.Volume as Protos (Volume)

data ContainerInfo = ContainerInfo{_type' :: !(Protos.ContainerInfo.Type), _volumes :: !(P'.Seq Protos.Volume),
                                   _hostname :: !(P'.Maybe P'.Utf8), _docker :: !(P'.Maybe Protos.ContainerInfo.DockerInfo),
                                   _mesos :: !(P'.Maybe Protos.ContainerInfo.MesosInfo),
                                   _network_infos :: !(P'.Seq Protos.NetworkInfo), _linux_info :: !(P'.Maybe Protos.LinuxInfo),
                                   _rlimit_info :: !(P'.Maybe Protos.RLimitInfo), _tty_info :: !(P'.Maybe Protos.TTYInfo)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ContainerInfo

instance P'.ToJSON ContainerInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (type' msg)), ("volumes", P'.toJSON (Prelude'.fmap P'.toJSON (volumes msg))),
        ("hostname", P'.toJSON (Prelude'.fmap P'.toJSON (hostname msg))),
        ("docker", P'.toJSON (Prelude'.fmap P'.toJSON (docker msg))), ("mesos", P'.toJSON (Prelude'.fmap P'.toJSON (mesos msg))),
        ("network_infos", P'.toJSON (Prelude'.fmap P'.toJSON (network_infos msg))),
        ("linux_info", P'.toJSON (Prelude'.fmap P'.toJSON (linux_info msg))),
        ("rlimit_info", P'.toJSON (Prelude'.fmap P'.toJSON (rlimit_info msg))),
        ("tty_info", P'.toJSON (Prelude'.fmap P'.toJSON (tty_info msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ContainerInfo where
  parseJSON
   = P'.withObject "ContainerInfo"
      (\ o ->
        do
          type' <- P'.explicitParseField P'.parseJSON o "type"
          volumes <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                      (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "volumes")
          hostname <- P'.explicitParseFieldMaybe P'.parseJSON o "hostname"
          docker <- P'.explicitParseFieldMaybe P'.parseJSON o "docker"
          mesos <- P'.explicitParseFieldMaybe P'.parseJSON o "mesos"
          network_infos <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "network_infos")
          linux_info <- P'.explicitParseFieldMaybe P'.parseJSON o "linux_info"
          rlimit_info <- P'.explicitParseFieldMaybe P'.parseJSON o "rlimit_info"
          tty_info <- P'.explicitParseFieldMaybe P'.parseJSON o "tty_info"
          Prelude'.return
           P'.defaultValue{_type' = type', _volumes = volumes, _hostname = hostname, _docker = docker, _mesos = mesos,
                           _network_infos = network_infos, _linux_info = linux_info, _rlimit_info = rlimit_info,
                           _tty_info = tty_info})

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
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_volumes = P'.append (_volumes old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_hostname = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_docker = P'.mergeAppend (_docker old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_mesos = P'.mergeAppend (_mesos old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_network_infos = P'.append (_network_infos old'Self) new'Field})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_linux_info = P'.mergeAppend (_linux_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_rlimit_info = P'.mergeAppend (_rlimit_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_tty_info = P'.mergeAppend (_tty_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ContainerInfo) ContainerInfo where
  getVal m' f' = f' m'

instance P'.GPB ContainerInfo

instance P'.ReflectDescriptor ContainerInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 58, 66, 74, 82])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ContainerInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.volumes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"volumes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Volume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.hostname\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"hostname\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.docker\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"docker\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.DockerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"DockerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.mesos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"mesos\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.MesosInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\"], baseName = MName \"MesosInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.network_infos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"network_infos\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"NetworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.linux_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"linux_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.LinuxInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"LinuxInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.rlimit_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"rlimit_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.RLimitInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"RLimitInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.tty_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\"], baseName' = FName \"tty_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TTYInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TTYInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType ContainerInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ContainerInfo where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "volumes" (_volumes msg)
       P'.tellT "hostname" (_hostname msg)
       P'.tellT "docker" (_docker msg)
       P'.tellT "mesos" (_mesos msg)
       P'.tellT "network_infos" (_network_infos msg)
       P'.tellT "linux_info" (_linux_info msg)
       P'.tellT "rlimit_info" (_rlimit_info msg)
       P'.tellT "tty_info" (_tty_info msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_volumes, parse'_hostname, parse'_docker, parse'_mesos, parse'_network_infos,
                   parse'_linux_info, parse'_rlimit_info, parse'_tty_info])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_volumes
         = P'.try
            (do
               v <- P'.getT "volumes"
               Prelude'.return (\ o -> o{_volumes = P'.append (_volumes o) v}))
        parse'_hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{_hostname = v}))
        parse'_docker
         = P'.try
            (do
               v <- P'.getT "docker"
               Prelude'.return (\ o -> o{_docker = v}))
        parse'_mesos
         = P'.try
            (do
               v <- P'.getT "mesos"
               Prelude'.return (\ o -> o{_mesos = v}))
        parse'_network_infos
         = P'.try
            (do
               v <- P'.getT "network_infos"
               Prelude'.return (\ o -> o{_network_infos = P'.append (_network_infos o) v}))
        parse'_linux_info
         = P'.try
            (do
               v <- P'.getT "linux_info"
               Prelude'.return (\ o -> o{_linux_info = v}))
        parse'_rlimit_info
         = P'.try
            (do
               v <- P'.getT "rlimit_info"
               Prelude'.return (\ o -> o{_rlimit_info = v}))
        parse'_tty_info
         = P'.try
            (do
               v <- P'.getT "tty_info"
               Prelude'.return (\ o -> o{_tty_info = v}))