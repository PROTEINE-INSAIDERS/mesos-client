{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.InverseOffer (InverseOffer(..), id, url, framework_id, agent_id, unavailability, resources) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.OfferID as Protos (OfferID)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.URL as Protos (URL)
import qualified Mesos.V1.Protos.Unavailability as Protos (Unavailability)

data InverseOffer = InverseOffer{_id :: !(Protos.OfferID), _url :: !(P'.Maybe Protos.URL), _framework_id :: !(Protos.FrameworkID),
                                 _agent_id :: !(P'.Maybe Protos.AgentID), _unavailability :: !(Protos.Unavailability),
                                 _resources :: !(P'.Seq Protos.Resource)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''InverseOffer

instance P'.ToJSON InverseOffer where
  toJSON msg
   = P'.objectNoEmpty
      ([("id", P'.toJSON (id msg)), ("url", P'.toJSON (Prelude'.fmap P'.toJSON (url msg))),
        ("framework_id", P'.toJSON (framework_id msg)), ("agent_id", P'.toJSON (Prelude'.fmap P'.toJSON (agent_id msg))),
        ("unavailability", P'.toJSON (unavailability msg)), ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON InverseOffer where
  parseJSON
   = P'.withObject "InverseOffer"
      (\ o ->
        do
          id <- P'.explicitParseField P'.parseJSON o "id"
          url <- P'.explicitParseFieldMaybe P'.parseJSON o "url"
          framework_id <- P'.explicitParseField P'.parseJSON o "framework_id"
          agent_id <- P'.explicitParseFieldMaybe P'.parseJSON o "agent_id"
          unavailability <- P'.explicitParseField P'.parseJSON o "unavailability"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          Prelude'.return
           P'.defaultValue{_id = id, _url = url, _framework_id = framework_id, _agent_id = agent_id,
                           _unavailability = unavailability, _resources = resources})

instance P'.Mergeable InverseOffer where
  mergeAppend (InverseOffer x'1 x'2 x'3 x'4 x'5 x'6) (InverseOffer y'1 y'2 y'3 y'4 y'5 y'6)
   = InverseOffer (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default InverseOffer where
  defaultValue = InverseOffer P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire InverseOffer where
  wireSize ft' self'@(InverseOffer x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeReq 1 11 x'5
             + P'.wireSizeRep 1 11 x'6)
  wirePutWithSize ft' self'@(InverseOffer x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutReqWithSize 42 11 x'5, P'.wirePutRepWithSize 50 11 x'6]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = P'.mergeAppend (_id old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_url = P'.mergeAppend (_url old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_agent_id = P'.mergeAppend (_agent_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_unavailability = P'.mergeAppend (_unavailability old'Self) (new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> InverseOffer) InverseOffer where
  getVal m' f' = f' m'

instance P'.GPB InverseOffer

instance P'.ReflectDescriptor InverseOffer where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 26, 42]) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.InverseOffer\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"InverseOffer\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"InverseOffer.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.InverseOffer.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OfferID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OfferID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.InverseOffer.url\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"url\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.URL\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"URL\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.InverseOffer.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.InverseOffer.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.InverseOffer.unavailability\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"unavailability\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Unavailability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Unavailability\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.InverseOffer.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"InverseOffer\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType InverseOffer where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg InverseOffer where
  textPut msg
   = do
       P'.tellT "id" (_id msg)
       P'.tellT "url" (_url msg)
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "agent_id" (_agent_id msg)
       P'.tellT "unavailability" (_unavailability msg)
       P'.tellT "resources" (_resources msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice [parse'_id, parse'_url, parse'_framework_id, parse'_agent_id, parse'_unavailability, parse'_resources])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_url
         = P'.try
            (do
               v <- P'.getT "url"
               Prelude'.return (\ o -> o{_url = v}))
        parse'_framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{_framework_id = v}))
        parse'_agent_id
         = P'.try
            (do
               v <- P'.getT "agent_id"
               Prelude'.return (\ o -> o{_agent_id = v}))
        parse'_unavailability
         = P'.try
            (do
               v <- P'.getT "unavailability"
               Prelude'.return (\ o -> o{_unavailability = v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))