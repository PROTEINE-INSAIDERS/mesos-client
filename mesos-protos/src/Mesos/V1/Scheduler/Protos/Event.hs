{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Event
       (Event(..), type', subscribed, offers, inverse_offers, rescind, rescind_inverse_offer, update, update_operation_status,
        message, failure, error)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Scheduler.Protos.Event.Error as Protos.Event (Error)
import qualified Mesos.V1.Scheduler.Protos.Event.Failure as Protos.Event (Failure)
import qualified Mesos.V1.Scheduler.Protos.Event.InverseOffers as Protos.Event (InverseOffers)
import qualified Mesos.V1.Scheduler.Protos.Event.Message as Protos.Event (Message)
import qualified Mesos.V1.Scheduler.Protos.Event.Offers as Protos.Event (Offers)
import qualified Mesos.V1.Scheduler.Protos.Event.Rescind as Protos.Event (Rescind)
import qualified Mesos.V1.Scheduler.Protos.Event.RescindInverseOffer as Protos.Event (RescindInverseOffer)
import qualified Mesos.V1.Scheduler.Protos.Event.Subscribed as Protos.Event (Subscribed)
import qualified Mesos.V1.Scheduler.Protos.Event.Type as Protos.Event (Type)
import qualified Mesos.V1.Scheduler.Protos.Event.Update as Protos.Event (Update)
import qualified Mesos.V1.Scheduler.Protos.Event.UpdateOperationStatus as Protos.Event (UpdateOperationStatus)

data Event = Event{_type' :: !(P'.Maybe Protos.Event.Type), _subscribed :: !(P'.Maybe Protos.Event.Subscribed),
                   _offers :: !(P'.Maybe Protos.Event.Offers), _inverse_offers :: !(P'.Maybe Protos.Event.InverseOffers),
                   _rescind :: !(P'.Maybe Protos.Event.Rescind),
                   _rescind_inverse_offer :: !(P'.Maybe Protos.Event.RescindInverseOffer),
                   _update :: !(P'.Maybe Protos.Event.Update),
                   _update_operation_status :: !(P'.Maybe Protos.Event.UpdateOperationStatus),
                   _message :: !(P'.Maybe Protos.Event.Message), _failure :: !(P'.Maybe Protos.Event.Failure),
                   _error :: !(P'.Maybe Protos.Event.Error)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Event

instance P'.ToJSON Event where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("subscribed", P'.toJSON (Prelude'.fmap P'.toJSON (subscribed msg))),
        ("offers", P'.toJSON (Prelude'.fmap P'.toJSON (offers msg))),
        ("inverse_offers", P'.toJSON (Prelude'.fmap P'.toJSON (inverse_offers msg))),
        ("rescind", P'.toJSON (Prelude'.fmap P'.toJSON (rescind msg))),
        ("rescind_inverse_offer", P'.toJSON (Prelude'.fmap P'.toJSON (rescind_inverse_offer msg))),
        ("update", P'.toJSON (Prelude'.fmap P'.toJSON (update msg))),
        ("update_operation_status", P'.toJSON (Prelude'.fmap P'.toJSON (update_operation_status msg))),
        ("message", P'.toJSON (Prelude'.fmap P'.toJSON (message msg))),
        ("failure", P'.toJSON (Prelude'.fmap P'.toJSON (failure msg))), ("error", P'.toJSON (Prelude'.fmap P'.toJSON (error msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Event where
  parseJSON
   = P'.withObject "Event"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          subscribed <- P'.explicitParseFieldMaybe P'.parseJSON o "subscribed"
          offers <- P'.explicitParseFieldMaybe P'.parseJSON o "offers"
          inverse_offers <- P'.explicitParseFieldMaybe P'.parseJSON o "inverse_offers"
          rescind <- P'.explicitParseFieldMaybe P'.parseJSON o "rescind"
          rescind_inverse_offer <- P'.explicitParseFieldMaybe P'.parseJSON o "rescind_inverse_offer"
          update <- P'.explicitParseFieldMaybe P'.parseJSON o "update"
          update_operation_status <- P'.explicitParseFieldMaybe P'.parseJSON o "update_operation_status"
          message <- P'.explicitParseFieldMaybe P'.parseJSON o "message"
          failure <- P'.explicitParseFieldMaybe P'.parseJSON o "failure"
          error <- P'.explicitParseFieldMaybe P'.parseJSON o "error"
          Prelude'.return
           P'.defaultValue{_type' = type', _subscribed = subscribed, _offers = offers, _inverse_offers = inverse_offers,
                           _rescind = rescind, _rescind_inverse_offer = rescind_inverse_offer, _update = update,
                           _update_operation_status = update_operation_status, _message = message, _failure = failure,
                           _error = error})

instance P'.Mergeable Event where
  mergeAppend (Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11) (Event y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11)
   = Event (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)

instance P'.Default Event where
  defaultValue
   = Event P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Event where
  wireSize ft' self'@(Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11)
  wirePutWithSize ft' self'@(Event x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'5, P'.wirePutOptWithSize 42 11 x'7, P'.wirePutOptWithSize 50 11 x'9,
             P'.wirePutOptWithSize 58 11 x'10, P'.wirePutOptWithSize 66 11 x'11, P'.wirePutOptWithSize 74 11 x'4,
             P'.wirePutOptWithSize 82 11 x'6, P'.wirePutOptWithSize 90 11 x'8]
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
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_subscribed = P'.mergeAppend (_subscribed old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_offers = P'.mergeAppend (_offers old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_inverse_offers = P'.mergeAppend (_inverse_offers old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_rescind = P'.mergeAppend (_rescind old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_rescind_inverse_offer = P'.mergeAppend (_rescind_inverse_offer old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_update = P'.mergeAppend (_update old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_update_operation_status =
                                P'.mergeAppend (_update_operation_status old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_message = P'.mergeAppend (_message old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_failure = P'.mergeAppend (_failure old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_error = P'.mergeAppend (_error old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Event) Event where
  getVal m' f' = f' m'

instance P'.GPB Event

instance P'.ReflectDescriptor Event where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58, 66, 74, 82, 90])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\"], baseName = MName \"Event\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Event.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.subscribed\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"subscribed\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Subscribed\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Subscribed\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"offers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Offers\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Offers\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.inverse_offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"inverse_offers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.InverseOffers\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"InverseOffers\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.rescind\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"rescind\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Rescind\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Rescind\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.rescind_inverse_offer\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"rescind_inverse_offer\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.RescindInverseOffer\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"RescindInverseOffer\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.update\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"update\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Update\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Update\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.update_operation_status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"update_operation_status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.UpdateOperationStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"UpdateOperationStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.message\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"message\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Message\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Message\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.failure\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"failure\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Failure\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Failure\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.error\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Event\"], baseName' = FName \"error\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Error\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Error\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Event where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Event where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "subscribed" (_subscribed msg)
       P'.tellT "offers" (_offers msg)
       P'.tellT "inverse_offers" (_inverse_offers msg)
       P'.tellT "rescind" (_rescind msg)
       P'.tellT "rescind_inverse_offer" (_rescind_inverse_offer msg)
       P'.tellT "update" (_update msg)
       P'.tellT "update_operation_status" (_update_operation_status msg)
       P'.tellT "message" (_message msg)
       P'.tellT "failure" (_failure msg)
       P'.tellT "error" (_error msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_subscribed, parse'_offers, parse'_inverse_offers, parse'_rescind,
                   parse'_rescind_inverse_offer, parse'_update, parse'_update_operation_status, parse'_message, parse'_failure,
                   parse'_error])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_subscribed
         = P'.try
            (do
               v <- P'.getT "subscribed"
               Prelude'.return (\ o -> o{_subscribed = v}))
        parse'_offers
         = P'.try
            (do
               v <- P'.getT "offers"
               Prelude'.return (\ o -> o{_offers = v}))
        parse'_inverse_offers
         = P'.try
            (do
               v <- P'.getT "inverse_offers"
               Prelude'.return (\ o -> o{_inverse_offers = v}))
        parse'_rescind
         = P'.try
            (do
               v <- P'.getT "rescind"
               Prelude'.return (\ o -> o{_rescind = v}))
        parse'_rescind_inverse_offer
         = P'.try
            (do
               v <- P'.getT "rescind_inverse_offer"
               Prelude'.return (\ o -> o{_rescind_inverse_offer = v}))
        parse'_update
         = P'.try
            (do
               v <- P'.getT "update"
               Prelude'.return (\ o -> o{_update = v}))
        parse'_update_operation_status
         = P'.try
            (do
               v <- P'.getT "update_operation_status"
               Prelude'.return (\ o -> o{_update_operation_status = v}))
        parse'_message
         = P'.try
            (do
               v <- P'.getT "message"
               Prelude'.return (\ o -> o{_message = v}))
        parse'_failure
         = P'.try
            (do
               v <- P'.getT "failure"
               Prelude'.return (\ o -> o{_failure = v}))
        parse'_error
         = P'.try
            (do
               v <- P'.getT "error"
               Prelude'.return (\ o -> o{_error = v}))