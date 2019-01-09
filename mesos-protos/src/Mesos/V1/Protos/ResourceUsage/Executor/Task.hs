{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ResourceUsage.Executor.Task (Task(..), name, id, resources, labels) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Labels as Protos (Labels)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)
import qualified Mesos.V1.Protos.TaskID as Protos (TaskID)

data Task = Task{_name :: !(P'.Utf8), _id :: !(Protos.TaskID), _resources :: !(P'.Seq Protos.Resource),
                 _labels :: !(P'.Maybe Protos.Labels)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Task

instance P'.ToJSON Task where
  toJSON msg
   = P'.objectNoEmpty
      ([("name", P'.toJSON (name msg)), ("id", P'.toJSON (id msg)),
        ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Task where
  parseJSON
   = P'.withObject "Task"
      (\ o ->
        do
          name <- P'.explicitParseField P'.parseJSON o "name"
          id <- P'.explicitParseField P'.parseJSON o "id"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          Prelude'.return P'.defaultValue{_name = name, _id = id, _resources = resources, _labels = labels})

instance P'.Mergeable Task where
  mergeAppend (Task x'1 x'2 x'3 x'4) (Task y'1 y'2 y'3 y'4)
   = Task (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default Task where
  defaultValue = Task P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Task where
  wireSize ft' self'@(Task x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 11 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(Task x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 18 11 x'2, P'.wirePutRepWithSize 26 11 x'3,
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = P'.mergeAppend (_id old'Self) (new'Field)}) (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Task) Task where
  getVal m' f' = f' m'

instance P'.GPB Task

instance P'.ReflectDescriptor Task where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ResourceUsage.Executor.Task\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\"], baseName = MName \"Task\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ResourceUsage\",\"Executor\",\"Task.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.Task.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\",MName \"Task\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.Task.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\",MName \"Task\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.Task.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\",MName \"Task\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceUsage.Executor.Task.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceUsage\",MName \"Executor\",MName \"Task\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Task where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Task where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "id" (_id msg)
       P'.tellT "resources" (_resources msg)
       P'.tellT "labels" (_labels msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_name, parse'_id, parse'_resources, parse'_labels]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))