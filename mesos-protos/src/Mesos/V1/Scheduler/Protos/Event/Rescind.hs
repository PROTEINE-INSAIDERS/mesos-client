{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Event.Rescind (Rescind(..), offer_id) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.OfferID as Protos (OfferID)

data Rescind = Rescind{_offer_id :: !(Protos.OfferID)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Rescind

instance P'.ToJSON Rescind where
  toJSON msg = P'.objectNoEmpty ([("offer_id", P'.toJSON (offer_id msg))] ++ Prelude'.concat [])

instance P'.FromJSON Rescind where
  parseJSON
   = P'.withObject "Rescind"
      (\ o ->
        do
          offer_id <- P'.explicitParseField P'.parseJSON o "offer_id"
          Prelude'.return P'.defaultValue{_offer_id = offer_id})

instance P'.Mergeable Rescind where
  mergeAppend (Rescind x'1) (Rescind y'1) = Rescind (P'.mergeAppend x'1 y'1)

instance P'.Default Rescind where
  defaultValue = Rescind P'.defaultValue

instance P'.Wire Rescind where
  wireSize ft' self'@(Rescind x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(Rescind x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_offer_id = P'.mergeAppend (_offer_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Rescind) Rescind where
  getVal m' f' = f' m'

instance P'.GPB Rescind

instance P'.ReflectDescriptor Rescind where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Rescind\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Rescind\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Event\",\"Rescind.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Rescind.offer_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Rescind\"], baseName' = FName \"offer_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OfferID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OfferID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Rescind where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Rescind where
  textPut msg
   = do
       P'.tellT "offer_id" (_offer_id msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_offer_id]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_offer_id
         = P'.try
            (do
               v <- P'.getT "offer_id"
               Prelude'.return (\ o -> o{_offer_id = v}))