{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.HealthCheck.HTTPCheckInfo (HTTPCheckInfo(..), protocol, scheme, port, path, statuses) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.NetworkInfo.Protocol as Protos.NetworkInfo (Protocol)

data HTTPCheckInfo = HTTPCheckInfo{_protocol :: !(P'.Maybe Protos.NetworkInfo.Protocol), _scheme :: !(P'.Maybe P'.Utf8),
                                   _port :: !(P'.Word32), _path :: !(P'.Maybe P'.Utf8), _statuses :: !(P'.Seq P'.Word32)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''HTTPCheckInfo

instance P'.ToJSON HTTPCheckInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("protocol", P'.toJSON (Prelude'.fmap P'.toJSON (protocol msg))),
        ("scheme", P'.toJSON (Prelude'.fmap P'.toJSON (scheme msg))), ("port", P'.toJSON (port msg)),
        ("path", P'.toJSON (Prelude'.fmap P'.toJSON (path msg))), ("statuses", P'.toJSON (Prelude'.fmap P'.toJSON (statuses msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON HTTPCheckInfo where
  parseJSON
   = P'.withObject "HTTPCheckInfo"
      (\ o ->
        do
          protocol <- do
                        tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "protocol"
                        Prelude'.return (Prelude'.maybe (Prelude'.Just ((Prelude'.read "IPv4"))) Prelude'.Just tmp)
          scheme <- P'.explicitParseFieldMaybe P'.parseJSON o "scheme"
          port <- P'.explicitParseField P'.parseJSON o "port"
          path <- P'.explicitParseFieldMaybe P'.parseJSON o "path"
          statuses <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                       (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "statuses")
          Prelude'.return P'.defaultValue{_protocol = protocol, _scheme = scheme, _port = port, _path = path, _statuses = statuses})

instance P'.Mergeable HTTPCheckInfo where
  mergeAppend (HTTPCheckInfo x'1 x'2 x'3 x'4 x'5) (HTTPCheckInfo y'1 y'2 y'3 y'4 y'5)
   = HTTPCheckInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default HTTPCheckInfo where
  defaultValue
   = HTTPCheckInfo (Prelude'.Just (Prelude'.read "IPv4")) P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire HTTPCheckInfo where
  wireSize ft' self'@(HTTPCheckInfo x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeReq 1 13 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeRep 1 13 x'5)
  wirePutWithSize ft' self'@(HTTPCheckInfo x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 8 13 x'3, P'.wirePutOptWithSize 18 9 x'4, P'.wirePutOptWithSize 26 9 x'2,
             P'.wirePutRepWithSize 32 13 x'5, P'.wirePutOptWithSize 40 14 x'1]
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
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_protocol = Prelude'.Just new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_scheme = Prelude'.Just new'Field}) (P'.wireGet 9)
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_port = new'Field}) (P'.wireGet 13)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_path = Prelude'.Just new'Field}) (P'.wireGet 9)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_statuses = P'.append (_statuses old'Self) new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_statuses = P'.mergeAppend (_statuses old'Self) new'Field})
                    (P'.wireGetPacked 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> HTTPCheckInfo) HTTPCheckInfo where
  getVal m' f' = f' m'

instance P'.GPB HTTPCheckInfo

instance P'.ReflectDescriptor HTTPCheckInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 18, 26, 32, 34, 40])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"HTTPCheckInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"HealthCheck\",\"HTTPCheckInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo.protocol\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"HTTPCheckInfo\"], baseName' = FName \"protocol\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo.Protocol\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"NetworkInfo\"], baseName = MName \"Protocol\"}), hsRawDefault = Just \"IPv4\", hsDefault = Just (HsDef'Enum \"IPv4\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo.scheme\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"HTTPCheckInfo\"], baseName' = FName \"scheme\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo.port\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"HTTPCheckInfo\"], baseName' = FName \"port\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo.path\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"HTTPCheckInfo\"], baseName' = FName \"path\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo.statuses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"HTTPCheckInfo\"], baseName' = FName \"statuses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Just (WireTag {getWireTag = 32},WireTag {getWireTag = 34}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType HTTPCheckInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg HTTPCheckInfo where
  textPut msg
   = do
       P'.tellT "protocol" (_protocol msg)
       P'.tellT "scheme" (_scheme msg)
       P'.tellT "port" (_port msg)
       P'.tellT "path" (_path msg)
       P'.tellT "statuses" (_statuses msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_protocol, parse'_scheme, parse'_port, parse'_path, parse'_statuses]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_protocol
         = P'.try
            (do
               v <- P'.getT "protocol"
               Prelude'.return (\ o -> o{_protocol = v}))
        parse'_scheme
         = P'.try
            (do
               v <- P'.getT "scheme"
               Prelude'.return (\ o -> o{_scheme = v}))
        parse'_port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{_port = v}))
        parse'_path
         = P'.try
            (do
               v <- P'.getT "path"
               Prelude'.return (\ o -> o{_path = v}))
        parse'_statuses
         = P'.try
            (do
               v <- P'.getT "statuses"
               Prelude'.return (\ o -> o{_statuses = P'.append (_statuses o) v}))