{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetFrameworks.Framework
       (Framework(..), framework_info, active, connected, recovered, registered_time, reregistered_time, unregistered_time, offers,
        inverse_offers, allocated_resources, offered_resources)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.FrameworkInfo as Protos (FrameworkInfo)
import qualified Mesos.V1.Protos.InverseOffer as Protos (InverseOffer)
import qualified Mesos.V1.Protos.Offer as Protos (Offer)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.TimeInfo as Protos (TimeInfo)

data Framework = Framework{_framework_info :: !(Protos.FrameworkInfo), _active :: !(P'.Bool), _connected :: !(P'.Bool),
                           _recovered :: !(P'.Bool), _registered_time :: !(P'.Maybe Protos.TimeInfo),
                           _reregistered_time :: !(P'.Maybe Protos.TimeInfo), _unregistered_time :: !(P'.Maybe Protos.TimeInfo),
                           _offers :: !(P'.Seq Protos.Offer), _inverse_offers :: !(P'.Seq Protos.InverseOffer),
                           _allocated_resources :: !(P'.Seq Protos.Resource), _offered_resources :: !(P'.Seq Protos.Resource)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Framework

instance P'.ToJSON Framework where
  toJSON msg
   = P'.objectNoEmpty
      ([("framework_info", P'.toJSON (framework_info msg)), ("active", P'.toJSON (active msg)),
        ("connected", P'.toJSON (connected msg)), ("recovered", P'.toJSON (recovered msg)),
        ("registered_time", P'.toJSON (Prelude'.fmap P'.toJSON (registered_time msg))),
        ("reregistered_time", P'.toJSON (Prelude'.fmap P'.toJSON (reregistered_time msg))),
        ("unregistered_time", P'.toJSON (Prelude'.fmap P'.toJSON (unregistered_time msg))),
        ("offers", P'.toJSON (Prelude'.fmap P'.toJSON (offers msg))),
        ("inverse_offers", P'.toJSON (Prelude'.fmap P'.toJSON (inverse_offers msg))),
        ("allocated_resources", P'.toJSON (Prelude'.fmap P'.toJSON (allocated_resources msg))),
        ("offered_resources", P'.toJSON (Prelude'.fmap P'.toJSON (offered_resources msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Framework where
  parseJSON
   = P'.withObject "Framework"
      (\ o ->
        do
          framework_info <- P'.explicitParseField P'.parseJSON o "framework_info"
          active <- P'.explicitParseField P'.parseJSONBool o "active"
          connected <- P'.explicitParseField P'.parseJSONBool o "connected"
          recovered <- P'.explicitParseField P'.parseJSONBool o "recovered"
          registered_time <- P'.explicitParseFieldMaybe P'.parseJSON o "registered_time"
          reregistered_time <- P'.explicitParseFieldMaybe P'.parseJSON o "reregistered_time"
          unregistered_time <- P'.explicitParseFieldMaybe P'.parseJSON o "unregistered_time"
          offers <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                     (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "offers")
          inverse_offers <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                             (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "inverse_offers")
          allocated_resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                  (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                    "allocated_resources")
          offered_resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "offered_resources")
          Prelude'.return
           P'.defaultValue{_framework_info = framework_info, _active = active, _connected = connected, _recovered = recovered,
                           _registered_time = registered_time, _reregistered_time = reregistered_time,
                           _unregistered_time = unregistered_time, _offers = offers, _inverse_offers = inverse_offers,
                           _allocated_resources = allocated_resources, _offered_resources = offered_resources})

instance P'.Mergeable Framework where
  mergeAppend (Framework x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11) (Framework y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11)
   = Framework (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)

instance P'.Default Framework where
  defaultValue
   = Framework P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Framework where
  wireSize ft' self'@(Framework x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 8 x'2 + P'.wireSizeReq 1 8 x'3 + P'.wireSizeReq 1 8 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeRep 1 11 x'9
             + P'.wireSizeRep 1 11 x'10
             + P'.wireSizeRep 1 11 x'11)
  wirePutWithSize ft' self'@(Framework x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 16 8 x'2, P'.wirePutReqWithSize 24 8 x'3,
             P'.wirePutOptWithSize 34 11 x'5, P'.wirePutOptWithSize 42 11 x'6, P'.wirePutOptWithSize 50 11 x'7,
             P'.wirePutRepWithSize 58 11 x'8, P'.wirePutRepWithSize 66 11 x'9, P'.wirePutRepWithSize 74 11 x'10,
             P'.wirePutRepWithSize 82 11 x'11, P'.wirePutReqWithSize 88 8 x'4]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_info = P'.mergeAppend (_framework_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_active = new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_connected = new'Field}) (P'.wireGet 8)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_recovered = new'Field}) (P'.wireGet 8)
             34 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_registered_time = P'.mergeAppend (_registered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_reregistered_time = P'.mergeAppend (_reregistered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_unregistered_time = P'.mergeAppend (_unregistered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_offers = P'.append (_offers old'Self) new'Field}) (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_inverse_offers = P'.append (_inverse_offers old'Self) new'Field})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_allocated_resources = P'.append (_allocated_resources old'Self) new'Field})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_offered_resources = P'.append (_offered_resources old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Framework) Framework where
  getVal m' f' = f' m'

instance P'.GPB Framework

instance P'.ReflectDescriptor Framework where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 24, 88])
      (P'.fromDistinctAscList [10, 16, 24, 34, 42, 50, 58, 66, 74, 82, 88])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks.Framework\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName = MName \"Framework\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetFrameworks\",\"Framework.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.framework_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"framework_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.active\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"active\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.connected\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"connected\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.recovered\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"recovered\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.registered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"registered_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.reregistered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"reregistered_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.unregistered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"unregistered_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"offers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Offer\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.inverse_offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"inverse_offers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.InverseOffer\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"InverseOffer\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.allocated_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"allocated_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.offered_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"offered_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Framework where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Framework where
  textPut msg
   = do
       P'.tellT "framework_info" (_framework_info msg)
       P'.tellT "active" (_active msg)
       P'.tellT "connected" (_connected msg)
       P'.tellT "recovered" (_recovered msg)
       P'.tellT "registered_time" (_registered_time msg)
       P'.tellT "reregistered_time" (_reregistered_time msg)
       P'.tellT "unregistered_time" (_unregistered_time msg)
       P'.tellT "offers" (_offers msg)
       P'.tellT "inverse_offers" (_inverse_offers msg)
       P'.tellT "allocated_resources" (_allocated_resources msg)
       P'.tellT "offered_resources" (_offered_resources msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_framework_info, parse'_active, parse'_connected, parse'_recovered, parse'_registered_time,
                   parse'_reregistered_time, parse'_unregistered_time, parse'_offers, parse'_inverse_offers,
                   parse'_allocated_resources, parse'_offered_resources])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_framework_info
         = P'.try
            (do
               v <- P'.getT "framework_info"
               Prelude'.return (\ o -> o{_framework_info = v}))
        parse'_active
         = P'.try
            (do
               v <- P'.getT "active"
               Prelude'.return (\ o -> o{_active = v}))
        parse'_connected
         = P'.try
            (do
               v <- P'.getT "connected"
               Prelude'.return (\ o -> o{_connected = v}))
        parse'_recovered
         = P'.try
            (do
               v <- P'.getT "recovered"
               Prelude'.return (\ o -> o{_recovered = v}))
        parse'_registered_time
         = P'.try
            (do
               v <- P'.getT "registered_time"
               Prelude'.return (\ o -> o{_registered_time = v}))
        parse'_reregistered_time
         = P'.try
            (do
               v <- P'.getT "reregistered_time"
               Prelude'.return (\ o -> o{_reregistered_time = v}))
        parse'_unregistered_time
         = P'.try
            (do
               v <- P'.getT "unregistered_time"
               Prelude'.return (\ o -> o{_unregistered_time = v}))
        parse'_offers
         = P'.try
            (do
               v <- P'.getT "offers"
               Prelude'.return (\ o -> o{_offers = P'.append (_offers o) v}))
        parse'_inverse_offers
         = P'.try
            (do
               v <- P'.getT "inverse_offers"
               Prelude'.return (\ o -> o{_inverse_offers = P'.append (_inverse_offers o) v}))
        parse'_allocated_resources
         = P'.try
            (do
               v <- P'.getT "allocated_resources"
               Prelude'.return (\ o -> o{_allocated_resources = P'.append (_allocated_resources o) v}))
        parse'_offered_resources
         = P'.try
            (do
               v <- P'.getT "offered_resources"
               Prelude'.return (\ o -> o{_offered_resources = P'.append (_offered_resources o) v}))