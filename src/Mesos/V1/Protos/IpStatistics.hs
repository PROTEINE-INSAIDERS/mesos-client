{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.IpStatistics (IpStatistics(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data IpStatistics = IpStatistics{forwarding :: !(P'.Maybe P'.Int64), defaultTTL :: !(P'.Maybe P'.Int64),
                                 inReceives :: !(P'.Maybe P'.Int64), inHdrErrors :: !(P'.Maybe P'.Int64),
                                 inAddrErrors :: !(P'.Maybe P'.Int64), forwDatagrams :: !(P'.Maybe P'.Int64),
                                 inUnknownProtos :: !(P'.Maybe P'.Int64), inDiscards :: !(P'.Maybe P'.Int64),
                                 inDelivers :: !(P'.Maybe P'.Int64), outRequests :: !(P'.Maybe P'.Int64),
                                 outDiscards :: !(P'.Maybe P'.Int64), outNoRoutes :: !(P'.Maybe P'.Int64),
                                 reasmTimeout :: !(P'.Maybe P'.Int64), reasmReqds :: !(P'.Maybe P'.Int64),
                                 reasmOKs :: !(P'.Maybe P'.Int64), reasmFails :: !(P'.Maybe P'.Int64),
                                 fragOKs :: !(P'.Maybe P'.Int64), fragFails :: !(P'.Maybe P'.Int64),
                                 fragCreates :: !(P'.Maybe P'.Int64)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable IpStatistics where
  mergeAppend (IpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19)
   (IpStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19)
   = IpStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)

instance P'.Default IpStatistics where
  defaultValue
   = IpStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire IpStatistics where
  wireSize ft' self'@(IpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 3 x'1 + P'.wireSizeOpt 1 3 x'2 + P'.wireSizeOpt 1 3 x'3 + P'.wireSizeOpt 1 3 x'4 +
             P'.wireSizeOpt 1 3 x'5
             + P'.wireSizeOpt 1 3 x'6
             + P'.wireSizeOpt 1 3 x'7
             + P'.wireSizeOpt 1 3 x'8
             + P'.wireSizeOpt 1 3 x'9
             + P'.wireSizeOpt 1 3 x'10
             + P'.wireSizeOpt 1 3 x'11
             + P'.wireSizeOpt 1 3 x'12
             + P'.wireSizeOpt 1 3 x'13
             + P'.wireSizeOpt 1 3 x'14
             + P'.wireSizeOpt 1 3 x'15
             + P'.wireSizeOpt 2 3 x'16
             + P'.wireSizeOpt 2 3 x'17
             + P'.wireSizeOpt 2 3 x'18
             + P'.wireSizeOpt 2 3 x'19)
  wirePutWithSize ft' self'@(IpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 3 x'1, P'.wirePutOptWithSize 16 3 x'2, P'.wirePutOptWithSize 24 3 x'3,
             P'.wirePutOptWithSize 32 3 x'4, P'.wirePutOptWithSize 40 3 x'5, P'.wirePutOptWithSize 48 3 x'6,
             P'.wirePutOptWithSize 56 3 x'7, P'.wirePutOptWithSize 64 3 x'8, P'.wirePutOptWithSize 72 3 x'9,
             P'.wirePutOptWithSize 80 3 x'10, P'.wirePutOptWithSize 88 3 x'11, P'.wirePutOptWithSize 96 3 x'12,
             P'.wirePutOptWithSize 104 3 x'13, P'.wirePutOptWithSize 112 3 x'14, P'.wirePutOptWithSize 120 3 x'15,
             P'.wirePutOptWithSize 128 3 x'16, P'.wirePutOptWithSize 136 3 x'17, P'.wirePutOptWithSize 144 3 x'18,
             P'.wirePutOptWithSize 152 3 x'19]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{forwarding = Prelude'.Just new'Field}) (P'.wireGet 3)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{defaultTTL = Prelude'.Just new'Field}) (P'.wireGet 3)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{inReceives = Prelude'.Just new'Field}) (P'.wireGet 3)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{inHdrErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{inAddrErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{forwDatagrams = Prelude'.Just new'Field}) (P'.wireGet 3)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{inUnknownProtos = Prelude'.Just new'Field}) (P'.wireGet 3)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{inDiscards = Prelude'.Just new'Field}) (P'.wireGet 3)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{inDelivers = Prelude'.Just new'Field}) (P'.wireGet 3)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{outRequests = Prelude'.Just new'Field}) (P'.wireGet 3)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{outDiscards = Prelude'.Just new'Field}) (P'.wireGet 3)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{outNoRoutes = Prelude'.Just new'Field}) (P'.wireGet 3)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{reasmTimeout = Prelude'.Just new'Field}) (P'.wireGet 3)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{reasmReqds = Prelude'.Just new'Field}) (P'.wireGet 3)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{reasmOKs = Prelude'.Just new'Field}) (P'.wireGet 3)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{reasmFails = Prelude'.Just new'Field}) (P'.wireGet 3)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{fragOKs = Prelude'.Just new'Field}) (P'.wireGet 3)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{fragFails = Prelude'.Just new'Field}) (P'.wireGet 3)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{fragCreates = Prelude'.Just new'Field}) (P'.wireGet 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> IpStatistics) IpStatistics where
  getVal m' f' = f' m'

instance P'.GPB IpStatistics

instance P'.ReflectDescriptor IpStatistics where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.IpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"IpStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"IpStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.Forwarding\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"forwarding\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.DefaultTTL\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"defaultTTL\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InReceives\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inReceives\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InHdrErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inHdrErrors\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InAddrErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inAddrErrors\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ForwDatagrams\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"forwDatagrams\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InUnknownProtos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inUnknownProtos\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InDiscards\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inDiscards\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InDelivers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inDelivers\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.OutRequests\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"outRequests\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.OutDiscards\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"outDiscards\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.OutNoRoutes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"outNoRoutes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmTimeout\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmTimeout\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmReqds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmReqds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmOKs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmOKs\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmFails\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmFails\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.FragOKs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"fragOKs\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.FragFails\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"fragFails\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.FragCreates\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"fragCreates\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType IpStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg IpStatistics where
  textPut msg
   = do
       P'.tellT "Forwarding" (forwarding msg)
       P'.tellT "DefaultTTL" (defaultTTL msg)
       P'.tellT "InReceives" (inReceives msg)
       P'.tellT "InHdrErrors" (inHdrErrors msg)
       P'.tellT "InAddrErrors" (inAddrErrors msg)
       P'.tellT "ForwDatagrams" (forwDatagrams msg)
       P'.tellT "InUnknownProtos" (inUnknownProtos msg)
       P'.tellT "InDiscards" (inDiscards msg)
       P'.tellT "InDelivers" (inDelivers msg)
       P'.tellT "OutRequests" (outRequests msg)
       P'.tellT "OutDiscards" (outDiscards msg)
       P'.tellT "OutNoRoutes" (outNoRoutes msg)
       P'.tellT "ReasmTimeout" (reasmTimeout msg)
       P'.tellT "ReasmReqds" (reasmReqds msg)
       P'.tellT "ReasmOKs" (reasmOKs msg)
       P'.tellT "ReasmFails" (reasmFails msg)
       P'.tellT "FragOKs" (fragOKs msg)
       P'.tellT "FragFails" (fragFails msg)
       P'.tellT "FragCreates" (fragCreates msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'forwarding, parse'defaultTTL, parse'inReceives, parse'inHdrErrors, parse'inAddrErrors, parse'forwDatagrams,
                   parse'inUnknownProtos, parse'inDiscards, parse'inDelivers, parse'outRequests, parse'outDiscards,
                   parse'outNoRoutes, parse'reasmTimeout, parse'reasmReqds, parse'reasmOKs, parse'reasmFails, parse'fragOKs,
                   parse'fragFails, parse'fragCreates])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'forwarding
         = P'.try
            (do
               v <- P'.getT "Forwarding"
               Prelude'.return (\ o -> o{forwarding = v}))
        parse'defaultTTL
         = P'.try
            (do
               v <- P'.getT "DefaultTTL"
               Prelude'.return (\ o -> o{defaultTTL = v}))
        parse'inReceives
         = P'.try
            (do
               v <- P'.getT "InReceives"
               Prelude'.return (\ o -> o{inReceives = v}))
        parse'inHdrErrors
         = P'.try
            (do
               v <- P'.getT "InHdrErrors"
               Prelude'.return (\ o -> o{inHdrErrors = v}))
        parse'inAddrErrors
         = P'.try
            (do
               v <- P'.getT "InAddrErrors"
               Prelude'.return (\ o -> o{inAddrErrors = v}))
        parse'forwDatagrams
         = P'.try
            (do
               v <- P'.getT "ForwDatagrams"
               Prelude'.return (\ o -> o{forwDatagrams = v}))
        parse'inUnknownProtos
         = P'.try
            (do
               v <- P'.getT "InUnknownProtos"
               Prelude'.return (\ o -> o{inUnknownProtos = v}))
        parse'inDiscards
         = P'.try
            (do
               v <- P'.getT "InDiscards"
               Prelude'.return (\ o -> o{inDiscards = v}))
        parse'inDelivers
         = P'.try
            (do
               v <- P'.getT "InDelivers"
               Prelude'.return (\ o -> o{inDelivers = v}))
        parse'outRequests
         = P'.try
            (do
               v <- P'.getT "OutRequests"
               Prelude'.return (\ o -> o{outRequests = v}))
        parse'outDiscards
         = P'.try
            (do
               v <- P'.getT "OutDiscards"
               Prelude'.return (\ o -> o{outDiscards = v}))
        parse'outNoRoutes
         = P'.try
            (do
               v <- P'.getT "OutNoRoutes"
               Prelude'.return (\ o -> o{outNoRoutes = v}))
        parse'reasmTimeout
         = P'.try
            (do
               v <- P'.getT "ReasmTimeout"
               Prelude'.return (\ o -> o{reasmTimeout = v}))
        parse'reasmReqds
         = P'.try
            (do
               v <- P'.getT "ReasmReqds"
               Prelude'.return (\ o -> o{reasmReqds = v}))
        parse'reasmOKs
         = P'.try
            (do
               v <- P'.getT "ReasmOKs"
               Prelude'.return (\ o -> o{reasmOKs = v}))
        parse'reasmFails
         = P'.try
            (do
               v <- P'.getT "ReasmFails"
               Prelude'.return (\ o -> o{reasmFails = v}))
        parse'fragOKs
         = P'.try
            (do
               v <- P'.getT "FragOKs"
               Prelude'.return (\ o -> o{fragOKs = v}))
        parse'fragFails
         = P'.try
            (do
               v <- P'.getT "FragFails"
               Prelude'.return (\ o -> o{fragFails = v}))
        parse'fragCreates
         = P'.try
            (do
               v <- P'.getT "FragCreates"
               Prelude'.return (\ o -> o{fragCreates = v}))