{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetQuota (GetQuota(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Quota.Protos.QuotaStatus as Protos (QuotaStatus)

data GetQuota = GetQuota{status :: !(Protos.QuotaStatus)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON GetQuota where
  toJSON msg = P'.objectNoEmpty ([("status", P'.toJSON (status msg))] ++ Prelude'.concat [])

instance P'.FromJSON GetQuota where
  parseJSON
   = P'.withObject "GetQuota"
      (\ o ->
        do
          status <- P'.explicitParseField P'.parseJSON o "status"
          Prelude'.return P'.defaultValue{status = status})

instance P'.Mergeable GetQuota where
  mergeAppend (GetQuota x'1) (GetQuota y'1) = GetQuota (P'.mergeAppend x'1 y'1)

instance P'.Default GetQuota where
  defaultValue = GetQuota P'.defaultValue

instance P'.Wire GetQuota where
  wireSize ft' self'@(GetQuota x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(GetQuota x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{status = P'.mergeAppend (status old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetQuota) GetQuota where
  getVal m' f' = f' m'

instance P'.GPB GetQuota

instance P'.ReflectDescriptor GetQuota where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetQuota\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetQuota.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetQuota.status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetQuota\"], baseName' = FName \"status\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType GetQuota where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetQuota where
  textPut msg
   = do
       P'.tellT "status" (status msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'status]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'status
         = P'.try
            (do
               v <- P'.getT "status"
               Prelude'.return (\ o -> o{status = v}))