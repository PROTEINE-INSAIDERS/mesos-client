{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetState (GetState(..), get_tasks, get_executors, get_frameworks, get_agents) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Response.GetAgents as Protos.Response (GetAgents)
import qualified Mesos.V1.Master.Protos.Response.GetExecutors as Protos.Response (GetExecutors)
import qualified Mesos.V1.Master.Protos.Response.GetFrameworks as Protos.Response (GetFrameworks)
import qualified Mesos.V1.Master.Protos.Response.GetTasks as Protos.Response (GetTasks)

data GetState = GetState{_get_tasks :: !(P'.Maybe Protos.Response.GetTasks),
                         _get_executors :: !(P'.Maybe Protos.Response.GetExecutors),
                         _get_frameworks :: !(P'.Maybe Protos.Response.GetFrameworks),
                         _get_agents :: !(P'.Maybe Protos.Response.GetAgents)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''GetState

instance P'.ToJSON GetState where
  toJSON msg
   = P'.objectNoEmpty
      ([("get_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (get_tasks msg))),
        ("get_executors", P'.toJSON (Prelude'.fmap P'.toJSON (get_executors msg))),
        ("get_frameworks", P'.toJSON (Prelude'.fmap P'.toJSON (get_frameworks msg))),
        ("get_agents", P'.toJSON (Prelude'.fmap P'.toJSON (get_agents msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON GetState where
  parseJSON
   = P'.withObject "GetState"
      (\ o ->
        do
          get_tasks <- P'.explicitParseFieldMaybe P'.parseJSON o "get_tasks"
          get_executors <- P'.explicitParseFieldMaybe P'.parseJSON o "get_executors"
          get_frameworks <- P'.explicitParseFieldMaybe P'.parseJSON o "get_frameworks"
          get_agents <- P'.explicitParseFieldMaybe P'.parseJSON o "get_agents"
          Prelude'.return
           P'.defaultValue{_get_tasks = get_tasks, _get_executors = get_executors, _get_frameworks = get_frameworks,
                           _get_agents = get_agents})

instance P'.Mergeable GetState where
  mergeAppend (GetState x'1 x'2 x'3 x'4) (GetState y'1 y'2 y'3 y'4)
   = GetState (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default GetState where
  defaultValue = GetState P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire GetState where
  wireSize ft' self'@(GetState x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(GetState x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4]
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
                    (\ !new'Field -> old'Self{_get_tasks = P'.mergeAppend (_get_tasks old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_executors = P'.mergeAppend (_get_executors old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_get_frameworks = P'.mergeAppend (_get_frameworks old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_agents = P'.mergeAppend (_get_agents old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetState) GetState where
  getVal m' f' = f' m'

instance P'.GPB GetState

instance P'.ReflectDescriptor GetState where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetState\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetState\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetState.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetState.get_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetState\"], baseName' = FName \"get_tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetTasks\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetTasks\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetState.get_executors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetState\"], baseName' = FName \"get_executors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetExecutors\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetState.get_frameworks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetState\"], baseName' = FName \"get_frameworks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetFrameworks\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetState.get_agents\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetState\"], baseName' = FName \"get_agents\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetAgents\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetAgents\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType GetState where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetState where
  textPut msg
   = do
       P'.tellT "get_tasks" (_get_tasks msg)
       P'.tellT "get_executors" (_get_executors msg)
       P'.tellT "get_frameworks" (_get_frameworks msg)
       P'.tellT "get_agents" (_get_agents msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_get_tasks, parse'_get_executors, parse'_get_frameworks, parse'_get_agents]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_get_tasks
         = P'.try
            (do
               v <- P'.getT "get_tasks"
               Prelude'.return (\ o -> o{_get_tasks = v}))
        parse'_get_executors
         = P'.try
            (do
               v <- P'.getT "get_executors"
               Prelude'.return (\ o -> o{_get_executors = v}))
        parse'_get_frameworks
         = P'.try
            (do
               v <- P'.getT "get_frameworks"
               Prelude'.return (\ o -> o{_get_frameworks = v}))
        parse'_get_agents
         = P'.try
            (do
               v <- P'.getT "get_agents"
               Prelude'.return (\ o -> o{_get_agents = v}))