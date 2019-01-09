{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TcpStatistics
       (TcpStatistics(..), rtoAlgorithm, rtoMin, rtoMax, maxConn, activeOpens, passiveOpens, attemptFails, estabResets, currEstab,
        inSegs, outSegs, retransSegs, inErrs, outRsts, inCsumErrors)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data TcpStatistics = TcpStatistics{_rtoAlgorithm :: !(P'.Maybe P'.Int64), _rtoMin :: !(P'.Maybe P'.Int64),
                                   _rtoMax :: !(P'.Maybe P'.Int64), _maxConn :: !(P'.Maybe P'.Int64),
                                   _activeOpens :: !(P'.Maybe P'.Int64), _passiveOpens :: !(P'.Maybe P'.Int64),
                                   _attemptFails :: !(P'.Maybe P'.Int64), _estabResets :: !(P'.Maybe P'.Int64),
                                   _currEstab :: !(P'.Maybe P'.Int64), _inSegs :: !(P'.Maybe P'.Int64),
                                   _outSegs :: !(P'.Maybe P'.Int64), _retransSegs :: !(P'.Maybe P'.Int64),
                                   _inErrs :: !(P'.Maybe P'.Int64), _outRsts :: !(P'.Maybe P'.Int64),
                                   _inCsumErrors :: !(P'.Maybe P'.Int64)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''TcpStatistics

instance P'.ToJSON TcpStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("rtoAlgorithm", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (rtoAlgorithm msg))),
        ("rtoMin", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (rtoMin msg))),
        ("rtoMax", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (rtoMax msg))),
        ("maxConn", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (maxConn msg))),
        ("activeOpens", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (activeOpens msg))),
        ("passiveOpens", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (passiveOpens msg))),
        ("attemptFails", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (attemptFails msg))),
        ("estabResets", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (estabResets msg))),
        ("currEstab", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (currEstab msg))),
        ("inSegs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inSegs msg))),
        ("outSegs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outSegs msg))),
        ("retransSegs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (retransSegs msg))),
        ("inErrs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inErrs msg))),
        ("outRsts", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outRsts msg))),
        ("inCsumErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inCsumErrors msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON TcpStatistics where
  parseJSON
   = P'.withObject "TcpStatistics"
      (\ o ->
        do
          rtoAlgorithm <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "rtoAlgorithm"
          rtoMin <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "rtoMin"
          rtoMax <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "rtoMax"
          maxConn <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "maxConn"
          activeOpens <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "activeOpens"
          passiveOpens <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "passiveOpens"
          attemptFails <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "attemptFails"
          estabResets <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "estabResets"
          currEstab <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "currEstab"
          inSegs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inSegs"
          outSegs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outSegs"
          retransSegs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "retransSegs"
          inErrs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inErrs"
          outRsts <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outRsts"
          inCsumErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inCsumErrors"
          Prelude'.return
           P'.defaultValue{_rtoAlgorithm = rtoAlgorithm, _rtoMin = rtoMin, _rtoMax = rtoMax, _maxConn = maxConn,
                           _activeOpens = activeOpens, _passiveOpens = passiveOpens, _attemptFails = attemptFails,
                           _estabResets = estabResets, _currEstab = currEstab, _inSegs = inSegs, _outSegs = outSegs,
                           _retransSegs = retransSegs, _inErrs = inErrs, _outRsts = outRsts, _inCsumErrors = inCsumErrors})

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
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_rtoAlgorithm = Prelude'.Just new'Field}) (P'.wireGet 3)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_rtoMin = Prelude'.Just new'Field}) (P'.wireGet 3)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_rtoMax = Prelude'.Just new'Field}) (P'.wireGet 3)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_maxConn = Prelude'.Just new'Field}) (P'.wireGet 3)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_activeOpens = Prelude'.Just new'Field}) (P'.wireGet 3)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_passiveOpens = Prelude'.Just new'Field}) (P'.wireGet 3)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_attemptFails = Prelude'.Just new'Field}) (P'.wireGet 3)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_estabResets = Prelude'.Just new'Field}) (P'.wireGet 3)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_currEstab = Prelude'.Just new'Field}) (P'.wireGet 3)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_inSegs = Prelude'.Just new'Field}) (P'.wireGet 3)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_outSegs = Prelude'.Just new'Field}) (P'.wireGet 3)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_retransSegs = Prelude'.Just new'Field}) (P'.wireGet 3)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{_inErrs = Prelude'.Just new'Field}) (P'.wireGet 3)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{_outRsts = Prelude'.Just new'Field}) (P'.wireGet 3)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_inCsumErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
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
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.TcpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TcpStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"TcpStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RtoAlgorithm\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"rtoAlgorithm\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RtoMin\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"rtoMin\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RtoMax\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"rtoMax\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.MaxConn\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"maxConn\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.ActiveOpens\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"activeOpens\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.PassiveOpens\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"passiveOpens\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.AttemptFails\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"attemptFails\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.EstabResets\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"estabResets\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.CurrEstab\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"currEstab\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.InSegs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"inSegs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.OutSegs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"outSegs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.RetransSegs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"retransSegs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.InErrs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"inErrs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.OutRsts\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"outRsts\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TcpStatistics.InCsumErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TcpStatistics\"], baseName' = FName \"inCsumErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType TcpStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TcpStatistics where
  textPut msg
   = do
       P'.tellT "RtoAlgorithm" (_rtoAlgorithm msg)
       P'.tellT "RtoMin" (_rtoMin msg)
       P'.tellT "RtoMax" (_rtoMax msg)
       P'.tellT "MaxConn" (_maxConn msg)
       P'.tellT "ActiveOpens" (_activeOpens msg)
       P'.tellT "PassiveOpens" (_passiveOpens msg)
       P'.tellT "AttemptFails" (_attemptFails msg)
       P'.tellT "EstabResets" (_estabResets msg)
       P'.tellT "CurrEstab" (_currEstab msg)
       P'.tellT "InSegs" (_inSegs msg)
       P'.tellT "OutSegs" (_outSegs msg)
       P'.tellT "RetransSegs" (_retransSegs msg)
       P'.tellT "InErrs" (_inErrs msg)
       P'.tellT "OutRsts" (_outRsts msg)
       P'.tellT "InCsumErrors" (_inCsumErrors msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_rtoAlgorithm, parse'_rtoMin, parse'_rtoMax, parse'_maxConn, parse'_activeOpens, parse'_passiveOpens,
                   parse'_attemptFails, parse'_estabResets, parse'_currEstab, parse'_inSegs, parse'_outSegs, parse'_retransSegs,
                   parse'_inErrs, parse'_outRsts, parse'_inCsumErrors])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_rtoAlgorithm
         = P'.try
            (do
               v <- P'.getT "RtoAlgorithm"
               Prelude'.return (\ o -> o{_rtoAlgorithm = v}))
        parse'_rtoMin
         = P'.try
            (do
               v <- P'.getT "RtoMin"
               Prelude'.return (\ o -> o{_rtoMin = v}))
        parse'_rtoMax
         = P'.try
            (do
               v <- P'.getT "RtoMax"
               Prelude'.return (\ o -> o{_rtoMax = v}))
        parse'_maxConn
         = P'.try
            (do
               v <- P'.getT "MaxConn"
               Prelude'.return (\ o -> o{_maxConn = v}))
        parse'_activeOpens
         = P'.try
            (do
               v <- P'.getT "ActiveOpens"
               Prelude'.return (\ o -> o{_activeOpens = v}))
        parse'_passiveOpens
         = P'.try
            (do
               v <- P'.getT "PassiveOpens"
               Prelude'.return (\ o -> o{_passiveOpens = v}))
        parse'_attemptFails
         = P'.try
            (do
               v <- P'.getT "AttemptFails"
               Prelude'.return (\ o -> o{_attemptFails = v}))
        parse'_estabResets
         = P'.try
            (do
               v <- P'.getT "EstabResets"
               Prelude'.return (\ o -> o{_estabResets = v}))
        parse'_currEstab
         = P'.try
            (do
               v <- P'.getT "CurrEstab"
               Prelude'.return (\ o -> o{_currEstab = v}))
        parse'_inSegs
         = P'.try
            (do
               v <- P'.getT "InSegs"
               Prelude'.return (\ o -> o{_inSegs = v}))
        parse'_outSegs
         = P'.try
            (do
               v <- P'.getT "OutSegs"
               Prelude'.return (\ o -> o{_outSegs = v}))
        parse'_retransSegs
         = P'.try
            (do
               v <- P'.getT "RetransSegs"
               Prelude'.return (\ o -> o{_retransSegs = v}))
        parse'_inErrs
         = P'.try
            (do
               v <- P'.getT "InErrs"
               Prelude'.return (\ o -> o{_inErrs = v}))
        parse'_outRsts
         = P'.try
            (do
               v <- P'.getT "OutRsts"
               Prelude'.return (\ o -> o{_outRsts = v}))
        parse'_inCsumErrors
         = P'.try
            (do
               v <- P'.getT "InCsumErrors"
               Prelude'.return (\ o -> o{_inCsumErrors = v}))