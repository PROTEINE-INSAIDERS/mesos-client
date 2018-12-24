{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerStatus (ContainerStatus(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.CgroupInfo as Protos (CgroupInfo)
import qualified Mesos.V1.Protos.ContainerID as Protos (ContainerID)
import qualified Mesos.V1.Protos.NetworkInfo as Protos (NetworkInfo)

data ContainerStatus = ContainerStatus{container_id :: !(P'.Maybe Protos.ContainerID),
                                       network_infos :: !(P'.Seq Protos.NetworkInfo), cgroup_info :: !(P'.Maybe Protos.CgroupInfo),
                                       executor_pid :: !(P'.Maybe P'.Word32)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON ContainerStatus where
  toJSON msg
   = P'.objectNoEmpty
      ([("container_id", P'.toJSON (Prelude'.fmap P'.toJSON (container_id msg))),
        ("network_infos", P'.toJSON (Prelude'.fmap P'.toJSON (network_infos msg))),
        ("cgroup_info", P'.toJSON (Prelude'.fmap P'.toJSON (cgroup_info msg))),
        ("executor_pid", P'.toJSON (Prelude'.fmap P'.toJSON (executor_pid msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ContainerStatus where
  parseJSON
   = P'.withObject "ContainerStatus"
      (\ o ->
        do
          container_id <- P'.explicitParseFieldMaybe P'.parseJSON o "container_id"
          network_infos <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "network_infos")
          cgroup_info <- P'.explicitParseFieldMaybe P'.parseJSON o "cgroup_info"
          executor_pid <- P'.explicitParseFieldMaybe P'.parseJSON o "executor_pid"
          Prelude'.return
           P'.defaultValue{container_id = container_id, network_infos = network_infos, cgroup_info = cgroup_info,
                           executor_pid = executor_pid})

instance P'.Mergeable ContainerStatus where
  mergeAppend (ContainerStatus x'1 x'2 x'3 x'4) (ContainerStatus y'1 y'2 y'3 y'4)
   = ContainerStatus (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default ContainerStatus where
  defaultValue = ContainerStatus P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire ContainerStatus where
  wireSize ft' self'@(ContainerStatus x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 13 x'4)
  wirePutWithSize ft' self'@(ContainerStatus x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutRepWithSize 10 11 x'2, P'.wirePutOptWithSize 18 11 x'3, P'.wirePutOptWithSize 24 13 x'4,
             P'.wirePutOptWithSize 34 11 x'1]
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
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{container_id = P'.mergeAppend (container_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{network_infos = P'.append (network_infos old'Self) new'Field})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{cgroup_info = P'.mergeAppend (cgroup_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{executor_pid = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ContainerStatus) ContainerStatus where
  getVal m' f' = f' m'

instance P'.GPB ContainerStatus

instance P'.ReflectDescriptor ContainerStatus where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 24, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ContainerStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerStatus\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ContainerStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerStatus.container_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerStatus\"], baseName' = FName \"container_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerStatus.network_infos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerStatus\"], baseName' = FName \"network_infos\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"NetworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerStatus.cgroup_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerStatus\"], baseName' = FName \"cgroup_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CgroupInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerStatus.executor_pid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerStatus\"], baseName' = FName \"executor_pid\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType ContainerStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ContainerStatus where
  textPut msg
   = do
       P'.tellT "container_id" (container_id msg)
       P'.tellT "network_infos" (network_infos msg)
       P'.tellT "cgroup_info" (cgroup_info msg)
       P'.tellT "executor_pid" (executor_pid msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'container_id, parse'network_infos, parse'cgroup_info, parse'executor_pid]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'container_id
         = P'.try
            (do
               v <- P'.getT "container_id"
               Prelude'.return (\ o -> o{container_id = v}))
        parse'network_infos
         = P'.try
            (do
               v <- P'.getT "network_infos"
               Prelude'.return (\ o -> o{network_infos = P'.append (network_infos o) v}))
        parse'cgroup_info
         = P'.try
            (do
               v <- P'.getT "cgroup_info"
               Prelude'.return (\ o -> o{cgroup_info = v}))
        parse'executor_pid
         = P'.try
            (do
               v <- P'.getT "executor_pid"
               Prelude'.return (\ o -> o{executor_pid = v}))