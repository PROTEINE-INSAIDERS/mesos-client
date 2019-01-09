{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.IpStatistics
       (IpStatistics(..), forwarding, defaultTTL, inReceives, inHdrErrors, inAddrErrors, forwDatagrams, inUnknownProtos, inDiscards,
        inDelivers, outRequests, outDiscards, outNoRoutes, reasmTimeout, reasmReqds, reasmOKs, reasmFails, fragOKs, fragFails,
        fragCreates)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data IpStatistics = IpStatistics{_forwarding :: !(P'.Maybe P'.Int64), _defaultTTL :: !(P'.Maybe P'.Int64),
                                 _inReceives :: !(P'.Maybe P'.Int64), _inHdrErrors :: !(P'.Maybe P'.Int64),
                                 _inAddrErrors :: !(P'.Maybe P'.Int64), _forwDatagrams :: !(P'.Maybe P'.Int64),
                                 _inUnknownProtos :: !(P'.Maybe P'.Int64), _inDiscards :: !(P'.Maybe P'.Int64),
                                 _inDelivers :: !(P'.Maybe P'.Int64), _outRequests :: !(P'.Maybe P'.Int64),
                                 _outDiscards :: !(P'.Maybe P'.Int64), _outNoRoutes :: !(P'.Maybe P'.Int64),
                                 _reasmTimeout :: !(P'.Maybe P'.Int64), _reasmReqds :: !(P'.Maybe P'.Int64),
                                 _reasmOKs :: !(P'.Maybe P'.Int64), _reasmFails :: !(P'.Maybe P'.Int64),
                                 _fragOKs :: !(P'.Maybe P'.Int64), _fragFails :: !(P'.Maybe P'.Int64),
                                 _fragCreates :: !(P'.Maybe P'.Int64)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''IpStatistics

instance P'.ToJSON IpStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("forwarding", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (forwarding msg))),
        ("defaultTTL", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (defaultTTL msg))),
        ("inReceives", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inReceives msg))),
        ("inHdrErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inHdrErrors msg))),
        ("inAddrErrors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inAddrErrors msg))),
        ("forwDatagrams", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (forwDatagrams msg))),
        ("inUnknownProtos", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inUnknownProtos msg))),
        ("inDiscards", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inDiscards msg))),
        ("inDelivers", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (inDelivers msg))),
        ("outRequests", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outRequests msg))),
        ("outDiscards", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outDiscards msg))),
        ("outNoRoutes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (outNoRoutes msg))),
        ("reasmTimeout", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (reasmTimeout msg))),
        ("reasmReqds", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (reasmReqds msg))),
        ("reasmOKs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (reasmOKs msg))),
        ("reasmFails", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (reasmFails msg))),
        ("fragOKs", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (fragOKs msg))),
        ("fragFails", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (fragFails msg))),
        ("fragCreates", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (fragCreates msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON IpStatistics where
  parseJSON
   = P'.withObject "IpStatistics"
      (\ o ->
        do
          forwarding <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "forwarding"
          defaultTTL <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "defaultTTL"
          inReceives <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inReceives"
          inHdrErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inHdrErrors"
          inAddrErrors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inAddrErrors"
          forwDatagrams <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "forwDatagrams"
          inUnknownProtos <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inUnknownProtos"
          inDiscards <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inDiscards"
          inDelivers <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "inDelivers"
          outRequests <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outRequests"
          outDiscards <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outDiscards"
          outNoRoutes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "outNoRoutes"
          reasmTimeout <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "reasmTimeout"
          reasmReqds <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "reasmReqds"
          reasmOKs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "reasmOKs"
          reasmFails <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "reasmFails"
          fragOKs <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "fragOKs"
          fragFails <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "fragFails"
          fragCreates <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "int64") o "fragCreates"
          Prelude'.return
           P'.defaultValue{_forwarding = forwarding, _defaultTTL = defaultTTL, _inReceives = inReceives, _inHdrErrors = inHdrErrors,
                           _inAddrErrors = inAddrErrors, _forwDatagrams = forwDatagrams, _inUnknownProtos = inUnknownProtos,
                           _inDiscards = inDiscards, _inDelivers = inDelivers, _outRequests = outRequests,
                           _outDiscards = outDiscards, _outNoRoutes = outNoRoutes, _reasmTimeout = reasmTimeout,
                           _reasmReqds = reasmReqds, _reasmOKs = reasmOKs, _reasmFails = reasmFails, _fragOKs = fragOKs,
                           _fragFails = fragFails, _fragCreates = fragCreates})

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
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_forwarding = Prelude'.Just new'Field}) (P'.wireGet 3)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_defaultTTL = Prelude'.Just new'Field}) (P'.wireGet 3)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_inReceives = Prelude'.Just new'Field}) (P'.wireGet 3)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_inHdrErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_inAddrErrors = Prelude'.Just new'Field}) (P'.wireGet 3)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_forwDatagrams = Prelude'.Just new'Field}) (P'.wireGet 3)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_inUnknownProtos = Prelude'.Just new'Field}) (P'.wireGet 3)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_inDiscards = Prelude'.Just new'Field}) (P'.wireGet 3)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_inDelivers = Prelude'.Just new'Field}) (P'.wireGet 3)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_outRequests = Prelude'.Just new'Field}) (P'.wireGet 3)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_outDiscards = Prelude'.Just new'Field}) (P'.wireGet 3)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_outNoRoutes = Prelude'.Just new'Field}) (P'.wireGet 3)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{_reasmTimeout = Prelude'.Just new'Field}) (P'.wireGet 3)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{_reasmReqds = Prelude'.Just new'Field}) (P'.wireGet 3)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_reasmOKs = Prelude'.Just new'Field}) (P'.wireGet 3)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{_reasmFails = Prelude'.Just new'Field}) (P'.wireGet 3)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{_fragOKs = Prelude'.Just new'Field}) (P'.wireGet 3)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{_fragFails = Prelude'.Just new'Field}) (P'.wireGet 3)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{_fragCreates = Prelude'.Just new'Field}) (P'.wireGet 3)
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
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.IpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"IpStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"IpStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.Forwarding\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"forwarding\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.DefaultTTL\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"defaultTTL\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InReceives\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inReceives\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InHdrErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inHdrErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InAddrErrors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inAddrErrors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ForwDatagrams\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"forwDatagrams\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InUnknownProtos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inUnknownProtos\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InDiscards\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inDiscards\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.InDelivers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"inDelivers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.OutRequests\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"outRequests\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.OutDiscards\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"outDiscards\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.OutNoRoutes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"outNoRoutes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmTimeout\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmTimeout\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmReqds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmReqds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmOKs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmOKs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.ReasmFails\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"reasmFails\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.FragOKs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"fragOKs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.FragFails\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"fragFails\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.IpStatistics.FragCreates\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"IpStatistics\"], baseName' = FName \"fragCreates\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType IpStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg IpStatistics where
  textPut msg
   = do
       P'.tellT "Forwarding" (_forwarding msg)
       P'.tellT "DefaultTTL" (_defaultTTL msg)
       P'.tellT "InReceives" (_inReceives msg)
       P'.tellT "InHdrErrors" (_inHdrErrors msg)
       P'.tellT "InAddrErrors" (_inAddrErrors msg)
       P'.tellT "ForwDatagrams" (_forwDatagrams msg)
       P'.tellT "InUnknownProtos" (_inUnknownProtos msg)
       P'.tellT "InDiscards" (_inDiscards msg)
       P'.tellT "InDelivers" (_inDelivers msg)
       P'.tellT "OutRequests" (_outRequests msg)
       P'.tellT "OutDiscards" (_outDiscards msg)
       P'.tellT "OutNoRoutes" (_outNoRoutes msg)
       P'.tellT "ReasmTimeout" (_reasmTimeout msg)
       P'.tellT "ReasmReqds" (_reasmReqds msg)
       P'.tellT "ReasmOKs" (_reasmOKs msg)
       P'.tellT "ReasmFails" (_reasmFails msg)
       P'.tellT "FragOKs" (_fragOKs msg)
       P'.tellT "FragFails" (_fragFails msg)
       P'.tellT "FragCreates" (_fragCreates msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_forwarding, parse'_defaultTTL, parse'_inReceives, parse'_inHdrErrors, parse'_inAddrErrors,
                   parse'_forwDatagrams, parse'_inUnknownProtos, parse'_inDiscards, parse'_inDelivers, parse'_outRequests,
                   parse'_outDiscards, parse'_outNoRoutes, parse'_reasmTimeout, parse'_reasmReqds, parse'_reasmOKs,
                   parse'_reasmFails, parse'_fragOKs, parse'_fragFails, parse'_fragCreates])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_forwarding
         = P'.try
            (do
               v <- P'.getT "Forwarding"
               Prelude'.return (\ o -> o{_forwarding = v}))
        parse'_defaultTTL
         = P'.try
            (do
               v <- P'.getT "DefaultTTL"
               Prelude'.return (\ o -> o{_defaultTTL = v}))
        parse'_inReceives
         = P'.try
            (do
               v <- P'.getT "InReceives"
               Prelude'.return (\ o -> o{_inReceives = v}))
        parse'_inHdrErrors
         = P'.try
            (do
               v <- P'.getT "InHdrErrors"
               Prelude'.return (\ o -> o{_inHdrErrors = v}))
        parse'_inAddrErrors
         = P'.try
            (do
               v <- P'.getT "InAddrErrors"
               Prelude'.return (\ o -> o{_inAddrErrors = v}))
        parse'_forwDatagrams
         = P'.try
            (do
               v <- P'.getT "ForwDatagrams"
               Prelude'.return (\ o -> o{_forwDatagrams = v}))
        parse'_inUnknownProtos
         = P'.try
            (do
               v <- P'.getT "InUnknownProtos"
               Prelude'.return (\ o -> o{_inUnknownProtos = v}))
        parse'_inDiscards
         = P'.try
            (do
               v <- P'.getT "InDiscards"
               Prelude'.return (\ o -> o{_inDiscards = v}))
        parse'_inDelivers
         = P'.try
            (do
               v <- P'.getT "InDelivers"
               Prelude'.return (\ o -> o{_inDelivers = v}))
        parse'_outRequests
         = P'.try
            (do
               v <- P'.getT "OutRequests"
               Prelude'.return (\ o -> o{_outRequests = v}))
        parse'_outDiscards
         = P'.try
            (do
               v <- P'.getT "OutDiscards"
               Prelude'.return (\ o -> o{_outDiscards = v}))
        parse'_outNoRoutes
         = P'.try
            (do
               v <- P'.getT "OutNoRoutes"
               Prelude'.return (\ o -> o{_outNoRoutes = v}))
        parse'_reasmTimeout
         = P'.try
            (do
               v <- P'.getT "ReasmTimeout"
               Prelude'.return (\ o -> o{_reasmTimeout = v}))
        parse'_reasmReqds
         = P'.try
            (do
               v <- P'.getT "ReasmReqds"
               Prelude'.return (\ o -> o{_reasmReqds = v}))
        parse'_reasmOKs
         = P'.try
            (do
               v <- P'.getT "ReasmOKs"
               Prelude'.return (\ o -> o{_reasmOKs = v}))
        parse'_reasmFails
         = P'.try
            (do
               v <- P'.getT "ReasmFails"
               Prelude'.return (\ o -> o{_reasmFails = v}))
        parse'_fragOKs
         = P'.try
            (do
               v <- P'.getT "FragOKs"
               Prelude'.return (\ o -> o{_fragOKs = v}))
        parse'_fragFails
         = P'.try
            (do
               v <- P'.getT "FragFails"
               Prelude'.return (\ o -> o{_fragFails = v}))
        parse'_fragCreates
         = P'.try
            (do
               v <- P'.getT "FragCreates"
               Prelude'.return (\ o -> o{_fragCreates = v}))