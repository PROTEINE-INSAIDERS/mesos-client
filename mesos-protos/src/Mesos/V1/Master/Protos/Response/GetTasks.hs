{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetTasks
       (GetTasks(..), pending_tasks, tasks, unreachable_tasks, completed_tasks, orphan_tasks) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Task as Protos (Task)

data GetTasks = GetTasks{_pending_tasks :: !(P'.Seq Protos.Task), _tasks :: !(P'.Seq Protos.Task),
                         _unreachable_tasks :: !(P'.Seq Protos.Task), _completed_tasks :: !(P'.Seq Protos.Task),
                         _orphan_tasks :: !(P'.Seq Protos.Task)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''GetTasks

instance P'.ToJSON GetTasks where
  toJSON msg
   = P'.objectNoEmpty
      ([("pending_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (pending_tasks msg))),
        ("tasks", P'.toJSON (Prelude'.fmap P'.toJSON (tasks msg))),
        ("unreachable_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (unreachable_tasks msg))),
        ("completed_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (completed_tasks msg))),
        ("orphan_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (orphan_tasks msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON GetTasks where
  parseJSON
   = P'.withObject "GetTasks"
      (\ o ->
        do
          pending_tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "pending_tasks")
          tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "tasks")
          unreachable_tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "unreachable_tasks")
          completed_tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                              (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "completed_tasks")
          orphan_tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "orphan_tasks")
          Prelude'.return
           P'.defaultValue{_pending_tasks = pending_tasks, _tasks = tasks, _unreachable_tasks = unreachable_tasks,
                           _completed_tasks = completed_tasks, _orphan_tasks = orphan_tasks})

instance P'.Mergeable GetTasks where
  mergeAppend (GetTasks x'1 x'2 x'3 x'4 x'5) (GetTasks y'1 y'2 y'3 y'4 y'5)
   = GetTasks (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default GetTasks where
  defaultValue = GetTasks P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire GetTasks where
  wireSize ft' self'@(GetTasks x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 11 x'4 +
             P'.wireSizeRep 1 11 x'5)
  wirePutWithSize ft' self'@(GetTasks x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2, P'.wirePutRepWithSize 26 11 x'4,
             P'.wirePutRepWithSize 34 11 x'5, P'.wirePutRepWithSize 42 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_pending_tasks = P'.append (_pending_tasks old'Self) new'Field})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_tasks = P'.append (_tasks old'Self) new'Field}) (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{_unreachable_tasks = P'.append (_unreachable_tasks old'Self) new'Field})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_completed_tasks = P'.append (_completed_tasks old'Self) new'Field})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_orphan_tasks = P'.append (_orphan_tasks old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetTasks) GetTasks where
  getVal m' f' = f' m'

instance P'.GPB GetTasks

instance P'.ReflectDescriptor GetTasks where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetTasks\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetTasks\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetTasks.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetTasks.pending_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetTasks\"], baseName' = FName \"pending_tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Task\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetTasks.tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetTasks\"], baseName' = FName \"tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Task\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetTasks.unreachable_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetTasks\"], baseName' = FName \"unreachable_tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Task\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetTasks.completed_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetTasks\"], baseName' = FName \"completed_tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Task\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetTasks.orphan_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetTasks\"], baseName' = FName \"orphan_tasks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Task\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType GetTasks where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetTasks where
  textPut msg
   = do
       P'.tellT "pending_tasks" (_pending_tasks msg)
       P'.tellT "tasks" (_tasks msg)
       P'.tellT "unreachable_tasks" (_unreachable_tasks msg)
       P'.tellT "completed_tasks" (_completed_tasks msg)
       P'.tellT "orphan_tasks" (_orphan_tasks msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_pending_tasks, parse'_tasks, parse'_unreachable_tasks, parse'_completed_tasks, parse'_orphan_tasks])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_pending_tasks
         = P'.try
            (do
               v <- P'.getT "pending_tasks"
               Prelude'.return (\ o -> o{_pending_tasks = P'.append (_pending_tasks o) v}))
        parse'_tasks
         = P'.try
            (do
               v <- P'.getT "tasks"
               Prelude'.return (\ o -> o{_tasks = P'.append (_tasks o) v}))
        parse'_unreachable_tasks
         = P'.try
            (do
               v <- P'.getT "unreachable_tasks"
               Prelude'.return (\ o -> o{_unreachable_tasks = P'.append (_unreachable_tasks o) v}))
        parse'_completed_tasks
         = P'.try
            (do
               v <- P'.getT "completed_tasks"
               Prelude'.return (\ o -> o{_completed_tasks = P'.append (_completed_tasks o) v}))
        parse'_orphan_tasks
         = P'.try
            (do
               v <- P'.getT "orphan_tasks"
               Prelude'.return (\ o -> o{_orphan_tasks = P'.append (_orphan_tasks o) v}))