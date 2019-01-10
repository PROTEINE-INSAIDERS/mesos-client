{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Volume.Source.HostPath (HostPath(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.MountPropagation as Protos (MountPropagation)

data HostPath = HostPath{path :: !(P'.Utf8), mount_propagation :: !(P'.Maybe Protos.MountPropagation)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON HostPath where
  toJSON msg
   = P'.objectNoEmpty
      ([("path", P'.toJSON (path msg)), ("mount_propagation", P'.toJSON (Prelude'.fmap P'.toJSON (mount_propagation msg)))] ++
        Prelude'.concat [])

instance P'.FromJSON HostPath where
  parseJSON
   = P'.withObject "HostPath"
      (\ o ->
        do
          path <- P'.explicitParseField P'.parseJSON o "path"
          mount_propagation <- P'.explicitParseFieldMaybe P'.parseJSON o "mount_propagation"
          Prelude'.return P'.defaultValue{path = path, mount_propagation = mount_propagation})

instance P'.Mergeable HostPath where
  mergeAppend (HostPath x'1 x'2) (HostPath y'1 y'2) = HostPath (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default HostPath where
  defaultValue = HostPath P'.defaultValue P'.defaultValue

instance P'.Wire HostPath where
  wireSize ft' self'@(HostPath x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 11 x'2)
  wirePutWithSize ft' self'@(HostPath x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{path = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{mount_propagation = P'.mergeAppend (mount_propagation old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> HostPath) HostPath where
  getVal m' f' = f' m'

instance P'.GPB HostPath

instance P'.ReflectDescriptor HostPath where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Volume.Source.HostPath\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Volume\",MName \"Source\"], baseName = MName \"HostPath\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Volume\",\"Source\",\"HostPath.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.HostPath.path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\",MName \"HostPath\"], baseName' = FName \"path\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Volume.Source.HostPath.mount_propagation\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Volume\",MName \"Source\",MName \"HostPath\"], baseName' = FName \"mount_propagation\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MountPropagation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MountPropagation\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType HostPath where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg HostPath where
  textPut msg
   = do
       P'.tellT "path" (path msg)
       P'.tellT "mount_propagation" (mount_propagation msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'path, parse'mount_propagation]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'path
         = P'.try
            (do
               v <- P'.getT "path"
               Prelude'.return (\ o -> o{path = v}))
        parse'mount_propagation
         = P'.try
            (do
               v <- P'.getT "mount_propagation"
               Prelude'.return (\ o -> o{mount_propagation = v}))