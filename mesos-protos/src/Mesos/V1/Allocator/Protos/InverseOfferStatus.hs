{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Allocator.Protos.InverseOfferStatus (InverseOfferStatus(..), status, framework_id, timestamp) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Allocator.Protos.InverseOfferStatus.Status as Protos.InverseOfferStatus (Status)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.TimeInfo as Protos (TimeInfo)

data InverseOfferStatus = InverseOfferStatus{_status :: !(Protos.InverseOfferStatus.Status), _framework_id :: !(Protos.FrameworkID),
                                             _timestamp :: !(Protos.TimeInfo)}
                          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''InverseOfferStatus

instance P'.ToJSON InverseOfferStatus where
  toJSON msg
   = P'.objectNoEmpty
      ([("status", P'.toJSON (status msg)), ("framework_id", P'.toJSON (framework_id msg)),
        ("timestamp", P'.toJSON (timestamp msg))]
        ++ Prelude'.concat [])

instance P'.FromJSON InverseOfferStatus where
  parseJSON
   = P'.withObject "InverseOfferStatus"
      (\ o ->
        do
          status <- P'.explicitParseField P'.parseJSON o "status"
          framework_id <- P'.explicitParseField P'.parseJSON o "framework_id"
          timestamp <- P'.explicitParseField P'.parseJSON o "timestamp"
          Prelude'.return P'.defaultValue{_status = status, _framework_id = framework_id, _timestamp = timestamp})

instance P'.Mergeable InverseOfferStatus where
  mergeAppend (InverseOfferStatus x'1 x'2 x'3) (InverseOfferStatus y'1 y'2 y'3)
   = InverseOfferStatus (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default InverseOfferStatus where
  defaultValue = InverseOfferStatus P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire InverseOfferStatus where
  wireSize ft' self'@(InverseOfferStatus x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 14 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeReq 1 11 x'3)
  wirePutWithSize ft' self'@(InverseOfferStatus x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 14 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_status = new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_timestamp = P'.mergeAppend (_timestamp old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> InverseOfferStatus) InverseOfferStatus where
  getVal m' f' = f' m'

instance P'.GPB InverseOfferStatus

instance P'.ReflectDescriptor InverseOfferStatus where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 18, 26]) (P'.fromDistinctAscList [8, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.allocator.InverseOfferStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Allocator\"], parentModule = [MName \"Protos\"], baseName = MName \"InverseOfferStatus\"}, descFilePath = [\"Mesos\",\"V1\",\"Allocator\",\"Protos\",\"InverseOfferStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.allocator.InverseOfferStatus.status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Allocator\"], parentModule' = [MName \"Protos\",MName \"InverseOfferStatus\"], baseName' = FName \"status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.allocator.InverseOfferStatus.Status\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Allocator\"], parentModule = [MName \"Protos\",MName \"InverseOfferStatus\"], baseName = MName \"Status\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.allocator.InverseOfferStatus.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Allocator\"], parentModule' = [MName \"Protos\",MName \"InverseOfferStatus\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.allocator.InverseOfferStatus.timestamp\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Allocator\"], parentModule' = [MName \"Protos\",MName \"InverseOfferStatus\"], baseName' = FName \"timestamp\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType InverseOfferStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg InverseOfferStatus where
  textPut msg
   = do
       P'.tellT "status" (_status msg)
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "timestamp" (_timestamp msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_status, parse'_framework_id, parse'_timestamp]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_status
         = P'.try
            (do
               v <- P'.getT "status"
               Prelude'.return (\ o -> o{_status = v}))
        parse'_framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{_framework_id = v}))
        parse'_timestamp
         = P'.try
            (do
               v <- P'.getT "timestamp"
               Prelude'.return (\ o -> o{_timestamp = v}))