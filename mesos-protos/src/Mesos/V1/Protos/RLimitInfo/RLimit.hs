{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.RLimitInfo.RLimit (RLimit(..), type', hard, soft) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.RLimitInfo.RLimit.Type as Protos.RLimitInfo.RLimit (Type)

data RLimit = RLimit{_type' :: !(P'.Maybe Protos.RLimitInfo.RLimit.Type), _hard :: !(P'.Maybe P'.Word64),
                     _soft :: !(P'.Maybe P'.Word64)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''RLimit

instance P'.ToJSON RLimit where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("hard", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (hard msg))),
        ("soft", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (soft msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON RLimit where
  parseJSON
   = P'.withObject "RLimit"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          hard <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "hard"
          soft <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "soft"
          Prelude'.return P'.defaultValue{_type' = type', _hard = hard, _soft = soft})

instance P'.Mergeable RLimit where
  mergeAppend (RLimit x'1 x'2 x'3) (RLimit y'1 y'2 y'3)
   = RLimit (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default RLimit where
  defaultValue = RLimit P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire RLimit where
  wireSize ft' self'@(RLimit x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 4 x'2 + P'.wireSizeOpt 1 4 x'3)
  wirePutWithSize ft' self'@(RLimit x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 16 4 x'2, P'.wirePutOptWithSize 24 4 x'3]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_hard = Prelude'.Just new'Field}) (P'.wireGet 4)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_soft = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> RLimit) RLimit where
  getVal m' f' = f' m'

instance P'.GPB RLimit

instance P'.ReflectDescriptor RLimit where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.RLimitInfo.RLimit\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"RLimitInfo\"], baseName = MName \"RLimit\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"RLimitInfo\",\"RLimit.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RLimitInfo.RLimit.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RLimitInfo\",MName \"RLimit\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.RLimitInfo.RLimit.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"RLimitInfo\",MName \"RLimit\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RLimitInfo.RLimit.hard\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RLimitInfo\",MName \"RLimit\"], baseName' = FName \"hard\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.RLimitInfo.RLimit.soft\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"RLimitInfo\",MName \"RLimit\"], baseName' = FName \"soft\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType RLimit where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg RLimit where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "hard" (_hard msg)
       P'.tellT "soft" (_soft msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_type', parse'_hard, parse'_soft]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_hard
         = P'.try
            (do
               v <- P'.getT "hard"
               Prelude'.return (\ o -> o{_hard = v}))
        parse'_soft
         = P'.try
            (do
               v <- P'.getT "soft"
               Prelude'.return (\ o -> o{_soft = v}))