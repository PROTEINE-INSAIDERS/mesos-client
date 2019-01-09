{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.FileInfo (FileInfo(..), path, nlink, size, mtime, mode, uid, gid) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.TimeInfo as Protos (TimeInfo)

data FileInfo = FileInfo{_path :: !(P'.Utf8), _nlink :: !(P'.Maybe P'.Int32), _size :: !(P'.Maybe P'.Word64),
                         _mtime :: !(P'.Maybe Protos.TimeInfo), _mode :: !(P'.Maybe P'.Word32), _uid :: !(P'.Maybe P'.Utf8),
                         _gid :: !(P'.Maybe P'.Utf8)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''FileInfo

instance P'.ToJSON FileInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("path", P'.toJSON (path msg)), ("nlink", P'.toJSON (Prelude'.fmap P'.toJSON (nlink msg))),
        ("size", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (size msg))),
        ("mtime", P'.toJSON (Prelude'.fmap P'.toJSON (mtime msg))), ("mode", P'.toJSON (Prelude'.fmap P'.toJSON (mode msg))),
        ("uid", P'.toJSON (Prelude'.fmap P'.toJSON (uid msg))), ("gid", P'.toJSON (Prelude'.fmap P'.toJSON (gid msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON FileInfo where
  parseJSON
   = P'.withObject "FileInfo"
      (\ o ->
        do
          path <- P'.explicitParseField P'.parseJSON o "path"
          nlink <- P'.explicitParseFieldMaybe P'.parseJSON o "nlink"
          size <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "size"
          mtime <- P'.explicitParseFieldMaybe P'.parseJSON o "mtime"
          mode <- P'.explicitParseFieldMaybe P'.parseJSON o "mode"
          uid <- P'.explicitParseFieldMaybe P'.parseJSON o "uid"
          gid <- P'.explicitParseFieldMaybe P'.parseJSON o "gid"
          Prelude'.return
           P'.defaultValue{_path = path, _nlink = nlink, _size = size, _mtime = mtime, _mode = mode, _uid = uid, _gid = gid})

instance P'.Mergeable FileInfo where
  mergeAppend (FileInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7) (FileInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = FileInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default FileInfo where
  defaultValue
   = FileInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire FileInfo where
  wireSize ft' self'@(FileInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 4 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 9 x'7)
  wirePutWithSize ft' self'@(FileInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 16 5 x'2, P'.wirePutOptWithSize 24 4 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 40 13 x'5, P'.wirePutOptWithSize 50 9 x'6,
             P'.wirePutOptWithSize 58 9 x'7]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_path = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_nlink = Prelude'.Just new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_size = Prelude'.Just new'Field}) (P'.wireGet 4)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_mtime = P'.mergeAppend (_mtime old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_mode = Prelude'.Just new'Field}) (P'.wireGet 13)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_uid = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_gid = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> FileInfo) FileInfo where
  getVal m' f' = f' m'

instance P'.GPB FileInfo

instance P'.ReflectDescriptor FileInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 24, 34, 40, 50, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.FileInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FileInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"FileInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.nlink\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"nlink\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.size\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.mtime\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"mtime\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.mode\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.uid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"uid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FileInfo.gid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FileInfo\"], baseName' = FName \"gid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType FileInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg FileInfo where
  textPut msg
   = do
       P'.tellT "path" (_path msg)
       P'.tellT "nlink" (_nlink msg)
       P'.tellT "size" (_size msg)
       P'.tellT "mtime" (_mtime msg)
       P'.tellT "mode" (_mode msg)
       P'.tellT "uid" (_uid msg)
       P'.tellT "gid" (_gid msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_path, parse'_nlink, parse'_size, parse'_mtime, parse'_mode, parse'_uid, parse'_gid])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_path
         = P'.try
            (do
               v <- P'.getT "path"
               Prelude'.return (\ o -> o{_path = v}))
        parse'_nlink
         = P'.try
            (do
               v <- P'.getT "nlink"
               Prelude'.return (\ o -> o{_nlink = v}))
        parse'_size
         = P'.try
            (do
               v <- P'.getT "size"
               Prelude'.return (\ o -> o{_size = v}))
        parse'_mtime
         = P'.try
            (do
               v <- P'.getT "mtime"
               Prelude'.return (\ o -> o{_mtime = v}))
        parse'_mode
         = P'.try
            (do
               v <- P'.getT "mode"
               Prelude'.return (\ o -> o{_mode = v}))
        parse'_uid
         = P'.try
            (do
               v <- P'.getT "uid"
               Prelude'.return (\ o -> o{_uid = v}))
        parse'_gid
         = P'.try
            (do
               v <- P'.getT "gid"
               Prelude'.return (\ o -> o{_gid = v}))