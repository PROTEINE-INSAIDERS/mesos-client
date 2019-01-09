{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetAgents.Agent
       (Agent(..), agent_info, active, version, pid, registered_time, reregistered_time, total_resources, allocated_resources,
        offered_resources, capabilities, resource_providers)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Response.GetAgents.Agent.ResourceProvider as Protos.Response.GetAgents.Agent
       (ResourceProvider)
import qualified Mesos.V1.Protos.AgentInfo as Protos (AgentInfo)
import qualified Mesos.V1.Protos.AgentInfo.Capability as Protos.AgentInfo (Capability)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.TimeInfo as Protos (TimeInfo)

data Agent = Agent{_agent_info :: !(Protos.AgentInfo), _active :: !(P'.Bool), _version :: !(P'.Utf8), _pid :: !(P'.Maybe P'.Utf8),
                   _registered_time :: !(P'.Maybe Protos.TimeInfo), _reregistered_time :: !(P'.Maybe Protos.TimeInfo),
                   _total_resources :: !(P'.Seq Protos.Resource), _allocated_resources :: !(P'.Seq Protos.Resource),
                   _offered_resources :: !(P'.Seq Protos.Resource), _capabilities :: !(P'.Seq Protos.AgentInfo.Capability),
                   _resource_providers :: !(P'.Seq Protos.Response.GetAgents.Agent.ResourceProvider)}
             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Agent

instance P'.ToJSON Agent where
  toJSON msg
   = P'.objectNoEmpty
      ([("agent_info", P'.toJSON (agent_info msg)), ("active", P'.toJSON (active msg)), ("version", P'.toJSON (version msg)),
        ("pid", P'.toJSON (Prelude'.fmap P'.toJSON (pid msg))),
        ("registered_time", P'.toJSON (Prelude'.fmap P'.toJSON (registered_time msg))),
        ("reregistered_time", P'.toJSON (Prelude'.fmap P'.toJSON (reregistered_time msg))),
        ("total_resources", P'.toJSON (Prelude'.fmap P'.toJSON (total_resources msg))),
        ("allocated_resources", P'.toJSON (Prelude'.fmap P'.toJSON (allocated_resources msg))),
        ("offered_resources", P'.toJSON (Prelude'.fmap P'.toJSON (offered_resources msg))),
        ("capabilities", P'.toJSON (Prelude'.fmap P'.toJSON (capabilities msg))),
        ("resource_providers", P'.toJSON (Prelude'.fmap P'.toJSON (resource_providers msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Agent where
  parseJSON
   = P'.withObject "Agent"
      (\ o ->
        do
          agent_info <- P'.explicitParseField P'.parseJSON o "agent_info"
          active <- P'.explicitParseField P'.parseJSONBool o "active"
          version <- P'.explicitParseField P'.parseJSON o "version"
          pid <- P'.explicitParseFieldMaybe P'.parseJSON o "pid"
          registered_time <- P'.explicitParseFieldMaybe P'.parseJSON o "registered_time"
          reregistered_time <- P'.explicitParseFieldMaybe P'.parseJSON o "reregistered_time"
          total_resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                              (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "total_resources")
          allocated_resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                  (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                    "allocated_resources")
          offered_resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "offered_resources")
          capabilities <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "capabilities")
          resource_providers <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                 (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                   "resource_providers")
          Prelude'.return
           P'.defaultValue{_agent_info = agent_info, _active = active, _version = version, _pid = pid,
                           _registered_time = registered_time, _reregistered_time = reregistered_time,
                           _total_resources = total_resources, _allocated_resources = allocated_resources,
                           _offered_resources = offered_resources, _capabilities = capabilities,
                           _resource_providers = resource_providers})

instance P'.Mergeable Agent where
  mergeAppend (Agent x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11) (Agent y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11)
   = Agent (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)

instance P'.Default Agent where
  defaultValue
   = Agent P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Agent where
  wireSize ft' self'@(Agent x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 8 x'2 + P'.wireSizeReq 1 9 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeRep 1 11 x'9
             + P'.wireSizeRep 1 11 x'10
             + P'.wireSizeRep 1 11 x'11)
  wirePutWithSize ft' self'@(Agent x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 16 8 x'2, P'.wirePutReqWithSize 26 9 x'3,
             P'.wirePutOptWithSize 34 9 x'4, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutOptWithSize 50 11 x'6,
             P'.wirePutRepWithSize 58 11 x'7, P'.wirePutRepWithSize 66 11 x'8, P'.wirePutRepWithSize 74 11 x'9,
             P'.wirePutRepWithSize 82 11 x'10, P'.wirePutRepWithSize 90 11 x'11]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_agent_info = P'.mergeAppend (_agent_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_active = new'Field}) (P'.wireGet 8)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_version = new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_pid = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_registered_time = P'.mergeAppend (_registered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_reregistered_time = P'.mergeAppend (_reregistered_time old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_total_resources = P'.append (_total_resources old'Self) new'Field})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_allocated_resources = P'.append (_allocated_resources old'Self) new'Field})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_offered_resources = P'.append (_offered_resources old'Self) new'Field})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_capabilities = P'.append (_capabilities old'Self) new'Field})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_resource_providers = P'.append (_resource_providers old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Agent) Agent where
  getVal m' f' = f' m'

instance P'.GPB Agent

instance P'.ReflectDescriptor Agent where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16, 26]) (P'.fromDistinctAscList [10, 16, 26, 34, 42, 50, 58, 66, 74, 82, 90])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents.Agent\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetAgents\"], baseName = MName \"Agent\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetAgents\",\"Agent.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.agent_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"agent_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.active\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"active\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.version\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"version\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.pid\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"pid\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.registered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"registered_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.reregistered_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"reregistered_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TimeInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TimeInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.total_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"total_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.allocated_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"allocated_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.offered_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"offered_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.capabilities\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"capabilities\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentInfo.Capability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"AgentInfo\"], baseName = MName \"Capability\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.Agent.resource_providers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName' = FName \"resource_providers\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents.Agent.ResourceProvider\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetAgents\",MName \"Agent\"], baseName = MName \"ResourceProvider\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Agent where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Agent where
  textPut msg
   = do
       P'.tellT "agent_info" (_agent_info msg)
       P'.tellT "active" (_active msg)
       P'.tellT "version" (_version msg)
       P'.tellT "pid" (_pid msg)
       P'.tellT "registered_time" (_registered_time msg)
       P'.tellT "reregistered_time" (_reregistered_time msg)
       P'.tellT "total_resources" (_total_resources msg)
       P'.tellT "allocated_resources" (_allocated_resources msg)
       P'.tellT "offered_resources" (_offered_resources msg)
       P'.tellT "capabilities" (_capabilities msg)
       P'.tellT "resource_providers" (_resource_providers msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_agent_info, parse'_active, parse'_version, parse'_pid, parse'_registered_time, parse'_reregistered_time,
                   parse'_total_resources, parse'_allocated_resources, parse'_offered_resources, parse'_capabilities,
                   parse'_resource_providers])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_agent_info
         = P'.try
            (do
               v <- P'.getT "agent_info"
               Prelude'.return (\ o -> o{_agent_info = v}))
        parse'_active
         = P'.try
            (do
               v <- P'.getT "active"
               Prelude'.return (\ o -> o{_active = v}))
        parse'_version
         = P'.try
            (do
               v <- P'.getT "version"
               Prelude'.return (\ o -> o{_version = v}))
        parse'_pid
         = P'.try
            (do
               v <- P'.getT "pid"
               Prelude'.return (\ o -> o{_pid = v}))
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
        parse'_total_resources
         = P'.try
            (do
               v <- P'.getT "total_resources"
               Prelude'.return (\ o -> o{_total_resources = P'.append (_total_resources o) v}))
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
        parse'_capabilities
         = P'.try
            (do
               v <- P'.getT "capabilities"
               Prelude'.return (\ o -> o{_capabilities = P'.append (_capabilities o) v}))
        parse'_resource_providers
         = P'.try
            (do
               v <- P'.getT "resource_providers"
               Prelude'.return (\ o -> o{_resource_providers = P'.append (_resource_providers o) v}))