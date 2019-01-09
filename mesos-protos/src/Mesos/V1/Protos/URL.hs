{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.URL (URL(..), scheme, address, path, query, fragment) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Address as Protos (Address)
import qualified Mesos.V1.Protos.Parameter as Protos (Parameter)

data URL = URL{_scheme :: !(P'.Utf8), _address :: !(Protos.Address), _path :: !(P'.Maybe P'.Utf8),
               _query :: !(P'.Seq Protos.Parameter), _fragment :: !(P'.Maybe P'.Utf8)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''URL

instance P'.ToJSON URL where
  toJSON msg
   = P'.objectNoEmpty
      ([("scheme", P'.toJSON (scheme msg)), ("address", P'.toJSON (address msg)),
        ("path", P'.toJSON (Prelude'.fmap P'.toJSON (path msg))), ("query", P'.toJSON (Prelude'.fmap P'.toJSON (query msg))),
        ("fragment", P'.toJSON (Prelude'.fmap P'.toJSON (fragment msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON URL where
  parseJSON
   = P'.withObject "URL"
      (\ o ->
        do
          scheme <- P'.explicitParseField P'.parseJSON o "scheme"
          address <- P'.explicitParseField P'.parseJSON o "address"
          path <- P'.explicitParseFieldMaybe P'.parseJSON o "path"
          query <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "query")
          fragment <- P'.explicitParseFieldMaybe P'.parseJSON o "fragment"
          Prelude'.return P'.defaultValue{_scheme = scheme, _address = address, _path = path, _query = query, _fragment = fragment})

instance P'.Mergeable URL where
  mergeAppend (URL x'1 x'2 x'3 x'4 x'5) (URL y'1 y'2 y'3 y'4 y'5)
   = URL (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default URL where
  defaultValue = URL P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire URL where
  wireSize ft' self'@(URL x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeOpt 1 9 x'5)
  wirePutWithSize ft' self'@(URL x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutOptWithSize 26 9 x'3,
             P'.wirePutRepWithSize 34 11 x'4, P'.wirePutOptWithSize 42 9 x'5]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_scheme = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_address = P'.mergeAppend (_address old'Self) (new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_path = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_query = P'.append (_query old'Self) new'Field}) (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_fragment = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> URL) URL where
  getVal m' f' = f' m'

instance P'.GPB URL

instance P'.ReflectDescriptor URL where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18, 26, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.URL\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"URL\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"URL.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.URL.scheme\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"URL\"], baseName' = FName \"scheme\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.URL.address\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"URL\"], baseName' = FName \"address\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Address\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Address\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.URL.path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"URL\"], baseName' = FName \"path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.URL.query\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"URL\"], baseName' = FName \"query\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Parameter\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Parameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.URL.fragment\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"URL\"], baseName' = FName \"fragment\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType URL where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg URL where
  textPut msg
   = do
       P'.tellT "scheme" (_scheme msg)
       P'.tellT "address" (_address msg)
       P'.tellT "path" (_path msg)
       P'.tellT "query" (_query msg)
       P'.tellT "fragment" (_fragment msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_scheme, parse'_address, parse'_path, parse'_query, parse'_fragment]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_scheme
         = P'.try
            (do
               v <- P'.getT "scheme"
               Prelude'.return (\ o -> o{_scheme = v}))
        parse'_address
         = P'.try
            (do
               v <- P'.getT "address"
               Prelude'.return (\ o -> o{_address = v}))
        parse'_path
         = P'.try
            (do
               v <- P'.getT "path"
               Prelude'.return (\ o -> o{_path = v}))
        parse'_query
         = P'.try
            (do
               v <- P'.getT "query"
               Prelude'.return (\ o -> o{_query = P'.append (_query o) v}))
        parse'_fragment
         = P'.try
            (do
               v <- P'.getT "fragment"
               Prelude'.return (\ o -> o{_fragment = v}))