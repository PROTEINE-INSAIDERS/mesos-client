{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Offer
       (Offer(..), id, framework_id, agent_id, hostname, url, domain, resources, attributes, executor_ids, unavailability,
        allocation_info)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.Attribute as Protos (Attribute)
import qualified Mesos.V1.Protos.DomainInfo as Protos (DomainInfo)
import qualified Mesos.V1.Protos.ExecutorID as Protos (ExecutorID)
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.OfferID as Protos (OfferID)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.Resource.AllocationInfo as Protos.Resource (AllocationInfo)
import qualified Mesos.V1.Protos.URL as Protos (URL)
import qualified Mesos.V1.Protos.Unavailability as Protos (Unavailability)

data Offer = Offer{_id :: !(Protos.OfferID), _framework_id :: !(Protos.FrameworkID), _agent_id :: !(Protos.AgentID),
                   _hostname :: !(P'.Utf8), _url :: !(P'.Maybe Protos.URL), _domain :: !(P'.Maybe Protos.DomainInfo),
                   _resources :: !(P'.Seq Protos.Resource), _attributes :: !(P'.Seq Protos.Attribute),
                   _executor_ids :: !(P'.Seq Protos.ExecutorID), _unavailability :: !(P'.Maybe Protos.Unavailability),
                   _allocation_info :: !(P'.Maybe Protos.Resource.AllocationInfo)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Offer

instance P'.ToJSON Offer where
  toJSON msg
   = P'.objectNoEmpty
      ([("id", P'.toJSON (id msg)), ("framework_id", P'.toJSON (framework_id msg)), ("agent_id", P'.toJSON (agent_id msg)),
        ("hostname", P'.toJSON (hostname msg)), ("url", P'.toJSON (Prelude'.fmap P'.toJSON (url msg))),
        ("domain", P'.toJSON (Prelude'.fmap P'.toJSON (domain msg))),
        ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg))),
        ("attributes", P'.toJSON (Prelude'.fmap P'.toJSON (attributes msg))),
        ("executor_ids", P'.toJSON (Prelude'.fmap P'.toJSON (executor_ids msg))),
        ("unavailability", P'.toJSON (Prelude'.fmap P'.toJSON (unavailability msg))),
        ("allocation_info", P'.toJSON (Prelude'.fmap P'.toJSON (allocation_info msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Offer where
  parseJSON
   = P'.withObject "Offer"
      (\ o ->
        do
          id <- P'.explicitParseField P'.parseJSON o "id"
          framework_id <- P'.explicitParseField P'.parseJSON o "framework_id"
          agent_id <- P'.explicitParseField P'.parseJSON o "agent_id"
          hostname <- P'.explicitParseField P'.parseJSON o "hostname"
          url <- P'.explicitParseFieldMaybe P'.parseJSON o "url"
          domain <- P'.explicitParseFieldMaybe P'.parseJSON o "domain"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          attributes <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "attributes")
          executor_ids <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "executor_ids")
          unavailability <- P'.explicitParseFieldMaybe P'.parseJSON o "unavailability"
          allocation_info <- P'.explicitParseFieldMaybe P'.parseJSON o "allocation_info"
          Prelude'.return
           P'.defaultValue{_id = id, _framework_id = framework_id, _agent_id = agent_id, _hostname = hostname, _url = url,
                           _domain = domain, _resources = resources, _attributes = attributes, _executor_ids = executor_ids,
                           _unavailability = unavailability, _allocation_info = allocation_info})

instance P'.Mergeable Offer where
  mergeAppend (Offer x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11) (Offer y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11)
   = Offer (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)

instance P'.Default Offer where
  defaultValue
   = Offer P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Offer where
  wireSize ft' self'@(Offer x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeReq 1 11 x'3 + P'.wireSizeReq 1 9 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeRep 1 11 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11)
  wirePutWithSize ft' self'@(Offer x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutReqWithSize 26 11 x'3,
             P'.wirePutReqWithSize 34 9 x'4, P'.wirePutRepWithSize 42 11 x'7, P'.wirePutRepWithSize 50 11 x'9,
             P'.wirePutRepWithSize 58 11 x'8, P'.wirePutOptWithSize 66 11 x'5, P'.wirePutOptWithSize 74 11 x'10,
             P'.wirePutOptWithSize 82 11 x'11, P'.wirePutOptWithSize 90 11 x'6]
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
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_id = P'.mergeAppend (_framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_agent_id = P'.mergeAppend (_agent_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_hostname = new'Field}) (P'.wireGet 9)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_url = P'.mergeAppend (_url old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{_domain = P'.mergeAppend (_domain old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_attributes = P'.append (_attributes old'Self) new'Field})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_executor_ids = P'.append (_executor_ids old'Self) new'Field})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_unavailability = P'.mergeAppend (_unavailability old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_allocation_info = P'.mergeAppend (_allocation_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Offer) Offer where
  getVal m' f' = f' m'

instance P'.GPB Offer

instance P'.ReflectDescriptor Offer where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18, 26, 34])
      (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50, 58, 66, 74, 82, 90])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Offer\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Offer\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Offer.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OfferID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OfferID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.hostname\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"hostname\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.url\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"url\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.URL\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"URL\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.domain\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"domain\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DomainInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DomainInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.attributes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"attributes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Attribute\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Attribute\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.executor_ids\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"executor_ids\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.unavailability\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"unavailability\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Unavailability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Unavailability\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.allocation_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\"], baseName' = FName \"allocation_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.AllocationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"AllocationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Offer where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Offer where
  textPut msg
   = do
       P'.tellT "id" (_id msg)
       P'.tellT "framework_id" (_framework_id msg)
       P'.tellT "agent_id" (_agent_id msg)
       P'.tellT "hostname" (_hostname msg)
       P'.tellT "url" (_url msg)
       P'.tellT "domain" (_domain msg)
       P'.tellT "resources" (_resources msg)
       P'.tellT "attributes" (_attributes msg)
       P'.tellT "executor_ids" (_executor_ids msg)
       P'.tellT "unavailability" (_unavailability msg)
       P'.tellT "allocation_info" (_allocation_info msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_id, parse'_framework_id, parse'_agent_id, parse'_hostname, parse'_url, parse'_domain, parse'_resources,
                   parse'_attributes, parse'_executor_ids, parse'_unavailability, parse'_allocation_info])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
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
        parse'_hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{_hostname = v}))
        parse'_url
         = P'.try
            (do
               v <- P'.getT "url"
               Prelude'.return (\ o -> o{_url = v}))
        parse'_domain
         = P'.try
            (do
               v <- P'.getT "domain"
               Prelude'.return (\ o -> o{_domain = v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))
        parse'_attributes
         = P'.try
            (do
               v <- P'.getT "attributes"
               Prelude'.return (\ o -> o{_attributes = P'.append (_attributes o) v}))
        parse'_executor_ids
         = P'.try
            (do
               v <- P'.getT "executor_ids"
               Prelude'.return (\ o -> o{_executor_ids = P'.append (_executor_ids o) v}))
        parse'_unavailability
         = P'.try
            (do
               v <- P'.getT "unavailability"
               Prelude'.return (\ o -> o{_unavailability = v}))
        parse'_allocation_info
         = P'.try
            (do
               v <- P'.getT "allocation_info"
               Prelude'.return (\ o -> o{_allocation_info = v}))