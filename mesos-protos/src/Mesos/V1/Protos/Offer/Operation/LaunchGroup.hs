{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Offer.Operation.LaunchGroup (LaunchGroup(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.ExecutorInfo as Protos (ExecutorInfo)
import qualified Mesos.V1.Protos.TaskGroupInfo as Protos (TaskGroupInfo)

data LaunchGroup = LaunchGroup{executor :: !(Protos.ExecutorInfo), task_group :: !(Protos.TaskGroupInfo)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON LaunchGroup where
  toJSON msg
   = P'.objectNoEmpty ([("executor", P'.toJSON (executor msg)), ("task_group", P'.toJSON (task_group msg))] ++ Prelude'.concat [])

instance P'.FromJSON LaunchGroup where
  parseJSON
   = P'.withObject "LaunchGroup"
      (\ o ->
        do
          executor <- P'.explicitParseField P'.parseJSON o "executor"
          task_group <- P'.explicitParseField P'.parseJSON o "task_group"
          Prelude'.return P'.defaultValue{executor = executor, task_group = task_group})

instance P'.Mergeable LaunchGroup where
  mergeAppend (LaunchGroup x'1 x'2) (LaunchGroup y'1 y'2) = LaunchGroup (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default LaunchGroup where
  defaultValue = LaunchGroup P'.defaultValue P'.defaultValue

instance P'.Wire LaunchGroup where
  wireSize ft' self'@(LaunchGroup x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(LaunchGroup x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{executor = P'.mergeAppend (executor old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{task_group = P'.mergeAppend (task_group old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> LaunchGroup) LaunchGroup where
  getVal m' f' = f' m'

instance P'.GPB LaunchGroup

instance P'.ReflectDescriptor LaunchGroup where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.LaunchGroup\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"LaunchGroup\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Offer\",\"Operation\",\"LaunchGroup.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.LaunchGroup.executor\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"LaunchGroup\"], baseName' = FName \"executor\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ExecutorInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ExecutorInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.LaunchGroup.task_group\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"LaunchGroup\"], baseName' = FName \"task_group\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskGroupInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskGroupInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType LaunchGroup where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg LaunchGroup where
  textPut msg
   = do
       P'.tellT "executor" (executor msg)
       P'.tellT "task_group" (task_group msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'executor, parse'task_group]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'executor
         = P'.try
            (do
               v <- P'.getT "executor"
               Prelude'.return (\ o -> o{executor = v}))
        parse'task_group
         = P'.try
            (do
               v <- P'.getT "task_group"
               Prelude'.return (\ o -> o{task_group = v}))