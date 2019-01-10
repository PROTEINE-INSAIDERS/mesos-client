{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Call.Subscribe (Subscribe(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Executor.Protos.Call.Update as Protos.Call (Update)
import qualified Mesos.V1.Protos.TaskInfo as Protos (TaskInfo)

data Subscribe = Subscribe{unacknowledged_tasks :: !(P'.Seq Protos.TaskInfo),
                           unacknowledged_updates :: !(P'.Seq Protos.Call.Update)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Subscribe where
  toJSON msg
   = P'.objectNoEmpty
      ([("unacknowledged_tasks", P'.toJSON (Prelude'.fmap P'.toJSON (unacknowledged_tasks msg))),
        ("unacknowledged_updates", P'.toJSON (Prelude'.fmap P'.toJSON (unacknowledged_updates msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Subscribe where
  parseJSON
   = P'.withObject "Subscribe"
      (\ o ->
        do
          unacknowledged_tasks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                   (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                     "unacknowledged_tasks")
          unacknowledged_updates <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                     (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                       "unacknowledged_updates")
          Prelude'.return
           P'.defaultValue{unacknowledged_tasks = unacknowledged_tasks, unacknowledged_updates = unacknowledged_updates})

instance P'.Mergeable Subscribe where
  mergeAppend (Subscribe x'1 x'2) (Subscribe y'1 y'2) = Subscribe (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Subscribe where
  defaultValue = Subscribe P'.defaultValue P'.defaultValue

instance P'.Wire Subscribe where
  wireSize ft' self'@(Subscribe x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(Subscribe x'1 x'2)
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
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{unacknowledged_tasks = P'.append (unacknowledged_tasks old'Self) new'Field})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{unacknowledged_updates = P'.append (unacknowledged_updates old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Subscribe) Subscribe where
  getVal m' f' = f' m'

instance P'.GPB Subscribe

instance P'.ReflectDescriptor Subscribe where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Subscribe\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Subscribe\"}, descFilePath = [\"Mesos\",\"V1\",\"Executor\",\"Protos\",\"Call\",\"Subscribe.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.Subscribe.unacknowledged_tasks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"unacknowledged_tasks\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.Subscribe.unacknowledged_updates\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"unacknowledged_updates\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Update\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Update\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Subscribe where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Subscribe where
  textPut msg
   = do
       P'.tellT "unacknowledged_tasks" (unacknowledged_tasks msg)
       P'.tellT "unacknowledged_updates" (unacknowledged_updates msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'unacknowledged_tasks, parse'unacknowledged_updates]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'unacknowledged_tasks
         = P'.try
            (do
               v <- P'.getT "unacknowledged_tasks"
               Prelude'.return (\ o -> o{unacknowledged_tasks = P'.append (unacknowledged_tasks o) v}))
        parse'unacknowledged_updates
         = P'.try
            (do
               v <- P'.getT "unacknowledged_updates"
               Prelude'.return (\ o -> o{unacknowledged_updates = P'.append (unacknowledged_updates o) v}))