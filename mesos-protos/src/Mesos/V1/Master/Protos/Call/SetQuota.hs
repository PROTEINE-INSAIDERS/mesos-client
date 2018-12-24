{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.SetQuota (SetQuota(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Quota.Protos.QuotaRequest as Protos (QuotaRequest)

data SetQuota = SetQuota{quota_request :: !(Protos.QuotaRequest)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON SetQuota where
  toJSON msg = P'.objectNoEmpty ([("quota_request", P'.toJSON (quota_request msg))] ++ Prelude'.concat [])

instance P'.FromJSON SetQuota where
  parseJSON
   = P'.withObject "SetQuota"
      (\ o ->
        do
          quota_request <- P'.explicitParseField P'.parseJSON o "quota_request"
          Prelude'.return P'.defaultValue{quota_request = quota_request})

instance P'.Mergeable SetQuota where
  mergeAppend (SetQuota x'1) (SetQuota y'1) = SetQuota (P'.mergeAppend x'1 y'1)

instance P'.Default SetQuota where
  defaultValue = SetQuota P'.defaultValue

instance P'.Wire SetQuota where
  wireSize ft' self'@(SetQuota x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(SetQuota x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{quota_request = P'.mergeAppend (quota_request old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SetQuota) SetQuota where
  getVal m' f' = f' m'

instance P'.GPB SetQuota

instance P'.ReflectDescriptor SetQuota where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call.SetQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"SetQuota\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call\",\"SetQuota.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.SetQuota.quota_request\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"SetQuota\"], baseName' = FName \"quota_request\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaRequest\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaRequest\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType SetQuota where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SetQuota where
  textPut msg
   = do
       P'.tellT "quota_request" (quota_request msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'quota_request]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'quota_request
         = P'.try
            (do
               v <- P'.getT "quota_request"
               Prelude'.return (\ o -> o{quota_request = v}))