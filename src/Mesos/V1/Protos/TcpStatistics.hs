{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TcpStatistics (TcpStatistics(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data TcpStatistics = TcpStatistics{rtoAlgorithm :: !(P'.Maybe P'.Int64), rtoMin :: !(P'.Maybe P'.Int64),
                                   rtoMax :: !(P'.Maybe P'.Int64), maxConn :: !(P'.Maybe P'.Int64),
                                   activeOpens :: !(P'.Maybe P'.Int64), passiveOpens :: !(P'.Maybe P'.Int64),
                                   attemptFails :: !(P'.Maybe P'.Int64), estabResets :: !(P'.Maybe P'.Int64),
                                   currEstab :: !(P'.Maybe P'.Int64), inSegs :: !(P'.Maybe P'.Int64),
                                   outSegs :: !(P'.Maybe P'.Int64), retransSegs :: !(P'.Maybe P'.Int64),
                                   inErrs :: !(P'.Maybe P'.Int64), outRsts :: !(P'.Maybe P'.Int64),
                                   inCsumErrors :: !(P'.Maybe P'.Int64)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TcpStatistics where
  mergeAppend (TcpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15)
   (TcpStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15)
   = TcpStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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

instance P'.Default TcpStatistics where
  defaultValue
   = TcpStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire TcpStatistics where
  wireSize ft' self'@(TcpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15)
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
             + P'.wireSizeOpt 1 3 x'15)
  wirePutWithSize ft' self'@(TcpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15)
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
             P'.wirePutOptWithSize 104 3 x'13, P'.wirePutOptWithSize 112 3 x'14, P'.wirePutOptWithSize 120 3 x'15]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{rtoAlgorithm = Prelude'.Just new'Field}) (P'.wireGet 3)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{rtoMin = Prelude'.Just new'Field}) (P'.wireGet 3)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{rtoMax = Prelude'.Just new'Field}) (P'.wireGet 3)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{maxConn = Prelude'.Just new'Field}) (P'.wireGet 3)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{activeOpens = Prelude'.Just new'Field}) (P'.wireGet 3)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{passiveOpens = Prelude'.Just new'Field}) (P'.wireGet 3)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{attemptFails = Prelude'.Just new'Field}) (P'.wireGet 3)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{estabResets = Prelude'.Just new'Field}) (P'.wireGet 3)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{currEstab = Prelude'.Just new'Field}) (P'.wireGet 3)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{inSegs = Prelude'.Just new'Field}) (P'.wireGet 3)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{outSegs = Prelude'.Just new'Field}) (P'.wireGet 3)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{retransSegs = Prelude'.Just new'Field}) (P'.wireGet 3)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{inErrs = Prelude'.Just new'Field}) (P'.wireGet 3)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{outRsts = Prelude'.Just new'Field}) (P'.wireGet 3)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{inCsumErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TcpStatistics) TcpStatistics where
  getVal m' f' = f' m'

instance P'.GPB TcpStatistics

instance P'.ReflectDescriptor TcpStatistics where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.TcpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TcpStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"TcpStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RtoAlgorithm\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"rtoAlgorithm\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RtoMin\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"rtoMin\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RtoMax\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"rtoMax\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.MaxConn\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"maxConn\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.ActiveOpens\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"activeOpens\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.PassiveOpens\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"passiveOpens\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.AttemptFails\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"attemptFails\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.EstabResets\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"estabResets\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.CurrEstab\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"currEstab\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.InSegs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"inSegs\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.OutSegs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"outSegs\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RetransSegs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"retransSegs\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.InErrs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"inErrs\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.OutRsts\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"outRsts\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.InCsumErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"inCsumErrors\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType TcpStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TcpStatistics where
  textPut msg
   = do
       P'.tellT "RtoAlgorithm" (rtoAlgorithm msg)
       P'.tellT "RtoMin" (rtoMin msg)
       P'.tellT "RtoMax" (rtoMax msg)
       P'.tellT "MaxConn" (maxConn msg)
       P'.tellT "ActiveOpens" (activeOpens msg)
       P'.tellT "PassiveOpens" (passiveOpens msg)
       P'.tellT "AttemptFails" (attemptFails msg)
       P'.tellT "EstabResets" (estabResets msg)
       P'.tellT "CurrEstab" (currEstab msg)
       P'.tellT "InSegs" (inSegs msg)
       P'.tellT "OutSegs" (outSegs msg)
       P'.tellT "RetransSegs" (retransSegs msg)
       P'.tellT "InErrs" (inErrs msg)
       P'.tellT "OutRsts" (outRsts msg)
       P'.tellT "InCsumErrors" (inCsumErrors msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'rtoAlgorithm, parse'rtoMin, parse'rtoMax, parse'maxConn, parse'activeOpens, parse'passiveOpens,
                   parse'attemptFails, parse'estabResets, parse'currEstab, parse'inSegs, parse'outSegs, parse'retransSegs,
                   parse'inErrs, parse'outRsts, parse'inCsumErrors])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'rtoAlgorithm
         = P'.try
            (do
               v <- P'.getT "RtoAlgorithm"
               Prelude'.return (\ o -> o{rtoAlgorithm = v}))
        parse'rtoMin
         = P'.try
            (do
               v <- P'.getT "RtoMin"
               Prelude'.return (\ o -> o{rtoMin = v}))
        parse'rtoMax
         = P'.try
            (do
               v <- P'.getT "RtoMax"
               Prelude'.return (\ o -> o{rtoMax = v}))
        parse'maxConn
         = P'.try
            (do
               v <- P'.getT "MaxConn"
               Prelude'.return (\ o -> o{maxConn = v}))
        parse'activeOpens
         = P'.try
            (do
               v <- P'.getT "ActiveOpens"
               Prelude'.return (\ o -> o{activeOpens = v}))
        parse'passiveOpens
         = P'.try
            (do
               v <- P'.getT "PassiveOpens"
               Prelude'.return (\ o -> o{passiveOpens = v}))
        parse'attemptFails
         = P'.try
            (do
               v <- P'.getT "AttemptFails"
               Prelude'.return (\ o -> o{attemptFails = v}))
        parse'estabResets
         = P'.try
            (do
               v <- P'.getT "EstabResets"
               Prelude'.return (\ o -> o{estabResets = v}))
        parse'currEstab
         = P'.try
            (do
               v <- P'.getT "CurrEstab"
               Prelude'.return (\ o -> o{currEstab = v}))
        parse'inSegs
         = P'.try
            (do
               v <- P'.getT "InSegs"
               Prelude'.return (\ o -> o{inSegs = v}))
        parse'outSegs
         = P'.try
            (do
               v <- P'.getT "OutSegs"
               Prelude'.return (\ o -> o{outSegs = v}))
        parse'retransSegs
         = P'.try
            (do
               v <- P'.getT "RetransSegs"
               Prelude'.return (\ o -> o{retransSegs = v}))
        parse'inErrs
         = P'.try
            (do
               v <- P'.getT "InErrs"
               Prelude'.return (\ o -> o{inErrs = v}))
        parse'outRsts
         = P'.try
            (do
               v <- P'.getT "OutRsts"
               Prelude'.return (\ o -> o{outRsts = v}))
        parse'inCsumErrors
         = P'.try
            (do
               v <- P'.getT "InCsumErrors"
               Prelude'.return (\ o -> o{inCsumErrors = v}))