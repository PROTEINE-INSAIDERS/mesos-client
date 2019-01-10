{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Quota.Protos.QuotaStatus (QuotaStatus(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Quota.Protos.QuotaInfo as Protos (QuotaInfo)

data QuotaStatus = QuotaStatus{infos :: !(P'.Seq Protos.QuotaInfo)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON QuotaStatus where
  toJSON msg = P'.objectNoEmpty ([("infos", P'.toJSON (Prelude'.fmap P'.toJSON (infos msg)))] ++ Prelude'.concat [])

instance P'.FromJSON QuotaStatus where
  parseJSON
   = P'.withObject "QuotaStatus"
      (\ o ->
        do
          infos <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "infos")
          Prelude'.return P'.defaultValue{infos = infos})

instance P'.Mergeable QuotaStatus where
  mergeAppend (QuotaStatus x'1) (QuotaStatus y'1) = QuotaStatus (P'.mergeAppend x'1 y'1)

instance P'.Default QuotaStatus where
  defaultValue = QuotaStatus P'.defaultValue

instance P'.Wire QuotaStatus where
  wireSize ft' self'@(QuotaStatus x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(QuotaStatus x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{infos = P'.append (infos old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> QuotaStatus) QuotaStatus where
  getVal m' f' = f' m'

instance P'.GPB QuotaStatus

instance P'.ReflectDescriptor QuotaStatus where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaStatus\"}, descFilePath = [\"Mesos\",\"V1\",\"Quota\",\"Protos\",\"QuotaStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.quota.QuotaStatus.infos\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule' = [MName \"Protos\",MName \"QuotaStatus\"], baseName' = FName \"infos\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.quota.QuotaInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Quota\"], parentModule = [MName \"Protos\"], baseName = MName \"QuotaInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType QuotaStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg QuotaStatus where
  textPut msg
   = do
       P'.tellT "infos" (infos msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'infos]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'infos
         = P'.try
            (do
               v <- P'.getT "infos"
               Prelude'.return (\ o -> o{infos = P'.append (infos o) v}))