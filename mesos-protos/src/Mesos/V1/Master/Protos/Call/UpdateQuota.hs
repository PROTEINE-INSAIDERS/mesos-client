{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.UpdateQuota (UpdateQuota(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Quota.Protos.QuotaRequest as Protos (QuotaRequest)

data UpdateQuota = UpdateQuota{quota_requests :: !(P'.Seq Protos.QuotaRequest)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON UpdateQuota where
  toJSON msg
   = P'.objectNoEmpty ([("quota_requests", P'.toJSON (Prelude'.fmap P'.toJSON (quota_requests msg)))] ++ Prelude'.concat [])

instance P'.FromJSON UpdateQuota where
  parseJSON
   = P'.withObject "UpdateQuota"
      (\ o ->
        do
          quota_requests <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                             (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "quota_requests")
          Prelude'.return P'.defaultValue{quota_requests = quota_requests})

instance P'.Mergeable UpdateQuota where
  mergeAppend (UpdateQuota x'1) (UpdateQuota y'1) = UpdateQuota (P'.mergeAppend x'1 y'1)

instance P'.Default UpdateQuota where
  defaultValue = UpdateQuota P'.defaultValue

instance P'.Wire UpdateQuota where
  wireSize ft' self'@(UpdateQuota x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(UpdateQuota x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{quota_requests = P'.append (quota_requests old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> UpdateQuota) UpdateQuota where
  getVal m' f' = f' m'

instance P'.GPB UpdateQuota

instance P'.ReflectDescriptor UpdateQuota where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateQuota\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call\",\"UpdateQuota.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.UpdateQuota.quota_requests\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"UpdateQuota\"], baseName' = FName \"quota_requests\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaRequest\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaRequest\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType UpdateQuota where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg UpdateQuota where
  textPut msg
   = do
       P'.tellT "quota_requests" (quota_requests msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'quota_requests]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'quota_requests
         = P'.try
            (do
               v <- P'.getT "quota_requests"
               Prelude'.return (\ o -> o{quota_requests = P'.append (quota_requests o) v}))