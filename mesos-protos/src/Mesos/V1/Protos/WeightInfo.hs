{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.WeightInfo (WeightInfo(..), weight, role) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data WeightInfo = WeightInfo{_weight :: !(P'.Double), _role :: !(P'.Maybe P'.Utf8)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''WeightInfo

instance P'.ToJSON WeightInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("weight", P'.toJSON (weight msg)), ("role", P'.toJSON (Prelude'.fmap P'.toJSON (role msg)))] ++ Prelude'.concat [])

instance P'.FromJSON WeightInfo where
  parseJSON
   = P'.withObject "WeightInfo"
      (\ o ->
        do
          weight <- P'.explicitParseField P'.parseJSON o "weight"
          role <- P'.explicitParseFieldMaybe P'.parseJSON o "role"
          Prelude'.return P'.defaultValue{_weight = weight, _role = role})

instance P'.Mergeable WeightInfo where
  mergeAppend (WeightInfo x'1 x'2) (WeightInfo y'1 y'2) = WeightInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default WeightInfo where
  defaultValue = WeightInfo P'.defaultValue P'.defaultValue

instance P'.Wire WeightInfo where
  wireSize ft' self'@(WeightInfo x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 1 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePutWithSize ft' self'@(WeightInfo x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 9 1 x'1, P'.wirePutOptWithSize 18 9 x'2]
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
             9 -> Prelude'.fmap (\ !new'Field -> old'Self{_weight = new'Field}) (P'.wireGet 1)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_role = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> WeightInfo) WeightInfo where
  getVal m' f' = f' m'

instance P'.GPB WeightInfo

instance P'.ReflectDescriptor WeightInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [9]) (P'.fromDistinctAscList [9, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.WeightInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"WeightInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"WeightInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.WeightInfo.weight\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"WeightInfo\"], baseName' = FName \"weight\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.WeightInfo.role\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"WeightInfo\"], baseName' = FName \"role\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType WeightInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg WeightInfo where
  textPut msg
   = do
       P'.tellT "weight" (_weight msg)
       P'.tellT "role" (_role msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_weight, parse'_role]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_weight
         = P'.try
            (do
               v <- P'.getT "weight"
               Prelude'.return (\ o -> o{_weight = v}))
        parse'_role
         = P'.try
            (do
               v <- P'.getT "role"
               Prelude'.return (\ o -> o{_role = v}))