{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerInfo.DockerInfo.PortMapping (PortMapping(..), host_port, container_port, protocol) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data PortMapping = PortMapping{_host_port :: !(P'.Word32), _container_port :: !(P'.Word32), _protocol :: !(P'.Maybe P'.Utf8)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''PortMapping

instance P'.ToJSON PortMapping where
  toJSON msg
   = P'.objectNoEmpty
      ([("host_port", P'.toJSON (host_port msg)), ("container_port", P'.toJSON (container_port msg)),
        ("protocol", P'.toJSON (Prelude'.fmap P'.toJSON (protocol msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON PortMapping where
  parseJSON
   = P'.withObject "PortMapping"
      (\ o ->
        do
          host_port <- P'.explicitParseField P'.parseJSON o "host_port"
          container_port <- P'.explicitParseField P'.parseJSON o "container_port"
          protocol <- P'.explicitParseFieldMaybe P'.parseJSON o "protocol"
          Prelude'.return P'.defaultValue{_host_port = host_port, _container_port = container_port, _protocol = protocol})

instance P'.Mergeable PortMapping where
  mergeAppend (PortMapping x'1 x'2 x'3) (PortMapping y'1 y'2 y'3)
   = PortMapping (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default PortMapping where
  defaultValue = PortMapping P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire PortMapping where
  wireSize ft' self'@(PortMapping x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 13 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeOpt 1 9 x'3)
  wirePutWithSize ft' self'@(PortMapping x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 13 x'1, P'.wirePutReqWithSize 16 13 x'2, P'.wirePutOptWithSize 26 9 x'3]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_host_port = new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_container_port = new'Field}) (P'.wireGet 13)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_protocol = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> PortMapping) PortMapping where
  getVal m' f' = f' m'

instance P'.GPB PortMapping

instance P'.ReflectDescriptor PortMapping where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 16]) (P'.fromDistinctAscList [8, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo.DockerInfo.PortMapping\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\"], baseName = MName \"PortMapping\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ContainerInfo\",\"DockerInfo\",\"PortMapping.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.PortMapping.host_port\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\",MName \"PortMapping\"], baseName' = FName \"host_port\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.PortMapping.container_port\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\",MName \"PortMapping\"], baseName' = FName \"container_port\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ContainerInfo.DockerInfo.PortMapping.protocol\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ContainerInfo\",MName \"DockerInfo\",MName \"PortMapping\"], baseName' = FName \"protocol\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType PortMapping where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg PortMapping where
  textPut msg
   = do
       P'.tellT "host_port" (_host_port msg)
       P'.tellT "container_port" (_container_port msg)
       P'.tellT "protocol" (_protocol msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_host_port, parse'_container_port, parse'_protocol]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_host_port
         = P'.try
            (do
               v <- P'.getT "host_port"
               Prelude'.return (\ o -> o{_host_port = v}))
        parse'_container_port
         = P'.try
            (do
               v <- P'.getT "container_port"
               Prelude'.return (\ o -> o{_container_port = v}))
        parse'_protocol
         = P'.try
            (do
               v <- P'.getT "protocol"
               Prelude'.return (\ o -> o{_protocol = v}))