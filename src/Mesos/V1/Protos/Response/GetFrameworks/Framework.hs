{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Response.GetFrameworks.Framework (Framework(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.FrameworkInfo as Protos (FrameworkInfo)
import qualified Mesos.V1.Protos.InverseOffer as Protos (InverseOffer)
import qualified Mesos.V1.Protos.Offer as Protos (Offer)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.TimeInfo as Protos (TimeInfo)

data Framework = Framework{framework_info :: !(Protos.FrameworkInfo), active :: !(P'.Bool), connected :: !(P'.Bool),
                           recovered :: !(P'.Bool), registered_time :: !(P'.Maybe Protos.TimeInfo),
                           reregistered_time :: !(P'.Maybe Protos.TimeInfo), unregistered_time :: !(P'.Maybe Protos.TimeInfo),
                           offers :: !(P'.Seq Protos.Offer), inverse_offers :: !(P'.Seq Protos.InverseOffer),
                           allocated_resources :: !(P'.Seq Protos.Resource), offered_resources :: !(P'.Seq Protos.Resource)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

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
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{framework_info = P'.mergeAppend (framework_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{active = new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{connected = new'Field}) (P'.wireGet 8)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{recovered = new'Field}) (P'.wireGet 8)
             34 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{registered_time = P'.mergeAppend (registered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{reregistered_time = P'.mergeAppend (reregistered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{unregistered_time = P'.mergeAppend (unregistered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{offers = P'.append (offers old'Self) new'Field}) (P'.wireGet 11)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{inverse_offers = P'.append (inverse_offers old'Self) new'Field})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{allocated_resources = P'.append (allocated_resources old'Self) new'Field})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{offered_resources = P'.append (offered_resources old'Self) new'Field})
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
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks.Framework\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName = MName \"Framework\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Response\",\"GetFrameworks\",\"Framework.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.framework_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"framework_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.active\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"active\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.connected\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"connected\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.recovered\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"recovered\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.registered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"registered_time\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.reregistered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"reregistered_time\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.unregistered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"unregistered_time\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"offers\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Offer\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.inverse_offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"inverse_offers\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.InverseOffer\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"InverseOffer\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.allocated_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"allocated_resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.Framework.offered_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\",MName \"Framework\"], baseName' = FName \"offered_resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Framework where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Framework where
  textPut msg
   = do
       P'.tellT "framework_info" (framework_info msg)
       P'.tellT "active" (active msg)
       P'.tellT "connected" (connected msg)
       P'.tellT "recovered" (recovered msg)
       P'.tellT "registered_time" (registered_time msg)
       P'.tellT "reregistered_time" (reregistered_time msg)
       P'.tellT "unregistered_time" (unregistered_time msg)
       P'.tellT "offers" (offers msg)
       P'.tellT "inverse_offers" (inverse_offers msg)
       P'.tellT "allocated_resources" (allocated_resources msg)
       P'.tellT "offered_resources" (offered_resources msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'framework_info, parse'active, parse'connected, parse'recovered, parse'registered_time,
                   parse'reregistered_time, parse'unregistered_time, parse'offers, parse'inverse_offers, parse'allocated_resources,
                   parse'offered_resources])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'framework_info
         = P'.try
            (do
               v <- P'.getT "framework_info"
               Prelude'.return (\ o -> o{framework_info = v}))
        parse'active
         = P'.try
            (do
               v <- P'.getT "active"
               Prelude'.return (\ o -> o{active = v}))
        parse'connected
         = P'.try
            (do
               v <- P'.getT "connected"
               Prelude'.return (\ o -> o{connected = v}))
        parse'recovered
         = P'.try
            (do
               v <- P'.getT "recovered"
               Prelude'.return (\ o -> o{recovered = v}))
        parse'registered_time
         = P'.try
            (do
               v <- P'.getT "registered_time"
               Prelude'.return (\ o -> o{registered_time = v}))
        parse'reregistered_time
         = P'.try
            (do
               v <- P'.getT "reregistered_time"
               Prelude'.return (\ o -> o{reregistered_time = v}))
        parse'unregistered_time
         = P'.try
            (do
               v <- P'.getT "unregistered_time"
               Prelude'.return (\ o -> o{unregistered_time = v}))
        parse'offers
         = P'.try
            (do
               v <- P'.getT "offers"
               Prelude'.return (\ o -> o{offers = P'.append (offers o) v}))
        parse'inverse_offers
         = P'.try
            (do
               v <- P'.getT "inverse_offers"
               Prelude'.return (\ o -> o{inverse_offers = P'.append (inverse_offers o) v}))
        parse'allocated_resources
         = P'.try
            (do
               v <- P'.getT "allocated_resources"
               Prelude'.return (\ o -> o{allocated_resources = P'.append (allocated_resources o) v}))
        parse'offered_resources
         = P'.try
            (do
               v <- P'.getT "offered_resources"
               Prelude'.return (\ o -> o{offered_resources = P'.append (offered_resources o) v}))