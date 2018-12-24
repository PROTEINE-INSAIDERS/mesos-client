{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ResourceUsage.Executor (Executor(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.ContainerID as Protos (ContainerID)
import qualified Mesos.V1.Protos.ExecutorInfo as Protos (ExecutorInfo)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.ResourceStatistics as Protos (ResourceStatistics)
import qualified Mesos.V1.Protos.ResourceUsage.Executor.Task as Protos.ResourceUsage.Executor (Task)

data Executor = Executor{executor_info :: !(Protos.ExecutorInfo), allocated :: !(P'.Seq Protos.Resource),
                         statistics :: !(P'.Maybe Protos.ResourceStatistics), container_id :: !(Protos.ContainerID),
                         tasks :: !(P'.Seq Protos.ResourceUsage.Executor.Task)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Executor where
  toJSON msg
   = P'.objectNoEmpty
      ([("executor_info", P'.toJSON (executor_info msg)), ("allocated", P'.toJSON (Prelude'.fmap P'.toJSON (allocated msg))),
        ("statistics", P'.toJSON (Prelude'.fmap P'.toJSON (statistics msg))), ("container_id", P'.toJSON (container_id msg)),
        ("tasks", P'.toJSON (Prelude'.fmap P'.toJSON (tasks msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Executor where
  parseJSON
   = P'.withObject "Executor"
      (\ o ->
        do
          executor_info <- P'.explicitParseField P'.parseJSON o "executor_info"
          allocated <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "allocated")
          statistics <- P'.explicitParseFieldMaybe P'.parseJSON o "statistics"
          container_id <- P'.explicitParseField P'.parseJSON o "container_id"
          tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "tasks")
          Prelude'.return
           P'.defaultValue{executor_info = executor_info, allocated = allocated, statistics = statistics,
                           container_id = container_id, tasks = tasks})

instance P'.Mergeable Executor where
  mergeAppend (Executor x'1 x'2 x'3 x'4 x'5) (Executor y'1 y'2 y'3 y'4 y'5)
   = Executor (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default Executor where
  defaultValue = Executor P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Executor where
  wireSize ft' self'@(Executor x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeReq 1 11 x'4 +
             P'.wireSizeRep 1 11 x'5)
  wirePutWithSize ft' self'@(Executor x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutReqWithSize 34 11 x'4, P'.wirePutRepWithSize 42 11 x'5]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{executor_info = P'.mergeAppend (executor_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{allocated = P'.append (allocated old'Self) new'Field}) (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{statistics = P'.mergeAppend (statistics old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{container_id = P'.mergeAppend (container_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{tasks = P'.append (tasks old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Executor) Executor where
  getVal m' f' = f' m'

instance P'.GPB Executor

instance P'.ReflectDescriptor Executor where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 34]) (P'.fromDistinctAscList [10, 18, 26, 34, 42])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ResourceUsage.Executor\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ResourceUsage\"], baseName = MName \"Executor\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ResourceUsage\",\"Executor.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.executor_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName' = FName \"executor_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.allocated\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName' = FName \"allocated\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.statistics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName' = FName \"statistics\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ResourceStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ResourceStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.container_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName' = FName \"container_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName' = FName \"tasks\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ResourceUsage.Executor.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName = MName \"Task\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Executor where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Executor where
  textPut msg
   = do
       P'.tellT "executor_info" (executor_info msg)
       P'.tellT "allocated" (allocated msg)
       P'.tellT "statistics" (statistics msg)
       P'.tellT "container_id" (container_id msg)
       P'.tellT "tasks" (tasks msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'executor_info, parse'allocated, parse'statistics, parse'container_id, parse'tasks])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'executor_info
         = P'.try
            (do
               v <- P'.getT "executor_info"
               Prelude'.return (\ o -> o{executor_info = v}))
        parse'allocated
         = P'.try
            (do
               v <- P'.getT "allocated"
               Prelude'.return (\ o -> o{allocated = P'.append (allocated o) v}))
        parse'statistics
         = P'.try
            (do
               v <- P'.getT "statistics"
               Prelude'.return (\ o -> o{statistics = v}))
        parse'container_id
         = P'.try
            (do
               v <- P'.getT "container_id"
               Prelude'.return (\ o -> o{container_id = v}))
        parse'tasks
         = P'.try
            (do
               v <- P'.getT "tasks"
               Prelude'.return (\ o -> o{tasks = P'.append (tasks o) v}))