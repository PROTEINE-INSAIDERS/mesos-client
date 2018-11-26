{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TrafficControlStatistics (TrafficControlStatistics(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data TrafficControlStatistics = TrafficControlStatistics{id :: !(P'.Utf8), backlog :: !(P'.Maybe P'.Word64),
                                                         bytes :: !(P'.Maybe P'.Word64), drops :: !(P'.Maybe P'.Word64),
                                                         overlimits :: !(P'.Maybe P'.Word64), packets :: !(P'.Maybe P'.Word64),
                                                         qlen :: !(P'.Maybe P'.Word64), ratebps :: !(P'.Maybe P'.Word64),
                                                         ratepps :: !(P'.Maybe P'.Word64), requeues :: !(P'.Maybe P'.Word64)}
                                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                          Prelude'.Generic)

instance P'.Mergeable TrafficControlStatistics where
  mergeAppend (TrafficControlStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10)
   (TrafficControlStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10)
   = TrafficControlStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)

instance P'.Default TrafficControlStatistics where
  defaultValue
   = TrafficControlStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire TrafficControlStatistics where
  wireSize ft' self'@(TrafficControlStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 4 x'2 + P'.wireSizeOpt 1 4 x'3 + P'.wireSizeOpt 1 4 x'4 +
             P'.wireSizeOpt 1 4 x'5
             + P'.wireSizeOpt 1 4 x'6
             + P'.wireSizeOpt 1 4 x'7
             + P'.wireSizeOpt 1 4 x'8
             + P'.wireSizeOpt 1 4 x'9
             + P'.wireSizeOpt 1 4 x'10)
  wirePutWithSize ft' self'@(TrafficControlStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 16 4 x'2, P'.wirePutOptWithSize 24 4 x'3,
             P'.wirePutOptWithSize 32 4 x'4, P'.wirePutOptWithSize 40 4 x'5, P'.wirePutOptWithSize 48 4 x'6,
             P'.wirePutOptWithSize 56 4 x'7, P'.wirePutOptWithSize 64 4 x'8, P'.wirePutOptWithSize 72 4 x'9,
             P'.wirePutOptWithSize 80 4 x'10]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{id = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{backlog = Prelude'.Just new'Field}) (P'.wireGet 4)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{drops = Prelude'.Just new'Field}) (P'.wireGet 4)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{overlimits = Prelude'.Just new'Field}) (P'.wireGet 4)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{packets = Prelude'.Just new'Field}) (P'.wireGet 4)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{qlen = Prelude'.Just new'Field}) (P'.wireGet 4)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{ratebps = Prelude'.Just new'Field}) (P'.wireGet 4)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{ratepps = Prelude'.Just new'Field}) (P'.wireGet 4)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{requeues = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TrafficControlStatistics) TrafficControlStatistics where
  getVal m' f' = f' m'

instance P'.GPB TrafficControlStatistics

instance P'.ReflectDescriptor TrafficControlStatistics where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 24, 32, 40, 48, 56, 64, 72, 80])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.TrafficControlStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TrafficControlStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"TrafficControlStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.backlog\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"backlog\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"bytes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.drops\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"drops\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.overlimits\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"overlimits\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.packets\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"packets\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.qlen\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"qlen\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.ratebps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"ratebps\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.ratepps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"ratepps\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TrafficControlStatistics.requeues\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TrafficControlStatistics\"], baseName' = FName \"requeues\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType TrafficControlStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TrafficControlStatistics where
  textPut msg
   = do
       P'.tellT "id" (id msg)
       P'.tellT "backlog" (backlog msg)
       P'.tellT "bytes" (bytes msg)
       P'.tellT "drops" (drops msg)
       P'.tellT "overlimits" (overlimits msg)
       P'.tellT "packets" (packets msg)
       P'.tellT "qlen" (qlen msg)
       P'.tellT "ratebps" (ratebps msg)
       P'.tellT "ratepps" (ratepps msg)
       P'.tellT "requeues" (requeues msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'id, parse'backlog, parse'bytes, parse'drops, parse'overlimits, parse'packets, parse'qlen, parse'ratebps,
                   parse'ratepps, parse'requeues])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{id = v}))
        parse'backlog
         = P'.try
            (do
               v <- P'.getT "backlog"
               Prelude'.return (\ o -> o{backlog = v}))
        parse'bytes
         = P'.try
            (do
               v <- P'.getT "bytes"
               Prelude'.return (\ o -> o{bytes = v}))
        parse'drops
         = P'.try
            (do
               v <- P'.getT "drops"
               Prelude'.return (\ o -> o{drops = v}))
        parse'overlimits
         = P'.try
            (do
               v <- P'.getT "overlimits"
               Prelude'.return (\ o -> o{overlimits = v}))
        parse'packets
         = P'.try
            (do
               v <- P'.getT "packets"
               Prelude'.return (\ o -> o{packets = v}))
        parse'qlen
         = P'.try
            (do
               v <- P'.getT "qlen"
               Prelude'.return (\ o -> o{qlen = v}))
        parse'ratebps
         = P'.try
            (do
               v <- P'.getT "ratebps"
               Prelude'.return (\ o -> o{ratebps = v}))
        parse'ratepps
         = P'.try
            (do
               v <- P'.getT "ratepps"
               Prelude'.return (\ o -> o{ratepps = v}))
        parse'requeues
         = P'.try
            (do
               v <- P'.getT "requeues"
               Prelude'.return (\ o -> o{requeues = v}))