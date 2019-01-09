{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.ReadFile (ReadFile(..), path, offset, length) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data ReadFile = ReadFile{_path :: !(P'.Utf8), _offset :: !(P'.Word64), _length :: !(P'.Maybe P'.Word64)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ReadFile

instance P'.ToJSON ReadFile where
  toJSON msg
   = P'.objectNoEmpty
      ([("path", P'.toJSON (path msg)), ("offset", P'.toJSONShowWithPayload (offset msg)),
        ("length", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (length msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ReadFile where
  parseJSON
   = P'.withObject "ReadFile"
      (\ o ->
        do
          path <- P'.explicitParseField P'.parseJSON o "path"
          offset <- P'.explicitParseField (P'.parseJSONReadWithPayload "uint64") o "offset"
          length <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "length"
          Prelude'.return P'.defaultValue{_path = path, _offset = offset, _length = length})

instance P'.Mergeable ReadFile where
  mergeAppend (ReadFile x'1 x'2 x'3) (ReadFile y'1 y'2 y'3)
   = ReadFile (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default ReadFile where
  defaultValue = ReadFile P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire ReadFile where
  wireSize ft' self'@(ReadFile x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 4 x'2 + P'.wireSizeOpt 1 4 x'3)
  wirePutWithSize ft' self'@(ReadFile x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 16 4 x'2, P'.wirePutOptWithSize 24 4 x'3]
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
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_offset = new'Field}) (P'.wireGet 4)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_length = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ReadFile) ReadFile where
  getVal m' f' = f' m'

instance P'.GPB ReadFile

instance P'.ReflectDescriptor ReadFile where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16]) (P'.fromDistinctAscList [10, 16, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call.ReadFile\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReadFile\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call\",\"ReadFile.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.ReadFile.path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"ReadFile\"], baseName' = FName \"path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.ReadFile.offset\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"ReadFile\"], baseName' = FName \"offset\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.ReadFile.length\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"ReadFile\"], baseName' = FName \"length\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType ReadFile where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ReadFile where
  textPut msg
   = do
       P'.tellT "path" (_path msg)
       P'.tellT "offset" (_offset msg)
       P'.tellT "length" (_length msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_path, parse'_offset, parse'_length]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_path
         = P'.try
            (do
               v <- P'.getT "path"
               Prelude'.return (\ o -> o{_path = v}))
        parse'_offset
         = P'.try
            (do
               v <- P'.getT "offset"
               Prelude'.return (\ o -> o{_offset = v}))
        parse'_length
         = P'.try
            (do
               v <- P'.getT "length"
               Prelude'.return (\ o -> o{_length = v}))