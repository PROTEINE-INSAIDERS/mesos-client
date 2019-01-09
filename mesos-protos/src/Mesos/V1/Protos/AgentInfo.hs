{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.AgentInfo (AgentInfo(..), hostname, port, resources, attributes, id, domain) where
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
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data AgentInfo = AgentInfo{_hostname :: !(P'.Utf8), _port :: !(P'.Maybe P'.Int32), _resources :: !(P'.Seq Protos.Resource),
                           _attributes :: !(P'.Seq Protos.Attribute), _id :: !(P'.Maybe Protos.AgentID),
                           _domain :: !(P'.Maybe Protos.DomainInfo)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''AgentInfo

instance P'.ToJSON AgentInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("hostname", P'.toJSON (hostname msg)), ("port", P'.toJSON (Prelude'.fmap P'.toJSON (port msg))),
        ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg))),
        ("attributes", P'.toJSON (Prelude'.fmap P'.toJSON (attributes msg))), ("id", P'.toJSON (Prelude'.fmap P'.toJSON (id msg))),
        ("domain", P'.toJSON (Prelude'.fmap P'.toJSON (domain msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON AgentInfo where
  parseJSON
   = P'.withObject "AgentInfo"
      (\ o ->
        do
          hostname <- P'.explicitParseField P'.parseJSON o "hostname"
          port <- do
                    tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "port"
                    Prelude'.return (Prelude'.maybe (Prelude'.Just (5051)) Prelude'.Just tmp)
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          attributes <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "attributes")
          id <- P'.explicitParseFieldMaybe P'.parseJSON o "id"
          domain <- P'.explicitParseFieldMaybe P'.parseJSON o "domain"
          Prelude'.return
           P'.defaultValue{_hostname = hostname, _port = port, _resources = resources, _attributes = attributes, _id = id,
                           _domain = domain})

instance P'.Mergeable AgentInfo where
  mergeAppend (AgentInfo x'1 x'2 x'3 x'4 x'5 x'6) (AgentInfo y'1 y'2 y'3 y'4 y'5 y'6)
   = AgentInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)

instance P'.Default AgentInfo where
  defaultValue = AgentInfo P'.defaultValue (Prelude'.Just 5051) P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire AgentInfo where
  wireSize ft' self'@(AgentInfo x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6)
  wirePutWithSize ft' self'@(AgentInfo x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutRepWithSize 26 11 x'3, P'.wirePutRepWithSize 42 11 x'4,
             P'.wirePutOptWithSize 50 11 x'5, P'.wirePutOptWithSize 64 5 x'2, P'.wirePutOptWithSize 82 11 x'6]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_hostname = new'Field}) (P'.wireGet 9)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_port = Prelude'.Just new'Field}) (P'.wireGet 5)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_attributes = P'.append (_attributes old'Self) new'Field})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = P'.mergeAppend (_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_domain = P'.mergeAppend (_domain old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AgentInfo) AgentInfo where
  getVal m' f' = f' m'

instance P'.GPB AgentInfo

instance P'.ReflectDescriptor AgentInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 26, 42, 50, 64, 82])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.AgentInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"AgentInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.AgentInfo.hostname\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"AgentInfo\"], baseName' = FName \"hostname\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.AgentInfo.port\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"AgentInfo\"], baseName' = FName \"port\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"5051\", hsDefault = Just (HsDef'Integer 5051)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.AgentInfo.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"AgentInfo\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.AgentInfo.attributes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"AgentInfo\"], baseName' = FName \"attributes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Attribute\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Attribute\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.AgentInfo.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"AgentInfo\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.AgentInfo.domain\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"AgentInfo\"], baseName' = FName \"domain\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DomainInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DomainInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType AgentInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AgentInfo where
  textPut msg
   = do
       P'.tellT "hostname" (_hostname msg)
       P'.tellT "port" (_port msg)
       P'.tellT "resources" (_resources msg)
       P'.tellT "attributes" (_attributes msg)
       P'.tellT "id" (_id msg)
       P'.tellT "domain" (_domain msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_hostname, parse'_port, parse'_resources, parse'_attributes, parse'_id, parse'_domain])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{_hostname = v}))
        parse'_port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{_port = v}))
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
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_domain
         = P'.try
            (do
               v <- P'.getT "domain"
               Prelude'.return (\ o -> o{_domain = v}))