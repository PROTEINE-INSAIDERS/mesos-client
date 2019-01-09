{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Image (Image(..), type', appc, docker, cached) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Image.Appc as Protos.Image (Appc)
import qualified Mesos.V1.Protos.Image.Docker as Protos.Image (Docker)
import qualified Mesos.V1.Protos.Image.Type as Protos.Image (Type)

data Image = Image{_type' :: !(Protos.Image.Type), _appc :: !(P'.Maybe Protos.Image.Appc),
                   _docker :: !(P'.Maybe Protos.Image.Docker), _cached :: !(P'.Maybe P'.Bool)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Image

instance P'.ToJSON Image where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (type' msg)), ("appc", P'.toJSON (Prelude'.fmap P'.toJSON (appc msg))),
        ("docker", P'.toJSON (Prelude'.fmap P'.toJSON (docker msg))), ("cached", P'.toJSON (Prelude'.fmap P'.toJSON (cached msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Image where
  parseJSON
   = P'.withObject "Image"
      (\ o ->
        do
          type' <- P'.explicitParseField P'.parseJSON o "type"
          appc <- P'.explicitParseFieldMaybe P'.parseJSON o "appc"
          docker <- P'.explicitParseFieldMaybe P'.parseJSON o "docker"
          cached <- do
                      tmp <- P'.explicitParseFieldMaybe P'.parseJSONBool o "cached"
                      Prelude'.return (Prelude'.maybe (Prelude'.Just (Prelude'.True)) Prelude'.Just tmp)
          Prelude'.return P'.defaultValue{_type' = type', _appc = appc, _docker = docker, _cached = cached})

instance P'.Mergeable Image where
  mergeAppend (Image x'1 x'2 x'3 x'4) (Image y'1 y'2 y'3 y'4)
   = Image (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default Image where
  defaultValue = Image P'.defaultValue P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.True)

instance P'.Wire Image where
  wireSize ft' self'@(Image x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 8 x'4)
  wirePutWithSize ft' self'@(Image x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 32 8 x'4]
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
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_appc = P'.mergeAppend (_appc old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_docker = P'.mergeAppend (_docker old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_cached = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Image) Image where
  getVal m' f' = f' m'

instance P'.GPB Image

instance P'.ReflectDescriptor Image where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Image\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Image\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Image.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Image.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Image\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Image.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Image\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Image.appc\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Image\"], baseName' = FName \"appc\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Image.Appc\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Image\"], baseName = MName \"Appc\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Image.docker\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Image\"], baseName' = FName \"docker\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Image.Docker\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Image\"], baseName = MName \"Docker\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Image.cached\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Image\"], baseName' = FName \"cached\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Image where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Image where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "appc" (_appc msg)
       P'.tellT "docker" (_docker msg)
       P'.tellT "cached" (_cached msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_type', parse'_appc, parse'_docker, parse'_cached]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_appc
         = P'.try
            (do
               v <- P'.getT "appc"
               Prelude'.return (\ o -> o{_appc = v}))
        parse'_docker
         = P'.try
            (do
               v <- P'.getT "docker"
               Prelude'.return (\ o -> o{_docker = v}))
        parse'_cached
         = P'.try
            (do
               v <- P'.getT "cached"
               Prelude'.return (\ o -> o{_cached = v}))