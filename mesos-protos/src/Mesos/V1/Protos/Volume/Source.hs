{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Volume.Source (Source(..), type', docker_volume, host_path, sandbox_path, secret) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Secret as Protos (Secret)
import qualified Mesos.V1.Protos.Volume.Source.DockerVolume as Protos.Volume.Source (DockerVolume)
import qualified Mesos.V1.Protos.Volume.Source.HostPath as Protos.Volume.Source (HostPath)
import qualified Mesos.V1.Protos.Volume.Source.SandboxPath as Protos.Volume.Source (SandboxPath)
import qualified Mesos.V1.Protos.Volume.Source.Type as Protos.Volume.Source (Type)

data Source = Source{_type' :: !(P'.Maybe Protos.Volume.Source.Type),
                     _docker_volume :: !(P'.Maybe Protos.Volume.Source.DockerVolume),
                     _host_path :: !(P'.Maybe Protos.Volume.Source.HostPath),
                     _sandbox_path :: !(P'.Maybe Protos.Volume.Source.SandboxPath), _secret :: !(P'.Maybe Protos.Secret)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Source

instance P'.ToJSON Source where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("docker_volume", P'.toJSON (Prelude'.fmap P'.toJSON (docker_volume msg))),
        ("host_path", P'.toJSON (Prelude'.fmap P'.toJSON (host_path msg))),
        ("sandbox_path", P'.toJSON (Prelude'.fmap P'.toJSON (sandbox_path msg))),
        ("secret", P'.toJSON (Prelude'.fmap P'.toJSON (secret msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Source where
  parseJSON
   = P'.withObject "Source"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          docker_volume <- P'.explicitParseFieldMaybe P'.parseJSON o "docker_volume"
          host_path <- P'.explicitParseFieldMaybe P'.parseJSON o "host_path"
          sandbox_path <- P'.explicitParseFieldMaybe P'.parseJSON o "sandbox_path"
          secret <- P'.explicitParseFieldMaybe P'.parseJSON o "secret"
          Prelude'.return
           P'.defaultValue{_type' = type', _docker_volume = docker_volume, _host_path = host_path, _sandbox_path = sandbox_path,
                           _secret = secret})

instance P'.Mergeable Source where
  mergeAppend (Source x'1 x'2 x'3 x'4 x'5) (Source y'1 y'2 y'3 y'4 y'5)
   = Source (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default Source where
  defaultValue = Source P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Source where
  wireSize ft' self'@(Source x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5)
  wirePutWithSize ft' self'@(Source x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'4,
             P'.wirePutOptWithSize 34 11 x'5, P'.wirePutOptWithSize 42 11 x'3]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_docker_volume = P'.mergeAppend (_docker_volume old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_host_path = P'.mergeAppend (_host_path old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_sandbox_path = P'.mergeAppend (_sandbox_path old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_secret = P'.mergeAppend (_secret old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Source) Source where
  getVal m' f' = f' m'

instance P'.GPB Source

instance P'.ReflectDescriptor Source where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Volume.Source\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\"], baseName = MName \"Source\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Volume\",\"Source.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume.Source.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.docker_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName' = FName \"docker_volume\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume.Source.DockerVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName = MName \"DockerVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.host_path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName' = FName \"host_path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume.Source.HostPath\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName = MName \"HostPath\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.sandbox_path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName' = FName \"sandbox_path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Volume.Source.SandboxPath\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName = MName \"SandboxPath\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.secret\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName' = FName \"secret\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Secret\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Secret\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Source where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Source where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "docker_volume" (_docker_volume msg)
       P'.tellT "host_path" (_host_path msg)
       P'.tellT "sandbox_path" (_sandbox_path msg)
       P'.tellT "secret" (_secret msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_type', parse'_docker_volume, parse'_host_path, parse'_sandbox_path, parse'_secret])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_docker_volume
         = P'.try
            (do
               v <- P'.getT "docker_volume"
               Prelude'.return (\ o -> o{_docker_volume = v}))
        parse'_host_path
         = P'.try
            (do
               v <- P'.getT "host_path"
               Prelude'.return (\ o -> o{_host_path = v}))
        parse'_sandbox_path
         = P'.try
            (do
               v <- P'.getT "sandbox_path"
               Prelude'.return (\ o -> o{_sandbox_path = v}))
        parse'_secret
         = P'.try
            (do
               v <- P'.getT "secret"
               Prelude'.return (\ o -> o{_secret = v}))