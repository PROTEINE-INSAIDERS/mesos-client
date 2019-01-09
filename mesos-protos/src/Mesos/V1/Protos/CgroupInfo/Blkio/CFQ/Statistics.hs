{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CgroupInfo.Blkio.CFQ.Statistics
       (Statistics(..), device, sectors, time, io_serviced, io_service_bytes, io_service_time, io_wait_time, io_merged, io_queued)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CgroupInfo.Blkio.Value as Protos.CgroupInfo.Blkio (Value)
import qualified Mesos.V1.Protos.Device.Number as Protos.Device (Number)

data Statistics = Statistics{_device :: !(P'.Maybe Protos.Device.Number), _sectors :: !(P'.Maybe P'.Word64),
                             _time :: !(P'.Maybe P'.Word64), _io_serviced :: !(P'.Seq Protos.CgroupInfo.Blkio.Value),
                             _io_service_bytes :: !(P'.Seq Protos.CgroupInfo.Blkio.Value),
                             _io_service_time :: !(P'.Seq Protos.CgroupInfo.Blkio.Value),
                             _io_wait_time :: !(P'.Seq Protos.CgroupInfo.Blkio.Value),
                             _io_merged :: !(P'.Seq Protos.CgroupInfo.Blkio.Value),
                             _io_queued :: !(P'.Seq Protos.CgroupInfo.Blkio.Value)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Statistics

instance P'.ToJSON Statistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("device", P'.toJSON (Prelude'.fmap P'.toJSON (device msg))),
        ("sectors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (sectors msg))),
        ("time", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (time msg))),
        ("io_serviced", P'.toJSON (Prelude'.fmap P'.toJSON (io_serviced msg))),
        ("io_service_bytes", P'.toJSON (Prelude'.fmap P'.toJSON (io_service_bytes msg))),
        ("io_service_time", P'.toJSON (Prelude'.fmap P'.toJSON (io_service_time msg))),
        ("io_wait_time", P'.toJSON (Prelude'.fmap P'.toJSON (io_wait_time msg))),
        ("io_merged", P'.toJSON (Prelude'.fmap P'.toJSON (io_merged msg))),
        ("io_queued", P'.toJSON (Prelude'.fmap P'.toJSON (io_queued msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Statistics where
  parseJSON
   = P'.withObject "Statistics"
      (\ o ->
        do
          device <- P'.explicitParseFieldMaybe P'.parseJSON o "device"
          sectors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "sectors"
          time <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "time"
          io_serviced <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                          (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "io_serviced")
          io_service_bytes <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                               (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "io_service_bytes")
          io_service_time <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                              (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "io_service_time")
          io_wait_time <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "io_wait_time")
          io_merged <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "io_merged")
          io_queued <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "io_queued")
          Prelude'.return
           P'.defaultValue{_device = device, _sectors = sectors, _time = time, _io_serviced = io_serviced,
                           _io_service_bytes = io_service_bytes, _io_service_time = io_service_time, _io_wait_time = io_wait_time,
                           _io_merged = io_merged, _io_queued = io_queued})

instance P'.Mergeable Statistics where
  mergeAppend (Statistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (Statistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = Statistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)

instance P'.Default Statistics where
  defaultValue
   = Statistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Statistics where
  wireSize ft' self'@(Statistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 4 x'2 + P'.wireSizeOpt 1 4 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeRep 1 11 x'5
             + P'.wireSizeRep 1 11 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeRep 1 11 x'9)
  wirePutWithSize ft' self'@(Statistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 16 4 x'2, P'.wirePutOptWithSize 24 4 x'3,
             P'.wirePutRepWithSize 34 11 x'4, P'.wirePutRepWithSize 42 11 x'5, P'.wirePutRepWithSize 50 11 x'6,
             P'.wirePutRepWithSize 58 11 x'7, P'.wirePutRepWithSize 66 11 x'8, P'.wirePutRepWithSize 74 11 x'9]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_device = P'.mergeAppend (_device old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_sectors = Prelude'.Just new'Field}) (P'.wireGet 4)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_time = Prelude'.Just new'Field}) (P'.wireGet 4)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_io_serviced = P'.append (_io_serviced old'Self) new'Field})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_io_service_bytes = P'.append (_io_service_bytes old'Self) new'Field})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_io_service_time = P'.append (_io_service_time old'Self) new'Field})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_io_wait_time = P'.append (_io_wait_time old'Self) new'Field})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_io_merged = P'.append (_io_merged old'Self) new'Field}) (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_io_queued = P'.append (_io_queued old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Statistics) Statistics where
  getVal m' f' = f' m'

instance P'.GPB Statistics

instance P'.ReflectDescriptor Statistics where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24, 34, 42, 50, 58, 66, 74])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\"], baseName = MName \"Statistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CgroupInfo\",\"Blkio\",\"CFQ\",\"Statistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.device\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"device\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Device.Number\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Device\"], baseName = MName \"Number\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.sectors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"sectors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.io_serviced\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"io_serviced\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.io_service_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"io_service_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.io_service_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"io_service_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.io_wait_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"io_wait_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.io_merged\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"io_merged\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics.io_queued\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\",MName \"Statistics\"], baseName' = FName \"io_queued\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Statistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Statistics where
  textPut msg
   = do
       P'.tellT "device" (_device msg)
       P'.tellT "sectors" (_sectors msg)
       P'.tellT "time" (_time msg)
       P'.tellT "io_serviced" (_io_serviced msg)
       P'.tellT "io_service_bytes" (_io_service_bytes msg)
       P'.tellT "io_service_time" (_io_service_time msg)
       P'.tellT "io_wait_time" (_io_wait_time msg)
       P'.tellT "io_merged" (_io_merged msg)
       P'.tellT "io_queued" (_io_queued msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_device, parse'_sectors, parse'_time, parse'_io_serviced, parse'_io_service_bytes, parse'_io_service_time,
                   parse'_io_wait_time, parse'_io_merged, parse'_io_queued])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_device
         = P'.try
            (do
               v <- P'.getT "device"
               Prelude'.return (\ o -> o{_device = v}))
        parse'_sectors
         = P'.try
            (do
               v <- P'.getT "sectors"
               Prelude'.return (\ o -> o{_sectors = v}))
        parse'_time
         = P'.try
            (do
               v <- P'.getT "time"
               Prelude'.return (\ o -> o{_time = v}))
        parse'_io_serviced
         = P'.try
            (do
               v <- P'.getT "io_serviced"
               Prelude'.return (\ o -> o{_io_serviced = P'.append (_io_serviced o) v}))
        parse'_io_service_bytes
         = P'.try
            (do
               v <- P'.getT "io_service_bytes"
               Prelude'.return (\ o -> o{_io_service_bytes = P'.append (_io_service_bytes o) v}))
        parse'_io_service_time
         = P'.try
            (do
               v <- P'.getT "io_service_time"
               Prelude'.return (\ o -> o{_io_service_time = P'.append (_io_service_time o) v}))
        parse'_io_wait_time
         = P'.try
            (do
               v <- P'.getT "io_wait_time"
               Prelude'.return (\ o -> o{_io_wait_time = P'.append (_io_wait_time o) v}))
        parse'_io_merged
         = P'.try
            (do
               v <- P'.getT "io_merged"
               Prelude'.return (\ o -> o{_io_merged = P'.append (_io_merged o) v}))
        parse'_io_queued
         = P'.try
            (do
               v <- P'.getT "io_queued"
               Prelude'.return (\ o -> o{_io_queued = P'.append (_io_queued o) v}))