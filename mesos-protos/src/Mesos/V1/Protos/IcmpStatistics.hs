{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.IcmpStatistics
       (IcmpStatistics(..), inMsgs, inErrors, inCsumErrors, inDestUnreachs, inTimeExcds, inParmProbs, inSrcQuenchs, inRedirects,
        inEchos, inEchoReps, inTimestamps, inTimestampReps, inAddrMasks, inAddrMaskReps, outMsgs, outErrors, outDestUnreachs,
        outTimeExcds, outParmProbs, outSrcQuenchs, outRedirects, outEchos, outEchoReps, outTimestamps, outTimestampReps,
        outAddrMasks, outAddrMaskReps)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data IcmpStatistics = IcmpStatistics{_inMsgs :: !(P'.Maybe P'.Int64), _inErrors :: !(P'.Maybe P'.Int64),
                                     _inCsumErrors :: !(P'.Maybe P'.Int64), _inDestUnreachs :: !(P'.Maybe P'.Int64),
                                     _inTimeExcds :: !(P'.Maybe P'.Int64), _inParmProbs :: !(P'.Maybe P'.Int64),
                                     _inSrcQuenchs :: !(P'.Maybe P'.Int64), _inRedirects :: !(P'.Maybe P'.Int64),
                                     _inEchos :: !(P'.Maybe P'.Int64), _inEchoReps :: !(P'.Maybe P'.Int64),
                                     _inTimestamps :: !(P'.Maybe P'.Int64), _inTimestampReps :: !(P'.Maybe P'.Int64),
                                     _inAddrMasks :: !(P'.Maybe P'.Int64), _inAddrMaskReps :: !(P'.Maybe P'.Int64),
                                     _outMsgs :: !(P'.Maybe P'.Int64), _outErrors :: !(P'.Maybe P'.Int64),
                                     _outDestUnreachs :: !(P'.Maybe P'.Int64), _outTimeExcds :: !(P'.Maybe P'.Int64),
                                     _outParmProbs :: !(P'.Maybe P'.Int64), _outSrcQuenchs :: !(P'.Maybe P'.Int64),
                                     _outRedirects :: !(P'.Maybe P'.Int64), _outEchos :: !(P'.Maybe P'.Int64),
                                     _outEchoReps :: !(P'.Maybe P'.Int64), _outTimestamps :: !(P'.Maybe P'.Int64),
                                     _outTimestampReps :: !(P'.Maybe P'.Int64), _outAddrMasks :: !(P'.Maybe P'.Int64),
                                     _outAddrMaskReps :: !(P'.Maybe P'.Int64)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''IcmpStatistics

instance P'.ToJSON IcmpStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("inMsgs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inMsgs msg))),
        ("inErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inErrors msg))),
        ("inCsumErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inCsumErrors msg))),
        ("inDestUnreachs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inDestUnreachs msg))),
        ("inTimeExcds", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inTimeExcds msg))),
        ("inParmProbs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inParmProbs msg))),
        ("inSrcQuenchs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inSrcQuenchs msg))),
        ("inRedirects", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inRedirects msg))),
        ("inEchos", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inEchos msg))),
        ("inEchoReps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inEchoReps msg))),
        ("inTimestamps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inTimestamps msg))),
        ("inTimestampReps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inTimestampReps msg))),
        ("inAddrMasks", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inAddrMasks msg))),
        ("inAddrMaskReps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inAddrMaskReps msg))),
        ("outMsgs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outMsgs msg))),
        ("outErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outErrors msg))),
        ("outDestUnreachs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outDestUnreachs msg))),
        ("outTimeExcds", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outTimeExcds msg))),
        ("outParmProbs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outParmProbs msg))),
        ("outSrcQuenchs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outSrcQuenchs msg))),
        ("outRedirects", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outRedirects msg))),
        ("outEchos", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outEchos msg))),
        ("outEchoReps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outEchoReps msg))),
        ("outTimestamps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outTimestamps msg))),
        ("outTimestampReps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outTimestampReps msg))),
        ("outAddrMasks", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outAddrMasks msg))),
        ("outAddrMaskReps", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outAddrMaskReps msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON IcmpStatistics where
  parseJSON
   = P'.withObject "IcmpStatistics"
      (\ o ->
        do
          inMsgs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inMsgs"
          inErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inErrors"
          inCsumErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inCsumErrors"
          inDestUnreachs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inDestUnreachs"
          inTimeExcds <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inTimeExcds"
          inParmProbs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inParmProbs"
          inSrcQuenchs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inSrcQuenchs"
          inRedirects <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inRedirects"
          inEchos <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inEchos"
          inEchoReps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inEchoReps"
          inTimestamps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inTimestamps"
          inTimestampReps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inTimestampReps"
          inAddrMasks <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inAddrMasks"
          inAddrMaskReps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inAddrMaskReps"
          outMsgs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outMsgs"
          outErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outErrors"
          outDestUnreachs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outDestUnreachs"
          outTimeExcds <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outTimeExcds"
          outParmProbs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outParmProbs"
          outSrcQuenchs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outSrcQuenchs"
          outRedirects <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outRedirects"
          outEchos <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outEchos"
          outEchoReps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outEchoReps"
          outTimestamps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outTimestamps"
          outTimestampReps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outTimestampReps"
          outAddrMasks <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outAddrMasks"
          outAddrMaskReps <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outAddrMaskReps"
          Prelude'.return
           P'.defaultValue{_inMsgs = inMsgs, _inErrors = inErrors, _inCsumErrors = inCsumErrors, _inDestUnreachs = inDestUnreachs,
                           _inTimeExcds = inTimeExcds, _inParmProbs = inParmProbs, _inSrcQuenchs = inSrcQuenchs,
                           _inRedirects = inRedirects, _inEchos = inEchos, _inEchoReps = inEchoReps, _inTimestamps = inTimestamps,
                           _inTimestampReps = inTimestampReps, _inAddrMasks = inAddrMasks, _inAddrMaskReps = inAddrMaskReps,
                           _outMsgs = outMsgs, _outErrors = outErrors, _outDestUnreachs = outDestUnreachs,
                           _outTimeExcds = outTimeExcds, _outParmProbs = outParmProbs, _outSrcQuenchs = outSrcQuenchs,
                           _outRedirects = outRedirects, _outEchos = outEchos, _outEchoReps = outEchoReps,
                           _outTimestamps = outTimestamps, _outTimestampReps = outTimestampReps, _outAddrMasks = outAddrMasks,
                           _outAddrMaskReps = outAddrMaskReps})

instance P'.Mergeable IcmpStatistics where
  mergeAppend
   (IcmpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
     x'25 x'26 x'27)
   (IcmpStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24
     y'25 y'26 y'27)
   = IcmpStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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
      (P'.mergeAppend x'20 y'20)
      (P'.mergeAppend x'21 y'21)
      (P'.mergeAppend x'22 y'22)
      (P'.mergeAppend x'23 y'23)
      (P'.mergeAppend x'24 y'24)
      (P'.mergeAppend x'25 y'25)
      (P'.mergeAppend x'26 y'26)
      (P'.mergeAppend x'27 y'27)

instance P'.Default IcmpStatistics where
  defaultValue
   = IcmpStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
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
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire IcmpStatistics where
  wireSize ft'
   self'@(IcmpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27)
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
             + P'.wireSizeOpt 2 3 x'19
             + P'.wireSizeOpt 2 3 x'20
             + P'.wireSizeOpt 2 3 x'21
             + P'.wireSizeOpt 2 3 x'22
             + P'.wireSizeOpt 2 3 x'23
             + P'.wireSizeOpt 2 3 x'24
             + P'.wireSizeOpt 2 3 x'25
             + P'.wireSizeOpt 2 3 x'26
             + P'.wireSizeOpt 2 3 x'27)
  wirePutWithSize ft'
   self'@(IcmpStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27)
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
             P'.wirePutOptWithSize 152 3 x'19, P'.wirePutOptWithSize 160 3 x'20, P'.wirePutOptWithSize 168 3 x'21,
             P'.wirePutOptWithSize 176 3 x'22, P'.wirePutOptWithSize 184 3 x'23, P'.wirePutOptWithSize 192 3 x'24,
             P'.wirePutOptWithSize 200 3 x'25, P'.wirePutOptWithSize 208 3 x'26, P'.wirePutOptWithSize 216 3 x'27]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_inMsgs = Prelude'.Just new'Field}) (P'.wireGet 3)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_inErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_inCsumErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_inDestUnreachs = Prelude'.Just new'Field}) (P'.wireGet 3)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_inTimeExcds = Prelude'.Just new'Field}) (P'.wireGet 3)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_inParmProbs = Prelude'.Just new'Field}) (P'.wireGet 3)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_inSrcQuenchs = Prelude'.Just new'Field}) (P'.wireGet 3)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_inRedirects = Prelude'.Just new'Field}) (P'.wireGet 3)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_inEchos = Prelude'.Just new'Field}) (P'.wireGet 3)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_inEchoReps = Prelude'.Just new'Field}) (P'.wireGet 3)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_inTimestamps = Prelude'.Just new'Field}) (P'.wireGet 3)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_inTimestampReps = Prelude'.Just new'Field}) (P'.wireGet 3)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{_inAddrMasks = Prelude'.Just new'Field}) (P'.wireGet 3)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{_inAddrMaskReps = Prelude'.Just new'Field}) (P'.wireGet 3)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_outMsgs = Prelude'.Just new'Field}) (P'.wireGet 3)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{_outErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{_outDestUnreachs = Prelude'.Just new'Field}) (P'.wireGet 3)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{_outTimeExcds = Prelude'.Just new'Field}) (P'.wireGet 3)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{_outParmProbs = Prelude'.Just new'Field}) (P'.wireGet 3)
             160 -> Prelude'.fmap (\ !new'Field -> old'Self{_outSrcQuenchs = Prelude'.Just new'Field}) (P'.wireGet 3)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{_outRedirects = Prelude'.Just new'Field}) (P'.wireGet 3)
             176 -> Prelude'.fmap (\ !new'Field -> old'Self{_outEchos = Prelude'.Just new'Field}) (P'.wireGet 3)
             184 -> Prelude'.fmap (\ !new'Field -> old'Self{_outEchoReps = Prelude'.Just new'Field}) (P'.wireGet 3)
             192 -> Prelude'.fmap (\ !new'Field -> old'Self{_outTimestamps = Prelude'.Just new'Field}) (P'.wireGet 3)
             200 -> Prelude'.fmap (\ !new'Field -> old'Self{_outTimestampReps = Prelude'.Just new'Field}) (P'.wireGet 3)
             208 -> Prelude'.fmap (\ !new'Field -> old'Self{_outAddrMasks = Prelude'.Just new'Field}) (P'.wireGet 3)
             216 -> Prelude'.fmap (\ !new'Field -> old'Self{_outAddrMaskReps = Prelude'.Just new'Field}) (P'.wireGet 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> IcmpStatistics) IcmpStatistics where
  getVal m' f' = f' m'

instance P'.GPB IcmpStatistics

instance P'.ReflectDescriptor IcmpStatistics where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.IcmpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"IcmpStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"IcmpStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InMsgs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inMsgs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InCsumErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inCsumErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InDestUnreachs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inDestUnreachs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InTimeExcds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inTimeExcds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InParmProbs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inParmProbs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InSrcQuenchs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inSrcQuenchs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InRedirects\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inRedirects\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InEchos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inEchos\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InEchoReps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inEchoReps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InTimestamps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inTimestamps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InTimestampReps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inTimestampReps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InAddrMasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inAddrMasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.InAddrMaskReps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"inAddrMaskReps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutMsgs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outMsgs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutDestUnreachs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outDestUnreachs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutTimeExcds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outTimeExcds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutParmProbs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outParmProbs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutSrcQuenchs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outSrcQuenchs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 160}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutRedirects\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outRedirects\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutEchos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outEchos\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 176}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutEchoReps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outEchoReps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 184}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutTimestamps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outTimestamps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 192}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutTimestampReps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outTimestampReps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 25}, wireTag = WireTag {getWireTag = 200}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutAddrMasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outAddrMasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 208}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IcmpStatistics.OutAddrMaskReps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IcmpStatistics\"], baseName' = FName \"outAddrMaskReps\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 216}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType IcmpStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg IcmpStatistics where
  textPut msg
   = do
       P'.tellT "InMsgs" (_inMsgs msg)
       P'.tellT "InErrors" (_inErrors msg)
       P'.tellT "InCsumErrors" (_inCsumErrors msg)
       P'.tellT "InDestUnreachs" (_inDestUnreachs msg)
       P'.tellT "InTimeExcds" (_inTimeExcds msg)
       P'.tellT "InParmProbs" (_inParmProbs msg)
       P'.tellT "InSrcQuenchs" (_inSrcQuenchs msg)
       P'.tellT "InRedirects" (_inRedirects msg)
       P'.tellT "InEchos" (_inEchos msg)
       P'.tellT "InEchoReps" (_inEchoReps msg)
       P'.tellT "InTimestamps" (_inTimestamps msg)
       P'.tellT "InTimestampReps" (_inTimestampReps msg)
       P'.tellT "InAddrMasks" (_inAddrMasks msg)
       P'.tellT "InAddrMaskReps" (_inAddrMaskReps msg)
       P'.tellT "OutMsgs" (_outMsgs msg)
       P'.tellT "OutErrors" (_outErrors msg)
       P'.tellT "OutDestUnreachs" (_outDestUnreachs msg)
       P'.tellT "OutTimeExcds" (_outTimeExcds msg)
       P'.tellT "OutParmProbs" (_outParmProbs msg)
       P'.tellT "OutSrcQuenchs" (_outSrcQuenchs msg)
       P'.tellT "OutRedirects" (_outRedirects msg)
       P'.tellT "OutEchos" (_outEchos msg)
       P'.tellT "OutEchoReps" (_outEchoReps msg)
       P'.tellT "OutTimestamps" (_outTimestamps msg)
       P'.tellT "OutTimestampReps" (_outTimestampReps msg)
       P'.tellT "OutAddrMasks" (_outAddrMasks msg)
       P'.tellT "OutAddrMaskReps" (_outAddrMaskReps msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_inMsgs, parse'_inErrors, parse'_inCsumErrors, parse'_inDestUnreachs, parse'_inTimeExcds,
                   parse'_inParmProbs, parse'_inSrcQuenchs, parse'_inRedirects, parse'_inEchos, parse'_inEchoReps,
                   parse'_inTimestamps, parse'_inTimestampReps, parse'_inAddrMasks, parse'_inAddrMaskReps, parse'_outMsgs,
                   parse'_outErrors, parse'_outDestUnreachs, parse'_outTimeExcds, parse'_outParmProbs, parse'_outSrcQuenchs,
                   parse'_outRedirects, parse'_outEchos, parse'_outEchoReps, parse'_outTimestamps, parse'_outTimestampReps,
                   parse'_outAddrMasks, parse'_outAddrMaskReps])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_inMsgs
         = P'.try
            (do
               v <- P'.getT "InMsgs"
               Prelude'.return (\ o -> o{_inMsgs = v}))
        parse'_inErrors
         = P'.try
            (do
               v <- P'.getT "InErrors"
               Prelude'.return (\ o -> o{_inErrors = v}))
        parse'_inCsumErrors
         = P'.try
            (do
               v <- P'.getT "InCsumErrors"
               Prelude'.return (\ o -> o{_inCsumErrors = v}))
        parse'_inDestUnreachs
         = P'.try
            (do
               v <- P'.getT "InDestUnreachs"
               Prelude'.return (\ o -> o{_inDestUnreachs = v}))
        parse'_inTimeExcds
         = P'.try
            (do
               v <- P'.getT "InTimeExcds"
               Prelude'.return (\ o -> o{_inTimeExcds = v}))
        parse'_inParmProbs
         = P'.try
            (do
               v <- P'.getT "InParmProbs"
               Prelude'.return (\ o -> o{_inParmProbs = v}))
        parse'_inSrcQuenchs
         = P'.try
            (do
               v <- P'.getT "InSrcQuenchs"
               Prelude'.return (\ o -> o{_inSrcQuenchs = v}))
        parse'_inRedirects
         = P'.try
            (do
               v <- P'.getT "InRedirects"
               Prelude'.return (\ o -> o{_inRedirects = v}))
        parse'_inEchos
         = P'.try
            (do
               v <- P'.getT "InEchos"
               Prelude'.return (\ o -> o{_inEchos = v}))
        parse'_inEchoReps
         = P'.try
            (do
               v <- P'.getT "InEchoReps"
               Prelude'.return (\ o -> o{_inEchoReps = v}))
        parse'_inTimestamps
         = P'.try
            (do
               v <- P'.getT "InTimestamps"
               Prelude'.return (\ o -> o{_inTimestamps = v}))
        parse'_inTimestampReps
         = P'.try
            (do
               v <- P'.getT "InTimestampReps"
               Prelude'.return (\ o -> o{_inTimestampReps = v}))
        parse'_inAddrMasks
         = P'.try
            (do
               v <- P'.getT "InAddrMasks"
               Prelude'.return (\ o -> o{_inAddrMasks = v}))
        parse'_inAddrMaskReps
         = P'.try
            (do
               v <- P'.getT "InAddrMaskReps"
               Prelude'.return (\ o -> o{_inAddrMaskReps = v}))
        parse'_outMsgs
         = P'.try
            (do
               v <- P'.getT "OutMsgs"
               Prelude'.return (\ o -> o{_outMsgs = v}))
        parse'_outErrors
         = P'.try
            (do
               v <- P'.getT "OutErrors"
               Prelude'.return (\ o -> o{_outErrors = v}))
        parse'_outDestUnreachs
         = P'.try
            (do
               v <- P'.getT "OutDestUnreachs"
               Prelude'.return (\ o -> o{_outDestUnreachs = v}))
        parse'_outTimeExcds
         = P'.try
            (do
               v <- P'.getT "OutTimeExcds"
               Prelude'.return (\ o -> o{_outTimeExcds = v}))
        parse'_outParmProbs
         = P'.try
            (do
               v <- P'.getT "OutParmProbs"
               Prelude'.return (\ o -> o{_outParmProbs = v}))
        parse'_outSrcQuenchs
         = P'.try
            (do
               v <- P'.getT "OutSrcQuenchs"
               Prelude'.return (\ o -> o{_outSrcQuenchs = v}))
        parse'_outRedirects
         = P'.try
            (do
               v <- P'.getT "OutRedirects"
               Prelude'.return (\ o -> o{_outRedirects = v}))
        parse'_outEchos
         = P'.try
            (do
               v <- P'.getT "OutEchos"
               Prelude'.return (\ o -> o{_outEchos = v}))
        parse'_outEchoReps
         = P'.try
            (do
               v <- P'.getT "OutEchoReps"
               Prelude'.return (\ o -> o{_outEchoReps = v}))
        parse'_outTimestamps
         = P'.try
            (do
               v <- P'.getT "OutTimestamps"
               Prelude'.return (\ o -> o{_outTimestamps = v}))
        parse'_outTimestampReps
         = P'.try
            (do
               v <- P'.getT "OutTimestampReps"
               Prelude'.return (\ o -> o{_outTimestampReps = v}))
        parse'_outAddrMasks
         = P'.try
            (do
               v <- P'.getT "OutAddrMasks"
               Prelude'.return (\ o -> o{_outAddrMasks = v}))
        parse'_outAddrMaskReps
         = P'.try
            (do
               v <- P'.getT "OutAddrMaskReps"
               Prelude'.return (\ o -> o{_outAddrMaskReps = v}))