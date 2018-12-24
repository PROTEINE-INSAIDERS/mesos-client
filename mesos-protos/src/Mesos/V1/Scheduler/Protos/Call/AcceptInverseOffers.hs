{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Call.AcceptInverseOffers (AcceptInverseOffers(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Filters as Protos (Filters)
import qualified Mesos.V1.Protos.OfferID as Protos (OfferID)

data AcceptInverseOffers = AcceptInverseOffers{inverse_offer_ids :: !(P'.Seq Protos.OfferID), filters :: !(P'.Maybe Protos.Filters)}
                           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON AcceptInverseOffers where
  toJSON msg
   = P'.objectNoEmpty
      ([("inverse_offer_ids", P'.toJSON (Prelude'.fmap P'.toJSON (inverse_offer_ids msg))),
        ("filters", P'.toJSON (Prelude'.fmap P'.toJSON (filters msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON AcceptInverseOffers where
  parseJSON
   = P'.withObject "AcceptInverseOffers"
      (\ o ->
        do
          inverse_offer_ids <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "inverse_offer_ids")
          filters <- P'.explicitParseFieldMaybe P'.parseJSON o "filters"
          Prelude'.return P'.defaultValue{inverse_offer_ids = inverse_offer_ids, filters = filters})

instance P'.Mergeable AcceptInverseOffers where
  mergeAppend (AcceptInverseOffers x'1 x'2) (AcceptInverseOffers y'1 y'2)
   = AcceptInverseOffers (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default AcceptInverseOffers where
  defaultValue = AcceptInverseOffers P'.defaultValue P'.defaultValue

instance P'.Wire AcceptInverseOffers where
  wireSize ft' self'@(AcceptInverseOffers x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeOpt 1 11 x'2)
  wirePutWithSize ft' self'@(AcceptInverseOffers x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{inverse_offer_ids = P'.append (inverse_offer_ids old'Self) new'Field})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{filters = P'.mergeAppend (filters old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AcceptInverseOffers) AcceptInverseOffers where
  getVal m' f' = f' m'

instance P'.GPB AcceptInverseOffers

instance P'.ReflectDescriptor AcceptInverseOffers where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.AcceptInverseOffers\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"AcceptInverseOffers\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Call\",\"AcceptInverseOffers.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.AcceptInverseOffers.inverse_offer_ids\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcceptInverseOffers\"], baseName' = FName \"inverse_offer_ids\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OfferID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OfferID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.AcceptInverseOffers.filters\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"AcceptInverseOffers\"], baseName' = FName \"filters\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Filters\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Filters\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType AcceptInverseOffers where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AcceptInverseOffers where
  textPut msg
   = do
       P'.tellT "inverse_offer_ids" (inverse_offer_ids msg)
       P'.tellT "filters" (filters msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'inverse_offer_ids, parse'filters]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'inverse_offer_ids
         = P'.try
            (do
               v <- P'.getT "inverse_offer_ids"
               Prelude'.return (\ o -> o{inverse_offer_ids = P'.append (inverse_offer_ids o) v}))
        parse'filters
         = P'.try
            (do
               v <- P'.getT "filters"
               Prelude'.return (\ o -> o{filters = v}))