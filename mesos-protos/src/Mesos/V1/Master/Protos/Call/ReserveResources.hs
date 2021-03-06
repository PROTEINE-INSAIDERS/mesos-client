{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.ReserveResources (ReserveResources(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.AgentID as Protos (AgentID)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data ReserveResources = ReserveResources{agent_id :: !(Protos.AgentID), resources :: !(P'.Seq Protos.Resource)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON ReserveResources where
  toJSON msg
   = P'.objectNoEmpty
      ([("agent_id", P'.toJSON (agent_id msg)), ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg)))] ++
        Prelude'.concat [])

instance P'.FromJSON ReserveResources where
  parseJSON
   = P'.withObject "ReserveResources"
      (\ o ->
        do
          agent_id <- P'.explicitParseField P'.parseJSON o "agent_id"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          Prelude'.return P'.defaultValue{agent_id = agent_id, resources = resources})

instance P'.Mergeable ReserveResources where
  mergeAppend (ReserveResources x'1 x'2) (ReserveResources y'1 y'2)
   = ReserveResources (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default ReserveResources where
  defaultValue = ReserveResources P'.defaultValue P'.defaultValue

instance P'.Wire ReserveResources where
  wireSize ft' self'@(ReserveResources x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(ReserveResources x'1 x'2)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{agent_id = P'.mergeAppend (agent_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{resources = P'.append (resources old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ReserveResources) ReserveResources where
  getVal m' f' = f' m'

instance P'.GPB ReserveResources

instance P'.ReflectDescriptor ReserveResources where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call.ReserveResources\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReserveResources\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call\",\"ReserveResources.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.ReserveResources.agent_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"ReserveResources\"], baseName' = FName \"agent_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.AgentID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"AgentID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.ReserveResources.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"ReserveResources\"], baseName' = FName \"resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType ReserveResources where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ReserveResources where
  textPut msg
   = do
       P'.tellT "agent_id" (agent_id msg)
       P'.tellT "resources" (resources msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'agent_id, parse'resources]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'agent_id
         = P'.try
            (do
               v <- P'.getT "agent_id"
               Prelude'.return (\ o -> o{agent_id = v}))
        parse'resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{resources = P'.append (resources o) v}))