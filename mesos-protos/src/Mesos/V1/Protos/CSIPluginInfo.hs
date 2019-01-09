{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CSIPluginInfo (CSIPluginInfo(..), type', name, containers) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CSIPluginContainerInfo as Protos (CSIPluginContainerInfo)

data CSIPluginInfo = CSIPluginInfo{_type' :: !(P'.Utf8), _name :: !(P'.Utf8),
                                   _containers :: !(P'.Seq Protos.CSIPluginContainerInfo)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''CSIPluginInfo

instance P'.ToJSON CSIPluginInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (type' msg)), ("name", P'.toJSON (name msg)),
        ("containers", P'.toJSON (Prelude'.fmap P'.toJSON (containers msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON CSIPluginInfo where
  parseJSON
   = P'.withObject "CSIPluginInfo"
      (\ o ->
        do
          type' <- P'.explicitParseField P'.parseJSON o "type"
          name <- P'.explicitParseField P'.parseJSON o "name"
          containers <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "containers")
          Prelude'.return P'.defaultValue{_type' = type', _name = name, _containers = containers})

instance P'.Mergeable CSIPluginInfo where
  mergeAppend (CSIPluginInfo x'1 x'2 x'3) (CSIPluginInfo y'1 y'2 y'3)
   = CSIPluginInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default CSIPluginInfo where
  defaultValue = CSIPluginInfo P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire CSIPluginInfo where
  wireSize ft' self'@(CSIPluginInfo x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeRep 1 11 x'3)
  wirePutWithSize ft' self'@(CSIPluginInfo x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 18 9 x'2, P'.wirePutRepWithSize 26 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_containers = P'.append (_containers old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CSIPluginInfo) CSIPluginInfo where
  getVal m' f' = f' m'

instance P'.GPB CSIPluginInfo

instance P'.ReflectDescriptor CSIPluginInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CSIPluginInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CSIPluginInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CSIPluginInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginInfo.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginInfo\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginInfo.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginInfo\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginInfo.containers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginInfo\"], baseName' = FName \"containers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CSIPluginContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CSIPluginContainerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType CSIPluginInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CSIPluginInfo where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "name" (_name msg)
       P'.tellT "containers" (_containers msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_type', parse'_name, parse'_containers]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_containers
         = P'.try
            (do
               v <- P'.getT "containers"
               Prelude'.return (\ o -> o{_containers = P'.append (_containers o) v}))