{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.RateLimits (RateLimits(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.RateLimit as Protos (RateLimit)

data RateLimits = RateLimits{limits :: (P'.Seq Protos.RateLimit), aggregate_default_qps :: (P'.Maybe P'.Double),
                             aggregate_default_capacity :: (P'.Maybe P'.Word64)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable RateLimits where
  mergeAppend (RateLimits x'1 x'2 x'3) (RateLimits y'1 y'2 y'3)
   = RateLimits (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default RateLimits where
  defaultValue = RateLimits P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire RateLimits where
  wireSize ft' self'@(RateLimits x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeOpt 1 1 x'2 + P'.wireSizeOpt 1 4 x'3)
  wirePutWithSize ft' self'@(RateLimits x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutOptWithSize 17 1 x'2, P'.wirePutOptWithSize 24 4 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{limits = P'.append (limits old'Self) new'Field}) (P'.wireGet 11)
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{aggregate_default_qps = Prelude'.Just new'Field}) (P'.wireGet 1)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{aggregate_default_capacity = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> RateLimits) RateLimits where
  getVal m' f' = f' m'

instance P'.GPB RateLimits

instance P'.ReflectDescriptor RateLimits where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 17, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.RateLimits\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"RateLimits\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"RateLimits.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RateLimits.limits\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RateLimits\"], baseName' = FName \"limits\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.RateLimit\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"RateLimit\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RateLimits.aggregate_default_qps\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RateLimits\"], baseName' = FName \"aggregate_default_qps\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RateLimits.aggregate_default_capacity\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RateLimits\"], baseName' = FName \"aggregate_default_capacity\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = True, makeLenses = False}"

instance P'.TextType RateLimits where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg RateLimits where
  textPut msg
   = do
       P'.tellT "limits" (limits msg)
       P'.tellT "aggregate_default_qps" (aggregate_default_qps msg)
       P'.tellT "aggregate_default_capacity" (aggregate_default_capacity msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'limits, parse'aggregate_default_qps, parse'aggregate_default_capacity]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'limits
         = P'.try
            (do
               v <- P'.getT "limits"
               Prelude'.return (\ o -> o{limits = P'.append (limits o) v}))
        parse'aggregate_default_qps
         = P'.try
            (do
               v <- P'.getT "aggregate_default_qps"
               Prelude'.return (\ o -> o{aggregate_default_qps = v}))
        parse'aggregate_default_capacity
         = P'.try
            (do
               v <- P'.getT "aggregate_default_capacity"
               Prelude'.return (\ o -> o{aggregate_default_capacity = v}))