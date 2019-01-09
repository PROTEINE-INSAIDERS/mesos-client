{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Event.AgentAdded (AgentAdded(..), agent) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Response.GetAgents.Agent as Protos.Response.GetAgents (Agent)

data AgentAdded = AgentAdded{_agent :: !(Protos.Response.GetAgents.Agent)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''AgentAdded

instance P'.ToJSON AgentAdded where
  toJSON msg = P'.objectNoEmpty ([("agent", P'.toJSON (agent msg))] ++ Prelude'.concat [])

instance P'.FromJSON AgentAdded where
  parseJSON
   = P'.withObject "AgentAdded"
      (\ o ->
        do
          agent <- P'.explicitParseField P'.parseJSON o "agent"
          Prelude'.return P'.defaultValue{_agent = agent})

instance P'.Mergeable AgentAdded where
  mergeAppend (AgentAdded x'1) (AgentAdded y'1) = AgentAdded (P'.mergeAppend x'1 y'1)

instance P'.Default AgentAdded where
  defaultValue = AgentAdded P'.defaultValue

instance P'.Wire AgentAdded where
  wireSize ft' self'@(AgentAdded x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(AgentAdded x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_agent = P'.mergeAppend (_agent old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AgentAdded) AgentAdded where
  getVal m' f' = f' m'

instance P'.GPB AgentAdded

instance P'.ReflectDescriptor AgentAdded where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Event.AgentAdded\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"AgentAdded\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Event\",\"AgentAdded.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.AgentAdded.agent\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"AgentAdded\"], baseName' = FName \"agent\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents.Agent\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetAgents\"], baseName = MName \"Agent\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType AgentAdded where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AgentAdded where
  textPut msg
   = do
       P'.tellT "agent" (_agent msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_agent]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_agent
         = P'.try
            (do
               v <- P'.getT "agent"
               Prelude'.return (\ o -> o{_agent = v}))