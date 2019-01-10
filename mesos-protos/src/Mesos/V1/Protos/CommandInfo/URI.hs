{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CommandInfo.URI (URI(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data URI = URI{value :: !(P'.Utf8), executable :: !(P'.Maybe P'.Bool), extract :: !(P'.Maybe P'.Bool), cache :: !(P'.Maybe P'.Bool),
               output_file :: !(P'.Maybe P'.Utf8)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON URI where
  toJSON msg
   = P'.objectNoEmpty
      ([("value", P'.toJSON (value msg)), ("executable", P'.toJSON (Prelude'.fmap P'.toJSON (executable msg))),
        ("extract", P'.toJSON (Prelude'.fmap P'.toJSON (extract msg))), ("cache", P'.toJSON (Prelude'.fmap P'.toJSON (cache msg))),
        ("output_file", P'.toJSON (Prelude'.fmap P'.toJSON (output_file msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON URI where
  parseJSON
   = P'.withObject "URI"
      (\ o ->
        do
          value <- P'.explicitParseField P'.parseJSON o "value"
          executable <- P'.explicitParseFieldMaybe P'.parseJSONBool o "executable"
          extract <- do
                       tmp <- P'.explicitParseFieldMaybe P'.parseJSONBool o "extract"
                       Prelude'.return (Prelude'.maybe (Prelude'.Just (Prelude'.True)) Prelude'.Just tmp)
          cache <- P'.explicitParseFieldMaybe P'.parseJSONBool o "cache"
          output_file <- P'.explicitParseFieldMaybe P'.parseJSON o "output_file"
          Prelude'.return
           P'.defaultValue{value = value, executable = executable, extract = extract, cache = cache, output_file = output_file})

instance P'.Mergeable URI where
  mergeAppend (URI x'1 x'2 x'3 x'4 x'5) (URI y'1 y'2 y'3 y'4 y'5)
   = URI (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default URI where
  defaultValue = URI P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.True) P'.defaultValue P'.defaultValue

instance P'.Wire URI where
  wireSize ft' self'@(URI x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 8 x'3 + P'.wireSizeOpt 1 8 x'4 +
             P'.wireSizeOpt 1 9 x'5)
  wirePutWithSize ft' self'@(URI x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 16 8 x'2, P'.wirePutOptWithSize 24 8 x'3,
             P'.wirePutOptWithSize 32 8 x'4, P'.wirePutOptWithSize 42 9 x'5]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{value = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{executable = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{extract = Prelude'.Just new'Field}) (P'.wireGet 8)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{cache = Prelude'.Just new'Field}) (P'.wireGet 8)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{output_file = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> URI) URI where
  getVal m' f' = f' m'

instance P'.GPB URI

instance P'.ReflectDescriptor URI where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 24, 32, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CommandInfo.URI\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CommandInfo\"], baseName = MName \"URI\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CommandInfo\",\"URI.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CommandInfo.URI.value\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CommandInfo\",MName \"URI\"], baseName' = FName \"value\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CommandInfo.URI.executable\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CommandInfo\",MName \"URI\"], baseName' = FName \"executable\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CommandInfo.URI.extract\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CommandInfo\",MName \"URI\"], baseName' = FName \"extract\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CommandInfo.URI.cache\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CommandInfo\",MName \"URI\"], baseName' = FName \"cache\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CommandInfo.URI.output_file\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CommandInfo\",MName \"URI\"], baseName' = FName \"output_file\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType URI where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg URI where
  textPut msg
   = do
       P'.tellT "value" (value msg)
       P'.tellT "executable" (executable msg)
       P'.tellT "extract" (extract msg)
       P'.tellT "cache" (cache msg)
       P'.tellT "output_file" (output_file msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'value, parse'executable, parse'extract, parse'cache, parse'output_file]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{value = v}))
        parse'executable
         = P'.try
            (do
               v <- P'.getT "executable"
               Prelude'.return (\ o -> o{executable = v}))
        parse'extract
         = P'.try
            (do
               v <- P'.getT "extract"
               Prelude'.return (\ o -> o{extract = v}))
        parse'cache
         = P'.try
            (do
               v <- P'.getT "cache"
               Prelude'.return (\ o -> o{cache = v}))
        parse'output_file
         = P'.try
            (do
               v <- P'.getT "output_file"
               Prelude'.return (\ o -> o{output_file = v}))