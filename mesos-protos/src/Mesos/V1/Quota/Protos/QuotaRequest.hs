{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Quota.Protos.QuotaRequest (QuotaRequest(..), force, role, guarantee, limit) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data QuotaRequest = QuotaRequest{_force :: !(P'.Maybe P'.Bool), _role :: !(P'.Maybe P'.Utf8),
                                 _guarantee :: !(P'.Seq Protos.Resource), _limit :: !(P'.Seq Protos.Resource)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''QuotaRequest

instance P'.ToJSON QuotaRequest where
  toJSON msg
   = P'.objectNoEmpty
      ([("force", P'.toJSON (Prelude'.fmap P'.toJSON (force msg))), ("role", P'.toJSON (Prelude'.fmap P'.toJSON (role msg))),
        ("guarantee", P'.toJSON (Prelude'.fmap P'.toJSON (guarantee msg))),
        ("limit", P'.toJSON (Prelude'.fmap P'.toJSON (limit msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON QuotaRequest where
  parseJSON
   = P'.withObject "QuotaRequest"
      (\ o ->
        do
          force <- P'.explicitParseFieldMaybe P'.parseJSONBool o "force"
          role <- P'.explicitParseFieldMaybe P'.parseJSON o "role"
          guarantee <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "guarantee")
          limit <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "limit")
          Prelude'.return P'.defaultValue{_force = force, _role = role, _guarantee = guarantee, _limit = limit})

instance P'.Mergeable QuotaRequest where
  mergeAppend (QuotaRequest x'1 x'2 x'3 x'4) (QuotaRequest y'1 y'2 y'3 y'4)
   = QuotaRequest (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default QuotaRequest where
  defaultValue = QuotaRequest P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire QuotaRequest where
  wireSize ft' self'@(QuotaRequest x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 11 x'4)
  wirePutWithSize ft' self'@(QuotaRequest x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 8 x'1, P'.wirePutOptWithSize 18 9 x'2, P'.wirePutRepWithSize 26 11 x'3,
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_force = Prelude'.Just new'Field}) (P'.wireGet 8)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_role = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_guarantee = P'.append (_guarantee old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_limit = P'.append (_limit old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> QuotaRequest) QuotaRequest where
  getVal m' f' = f' m'

instance P'.GPB QuotaRequest

instance P'.ReflectDescriptor QuotaRequest where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaRequest\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaRequest\"}, descFilePath = [\"Mesos\",\"V1\",\"Quota\",\"Protos\",\"QuotaRequest.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaRequest.force\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaRequest\"], baseName' = FName \"force\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaRequest.role\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaRequest\"], baseName' = FName \"role\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaRequest.guarantee\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaRequest\"], baseName' = FName \"guarantee\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaRequest.limit\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaRequest\"], baseName' = FName \"limit\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType QuotaRequest where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg QuotaRequest where
  textPut msg
   = do
       P'.tellT "force" (_force msg)
       P'.tellT "role" (_role msg)
       P'.tellT "guarantee" (_guarantee msg)
       P'.tellT "limit" (_limit msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_force, parse'_role, parse'_guarantee, parse'_limit]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_force
         = P'.try
            (do
               v <- P'.getT "force"
               Prelude'.return (\ o -> o{_force = v}))
        parse'_role
         = P'.try
            (do
               v <- P'.getT "role"
               Prelude'.return (\ o -> o{_role = v}))
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