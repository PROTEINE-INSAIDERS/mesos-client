{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetExecutors (GetExecutors(..), executors, orphan_executors) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Response.GetExecutors.Executor as Protos.Response.GetExecutors (Executor)

data GetExecutors = GetExecutors{_executors :: !(P'.Seq Protos.Response.GetExecutors.Executor),
                                 _orphan_executors :: !(P'.Seq Protos.Response.GetExecutors.Executor)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''GetExecutors

instance P'.ToJSON GetExecutors where
  toJSON msg
   = P'.objectNoEmpty
      ([("executors", P'.toJSON (Prelude'.fmap P'.toJSON (executors msg))),
        ("orphan_executors", P'.toJSON (Prelude'.fmap P'.toJSON (orphan_executors msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON GetExecutors where
  parseJSON
   = P'.withObject "GetExecutors"
      (\ o ->
        do
          executors <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "executors")
          orphan_executors <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                               (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "orphan_executors")
          Prelude'.return P'.defaultValue{_executors = executors, _orphan_executors = orphan_executors})

instance P'.Mergeable GetExecutors where
  mergeAppend (GetExecutors x'1 x'2) (GetExecutors y'1 y'2) = GetExecutors (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default GetExecutors where
  defaultValue = GetExecutors P'.defaultValue P'.defaultValue

instance P'.Wire GetExecutors where
  wireSize ft' self'@(GetExecutors x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(GetExecutors x'1 x'2)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_executors = P'.append (_executors old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_orphan_executors = P'.append (_orphan_executors old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetExecutors) GetExecutors where
  getVal m' f' = f' m'

instance P'.GPB GetExecutors

instance P'.ReflectDescriptor GetExecutors where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetExecutors\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetExecutors.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetExecutors.executors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName' = FName \"executors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors.Executor\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName = MName \"Executor\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetExecutors.orphan_executors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName' = FName \"orphan_executors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors.Executor\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName = MName \"Executor\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType GetExecutors where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetExecutors where
  textPut msg
   = do
       P'.tellT "executors" (_executors msg)
       P'.tellT "orphan_executors" (_orphan_executors msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_executors, parse'_orphan_executors]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_executors
         = P'.try
            (do
               v <- P'.getT "executors"
               Prelude'.return (\ o -> o{_executors = P'.append (_executors o) v}))
        parse'_orphan_executors
         = P'.try
            (do
               v <- P'.getT "orphan_executors"
               Prelude'.return (\ o -> o{_orphan_executors = P'.append (_orphan_executors o) v}))