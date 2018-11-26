{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Response.GetExecutors (GetExecutors(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Response.GetExecutors.Executor as Protos.Response.GetExecutors (Executor)

data GetExecutors = GetExecutors{executors :: !(P'.Seq Protos.Response.GetExecutors.Executor),
                                 orphan_executors :: !(P'.Seq Protos.Response.GetExecutors.Executor)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

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
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{executors = P'.append (executors old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{orphan_executors = P'.append (orphan_executors old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetExecutors) GetExecutors where
  getVal m' f' = f' m'

instance P'.GPB GetExecutors

instance P'.ReflectDescriptor GetExecutors where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetExecutors\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Response\",\"GetExecutors.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetExecutors.executors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName' = FName \"executors\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors.Executor\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName = MName \"Executor\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetExecutors.orphan_executors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName' = FName \"orphan_executors\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetExecutors.Executor\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetExecutors\"], baseName = MName \"Executor\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType GetExecutors where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetExecutors where
  textPut msg
   = do
       P'.tellT "executors" (executors msg)
       P'.tellT "orphan_executors" (orphan_executors msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'executors, parse'orphan_executors]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'executors
         = P'.try
            (do
               v <- P'.getT "executors"
               Prelude'.return (\ o -> o{executors = P'.append (executors o) v}))
        parse'orphan_executors
         = P'.try
            (do
               v <- P'.getT "orphan_executors"
               Prelude'.return (\ o -> o{orphan_executors = P'.append (orphan_executors o) v}))