{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Response.GetAgents (GetAgents(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.AgentInfo as Protos (AgentInfo)
import qualified Mesos.V1.Protos.Response.GetAgents.Agent as Protos.Response.GetAgents (Agent)

data GetAgents = GetAgents{agents :: !(P'.Seq Protos.Response.GetAgents.Agent), recovered_agents :: !(P'.Seq Protos.AgentInfo)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable GetAgents where
  mergeAppend (GetAgents x'1 x'2) (GetAgents y'1 y'2) = GetAgents (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default GetAgents where
  defaultValue = GetAgents P'.defaultValue P'.defaultValue

instance P'.Wire GetAgents where
  wireSize ft' self'@(GetAgents x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(GetAgents x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{agents = P'.append (agents old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{recovered_agents = P'.append (recovered_agents old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetAgents) GetAgents where
  getVal m' f' = f' m'

instance P'.GPB GetAgents

instance P'.ReflectDescriptor GetAgents where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetAgents\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Response\",\"GetAgents.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.agents\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\"], baseName' = FName \"agents\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents.Agent\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetAgents\"], baseName = MName \"Agent\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetAgents.recovered_agents\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetAgents\"], baseName' = FName \"recovered_agents\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType GetAgents where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetAgents where
  textPut msg
   = do
       P'.tellT "agents" (agents msg)
       P'.tellT "recovered_agents" (recovered_agents msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'agents, parse'recovered_agents]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'agents
         = P'.try
            (do
               v <- P'.getT "agents"
               Prelude'.return (\ o -> o{agents = P'.append (agents o) v}))
        parse'recovered_agents
         = P'.try
            (do
               v <- P'.getT "recovered_agents"
               Prelude'.return (\ o -> o{recovered_agents = P'.append (recovered_agents o) v}))