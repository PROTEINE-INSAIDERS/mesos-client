{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.UdpStatistics
       (UdpStatistics(..), inDatagrams, noPorts, inErrors, outDatagrams, rcvbufErrors, sndbufErrors, inCsumErrors, ignoredMulti)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data UdpStatistics = UdpStatistics{_inDatagrams :: !(P'.Maybe P'.Int64), _noPorts :: !(P'.Maybe P'.Int64),
                                   _inErrors :: !(P'.Maybe P'.Int64), _outDatagrams :: !(P'.Maybe P'.Int64),
                                   _rcvbufErrors :: !(P'.Maybe P'.Int64), _sndbufErrors :: !(P'.Maybe P'.Int64),
                                   _inCsumErrors :: !(P'.Maybe P'.Int64), _ignoredMulti :: !(P'.Maybe P'.Int64)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''UdpStatistics

instance P'.ToJSON UdpStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("inDatagrams", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inDatagrams msg))),
        ("noPorts", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (noPorts msg))),
        ("inErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inErrors msg))),
        ("outDatagrams", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outDatagrams msg))),
        ("rcvbufErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (rcvbufErrors msg))),
        ("sndbufErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (sndbufErrors msg))),
        ("inCsumErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inCsumErrors msg))),
        ("ignoredMulti", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (ignoredMulti msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON UdpStatistics where
  parseJSON
   = P'.withObject "UdpStatistics"
      (\ o ->
        do
          inDatagrams <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inDatagrams"
          noPorts <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "noPorts"
          inErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inErrors"
          outDatagrams <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outDatagrams"
          rcvbufErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "rcvbufErrors"
          sndbufErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "sndbufErrors"
          inCsumErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inCsumErrors"
          ignoredMulti <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "ignoredMulti"
          Prelude'.return
           P'.defaultValue{_inDatagrams = inDatagrams, _noPorts = noPorts, _inErrors = inErrors, _outDatagrams = outDatagrams,
                           _rcvbufErrors = rcvbufErrors, _sndbufErrors = sndbufErrors, _inCsumErrors = inCsumErrors,
                           _ignoredMulti = ignoredMulti})

instance P'.Mergeable UdpStatistics where
  mergeAppend (UdpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (UdpStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = UdpStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)

instance P'.Default UdpStatistics where
  defaultValue
   = UdpStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue

instance P'.Wire UdpStatistics where
  wireSize ft' self'@(UdpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
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
             + P'.wireSizeOpt 1 3 x'8)
  wirePutWithSize ft' self'@(UdpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 3 x'1, P'.wirePutOptWithSize 16 3 x'2, P'.wirePutOptWithSize 24 3 x'3,
             P'.wirePutOptWithSize 32 3 x'4, P'.wirePutOptWithSize 40 3 x'5, P'.wirePutOptWithSize 48 3 x'6,
             P'.wirePutOptWithSize 56 3 x'7, P'.wirePutOptWithSize 64 3 x'8]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_inDatagrams = Prelude'.Just new'Field}) (P'.wireGet 3)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_noPorts = Prelude'.Just new'Field}) (P'.wireGet 3)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_inErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_outDatagrams = Prelude'.Just new'Field}) (P'.wireGet 3)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_rcvbufErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_sndbufErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_inCsumErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_ignoredMulti = Prelude'.Just new'Field}) (P'.wireGet 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> UdpStatistics) UdpStatistics where
  getVal m' f' = f' m'

instance P'.GPB UdpStatistics

instance P'.ReflectDescriptor UdpStatistics where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56, 64])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.UdpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"UdpStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"UdpStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.InDatagrams\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"inDatagrams\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.NoPorts\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"noPorts\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.InErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"inErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.OutDatagrams\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"outDatagrams\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.RcvbufErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"rcvbufErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.SndbufErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"sndbufErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.InCsumErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"inCsumErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.UdpStatistics.IgnoredMulti\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"UdpStatistics\"], baseName' = FName \"ignoredMulti\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType UdpStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg UdpStatistics where
  textPut msg
   = do
       P'.tellT "InDatagrams" (_inDatagrams msg)
       P'.tellT "NoPorts" (_noPorts msg)
       P'.tellT "InErrors" (_inErrors msg)
       P'.tellT "OutDatagrams" (_outDatagrams msg)
       P'.tellT "RcvbufErrors" (_rcvbufErrors msg)
       P'.tellT "SndbufErrors" (_sndbufErrors msg)
       P'.tellT "InCsumErrors" (_inCsumErrors msg)
       P'.tellT "IgnoredMulti" (_ignoredMulti msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_inDatagrams, parse'_noPorts, parse'_inErrors, parse'_outDatagrams, parse'_rcvbufErrors,
                   parse'_sndbufErrors, parse'_inCsumErrors, parse'_ignoredMulti])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_inDatagrams
         = P'.try
            (do
               v <- P'.getT "InDatagrams"
               Prelude'.return (\ o -> o{_inDatagrams = v}))
        parse'_noPorts
         = P'.try
            (do
               v <- P'.getT "NoPorts"
               Prelude'.return (\ o -> o{_noPorts = v}))
        parse'_inErrors
         = P'.try
            (do
               v <- P'.getT "InErrors"
               Prelude'.return (\ o -> o{_inErrors = v}))
        parse'_outDatagrams
         = P'.try
            (do
               v <- P'.getT "OutDatagrams"
               Prelude'.return (\ o -> o{_outDatagrams = v}))
        parse'_rcvbufErrors
         = P'.try
            (do
               v <- P'.getT "RcvbufErrors"
               Prelude'.return (\ o -> o{_rcvbufErrors = v}))
        parse'_sndbufErrors
         = P'.try
            (do
               v <- P'.getT "SndbufErrors"
               Prelude'.return (\ o -> o{_sndbufErrors = v}))
        parse'_inCsumErrors
         = P'.try
            (do
               v <- P'.getT "InCsumErrors"
               Prelude'.return (\ o -> o{_inCsumErrors = v}))
        parse'_ignoredMulti
         = P'.try
            (do
               v <- P'.getT "IgnoredMulti"
               Prelude'.return (\ o -> o{_ignoredMulti = v}))