{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetAgents.Agent.ResourceProvider (ResourceProvider(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.ResourceProviderInfo as Protos (ResourceProviderInfo)

data ResourceProvider = ResourceProvider{resource_provider_info :: !(Protos.ResourceProviderInfo),
                                         total_resources :: !(P'.Seq Protos.Resource)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON ResourceProvider where
  toJSON msg
   = P'.objectNoEmpty
      ([("resource_provider_info", P'.toJSON (resource_provider_info msg)),
        ("total_resources", P'.toJSON (Prelude'.fmap P'.toJSON (total_resources msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ResourceProvider where
  parseJSON
   = P'.withObject "ResourceProvider"
      (\ o ->
        do
          resource_provider_info <- P'.explicitParseField P'.parseJSON o "resource_provider_info"
          total_resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                              (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "total_resources")
          Prelude'.return P'.defaultValue{resource_provider_info = resource_provider_info, total_resources = total_resources})

instance P'.Mergeable ResourceProvider where
  mergeAppend (ResourceProvider x'1 x'2) (ResourceProvider y'1 y'2)
   = ResourceProvider (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default ResourceProvider where
  defaultValue = ResourceProvider P'.defaultValue P'.defaultValue

instance P'.Wire ResourceProvider where
  wireSize ft' self'@(ResourceProvider x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(ResourceProvider x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{resource_provider_info = P'.mergeAppend (resource_provider_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{total_resources = P'.append (total_resources old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ResourceProvider) ResourceProvider where
  getVal m' f' = f' m'

instance P'.GPB ResourceProvider

instance P'.ReflectDescriptor ResourceProvider where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents.Agent.ResourceProvider\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName = MName \"ResourceProvider\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetAgents\",\"Agent\",\"ResourceProvider.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.ResourceProvider.resource_provider_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\",MName \"ResourceProvider\"], baseName' = FName \"resource_provider_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ResourceProviderInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ResourceProviderInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.ResourceProvider.total_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\",MName \"ResourceProvider\"], baseName' = FName \"total_resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType ResourceProvider where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ResourceProvider where
  textPut msg
   = do
       P'.tellT "resource_provider_info" (resource_provider_info msg)
       P'.tellT "total_resources" (total_resources msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'resource_provider_info, parse'total_resources]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'resource_provider_info
         = P'.try
            (do
               v <- P'.getT "resource_provider_info"
               Prelude'.return (\ o -> o{resource_provider_info = v}))
        parse'total_resources
         = P'.try
            (do
               v <- P'.getT "total_resources"
               Prelude'.return (\ o -> o{total_resources = P'.append (total_resources o) v}))