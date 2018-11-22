{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.HealthCheck.TCPCheckInfo (TCPCheckInfo(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.NetworkInfo.Protocol as Protos.NetworkInfo (Protocol)

data TCPCheckInfo = TCPCheckInfo{protocol :: (P'.Maybe Protos.NetworkInfo.Protocol), port :: (P'.Word32)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable TCPCheckInfo where
  mergeAppend (TCPCheckInfo x'1 x'2) (TCPCheckInfo y'1 y'2) = TCPCheckInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default TCPCheckInfo where
  defaultValue = TCPCheckInfo (Prelude'.Just (Prelude'.read "IPv4")) P'.defaultValue

instance P'.Wire TCPCheckInfo where
  wireSize ft' self'@(TCPCheckInfo x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeReq 1 13 x'2)
  wirePutWithSize ft' self'@(TCPCheckInfo x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 13 x'2, P'.wirePutOptWithSize 16 14 x'1]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{protocol = Prelude'.Just new'Field}) (P'.wireGet 14)
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{port = new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TCPCheckInfo) TCPCheckInfo where
  getVal m' f' = f' m'

instance P'.GPB TCPCheckInfo

instance P'.ReflectDescriptor TCPCheckInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.HealthCheck.TCPCheckInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"TCPCheckInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"HealthCheck\",\"TCPCheckInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.TCPCheckInfo.protocol\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"TCPCheckInfo\"], baseName' = FName \"protocol\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo.Protocol\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"NetworkInfo\"], baseName = MName \"Protocol\"}), hsRawDefault = Just \"IPv4\", hsDefault = Just (HsDef'Enum \"IPv4\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.TCPCheckInfo.port\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\",MName \"TCPCheckInfo\"], baseName' = FName \"port\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = True, makeLenses = False}"

instance P'.TextType TCPCheckInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TCPCheckInfo where
  textPut msg
   = do
       P'.tellT "protocol" (protocol msg)
       P'.tellT "port" (port msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'protocol, parse'port]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'protocol
         = P'.try
            (do
               v <- P'.getT "protocol"
               Prelude'.return (\ o -> o{protocol = v}))
        parse'port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{port = v}))