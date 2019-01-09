{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Quota.Protos.QuotaInfo (QuotaInfo(..), role, principal, guarantee, limit) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data QuotaInfo = QuotaInfo{_role :: !(P'.Maybe P'.Utf8), _principal :: !(P'.Maybe P'.Utf8), _guarantee :: !(P'.Seq Protos.Resource),
                           _limit :: !(P'.Seq Protos.Resource)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''QuotaInfo

instance P'.ToJSON QuotaInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("role", P'.toJSON (Prelude'.fmap P'.toJSON (role msg))),
        ("principal", P'.toJSON (Prelude'.fmap P'.toJSON (principal msg))),
        ("guarantee", P'.toJSON (Prelude'.fmap P'.toJSON (guarantee msg))),
        ("limit", P'.toJSON (Prelude'.fmap P'.toJSON (limit msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON QuotaInfo where
  parseJSON
   = P'.withObject "QuotaInfo"
      (\ o ->
        do
          role <- P'.explicitParseFieldMaybe P'.parseJSON o "role"
          principal <- P'.explicitParseFieldMaybe P'.parseJSON o "principal"
          guarantee <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "guarantee")
          limit <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "limit")
          Prelude'.return P'.defaultValue{_role = role, _principal = principal, _guarantee = guarantee, _limit = limit})

instance P'.Mergeable QuotaInfo where
  mergeAppend (QuotaInfo x'1 x'2 x'3 x'4) (QuotaInfo y'1 y'2 y'3 y'4)
   = QuotaInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default QuotaInfo where
  defaultValue = QuotaInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire QuotaInfo where
  wireSize ft' self'@(QuotaInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 11 x'4)
  wirePutWithSize ft' self'@(QuotaInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 9 x'1, P'.wirePutOptWithSize 18 9 x'2, P'.wirePutRepWithSize 26 11 x'3,
             P'.wirePutRepWithSize 34 11 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_role = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_principal = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_guarantee = P'.append (_guarantee old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_limit = P'.append (_limit old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> QuotaInfo) QuotaInfo where
  getVal m' f' = f' m'

instance P'.GPB QuotaInfo

instance P'.ReflectDescriptor QuotaInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Quota\",\"Protos\",\"QuotaInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaInfo.role\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaInfo\"], baseName' = FName \"role\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaInfo.principal\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaInfo\"], baseName' = FName \"principal\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaInfo.guarantee\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaInfo\"], baseName' = FName \"guarantee\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaInfo.limit\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaInfo\"], baseName' = FName \"limit\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType QuotaInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg QuotaInfo where
  textPut msg
   = do
       P'.tellT "role" (_role msg)
       P'.tellT "principal" (_principal msg)
       P'.tellT "guarantee" (_guarantee msg)
       P'.tellT "limit" (_limit msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_role, parse'_principal, parse'_guarantee, parse'_limit]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_role
         = P'.try
            (do
               v <- P'.getT "role"
               Prelude'.return (\ o -> o{_role = v}))
        parse'_principal
         = P'.try
            (do
               v <- P'.getT "principal"
               Prelude'.return (\ o -> o{_principal = v}))
        parse'_guarantee
         = P'.try
            (do
               v <- P'.getT "guarantee"
               Prelude'.return (\ o -> o{_guarantee = P'.append (_guarantee o) v}))
        parse'_limit
         = P'.try
            (do
               v <- P'.getT "limit"
               Prelude'.return (\ o -> o{_limit = P'.append (_limit o) v}))