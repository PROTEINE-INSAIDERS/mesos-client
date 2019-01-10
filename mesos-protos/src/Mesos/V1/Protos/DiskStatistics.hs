{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DiskStatistics (DiskStatistics(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Resource.DiskInfo.Persistence as Protos.Resource.DiskInfo (Persistence)
import qualified Mesos.V1.Protos.Resource.DiskInfo.Source as Protos.Resource.DiskInfo (Source)

data DiskStatistics = DiskStatistics{source :: !(P'.Maybe Protos.Resource.DiskInfo.Source),
                                     persistence :: !(P'.Maybe Protos.Resource.DiskInfo.Persistence),
                                     limit_bytes :: !(P'.Maybe P'.Word64), used_bytes :: !(P'.Maybe P'.Word64)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON DiskStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("source", P'.toJSON (Prelude'.fmap P'.toJSON (source msg))),
        ("persistence", P'.toJSON (Prelude'.fmap P'.toJSON (persistence msg))),
        ("limit_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (limit_bytes msg))),
        ("used_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (used_bytes msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON DiskStatistics where
  parseJSON
   = P'.withObject "DiskStatistics"
      (\ o ->
        do
          source <- P'.explicitParseFieldMaybe P'.parseJSON o "source"
          persistence <- P'.explicitParseFieldMaybe P'.parseJSON o "persistence"
          limit_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "limit_bytes"
          used_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "used_bytes"
          Prelude'.return
           P'.defaultValue{source = source, persistence = persistence, limit_bytes = limit_bytes, used_bytes = used_bytes})

instance P'.Mergeable DiskStatistics where
  mergeAppend (DiskStatistics x'1 x'2 x'3 x'4) (DiskStatistics y'1 y'2 y'3 y'4)
   = DiskStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default DiskStatistics where
  defaultValue = DiskStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire DiskStatistics where
  wireSize ft' self'@(DiskStatistics x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 4 x'3 + P'.wireSizeOpt 1 4 x'4)
  wirePutWithSize ft' self'@(DiskStatistics x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 24 4 x'3,
             P'.wirePutOptWithSize 32 4 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{source = P'.mergeAppend (source old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{persistence = P'.mergeAppend (persistence old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{limit_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{used_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DiskStatistics) DiskStatistics where
  getVal m' f' = f' m'

instance P'.GPB DiskStatistics

instance P'.ReflectDescriptor DiskStatistics where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 24, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DiskStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DiskStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DiskStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiskStatistics.source\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiskStatistics\"], baseName' = FName \"source\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Source\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\"], baseName = MName \"Source\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiskStatistics.persistence\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiskStatistics\"], baseName' = FName \"persistence\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Persistence\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\"], baseName = MName \"Persistence\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiskStatistics.limit_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiskStatistics\"], baseName' = FName \"limit_bytes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DiskStatistics.used_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DiskStatistics\"], baseName' = FName \"used_bytes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType DiskStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DiskStatistics where
  textPut msg
   = do
       P'.tellT "source" (source msg)
       P'.tellT "persistence" (persistence msg)
       P'.tellT "limit_bytes" (limit_bytes msg)
       P'.tellT "used_bytes" (used_bytes msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'source, parse'persistence, parse'limit_bytes, parse'used_bytes]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'source
         = P'.try
            (do
               v <- P'.getT "source"
               Prelude'.return (\ o -> o{source = v}))
        parse'persistence
         = P'.try
            (do
               v <- P'.getT "persistence"
               Prelude'.return (\ o -> o{persistence = v}))
        parse'limit_bytes
         = P'.try
            (do
               v <- P'.getT "limit_bytes"
               Prelude'.return (\ o -> o{limit_bytes = v}))
        parse'used_bytes
         = P'.try
            (do
               v <- P'.getT "used_bytes"
               Prelude'.return (\ o -> o{used_bytes = v}))