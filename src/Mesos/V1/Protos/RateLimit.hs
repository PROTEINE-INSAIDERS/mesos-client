{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.RateLimit (RateLimit(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data RateLimit = RateLimit{qps :: (P'.Maybe P'.Double), principal :: (P'.Utf8), capacity :: (P'.Maybe P'.Word64)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable RateLimit where
  mergeAppend (RateLimit x'1 x'2 x'3) (RateLimit y'1 y'2 y'3)
   = RateLimit (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default RateLimit where
  defaultValue = RateLimit P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire RateLimit where
  wireSize ft' self'@(RateLimit x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 1 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeOpt 1 4 x'3)
  wirePutWithSize ft' self'@(RateLimit x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 9 1 x'1, P'.wirePutReqWithSize 18 9 x'2, P'.wirePutOptWithSize 24 4 x'3]
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
             9 -> Prelude'.fmap (\ !new'Field -> old'Self{qps = Prelude'.Just new'Field}) (P'.wireGet 1)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{principal = new'Field}) (P'.wireGet 9)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{capacity = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> RateLimit) RateLimit where
  getVal m' f' = f' m'

instance P'.GPB RateLimit

instance P'.ReflectDescriptor RateLimit where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [18]) (P'.fromDistinctAscList [9, 18, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.RateLimit\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"RateLimit\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"RateLimit.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RateLimit.qps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RateLimit\"], baseName' = FName \"qps\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RateLimit.principal\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RateLimit\"], baseName' = FName \"principal\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RateLimit.capacity\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RateLimit\"], baseName' = FName \"capacity\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = True, makeLenses = False}"

instance P'.TextType RateLimit where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg RateLimit where
  textPut msg
   = do
       P'.tellT "qps" (qps msg)
       P'.tellT "principal" (principal msg)
       P'.tellT "capacity" (capacity msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'qps, parse'principal, parse'capacity]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'qps
         = P'.try
            (do
               v <- P'.getT "qps"
               Prelude'.return (\ o -> o{qps = v}))
        parse'principal
         = P'.try
            (do
               v <- P'.getT "principal"
               Prelude'.return (\ o -> o{principal = v}))
        parse'capacity
         = P'.try
            (do
               v <- P'.getT "capacity"
               Prelude'.return (\ o -> o{capacity = v}))