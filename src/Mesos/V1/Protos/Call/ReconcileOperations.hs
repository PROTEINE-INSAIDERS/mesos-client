{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Call.ReconcileOperations (ReconcileOperations(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Call.ReconcileOperations.Operation as Protos.Call.ReconcileOperations (Operation)

data ReconcileOperations = ReconcileOperations{operations :: !(P'.Seq Protos.Call.ReconcileOperations.Operation)}
                           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable ReconcileOperations where
  mergeAppend (ReconcileOperations x'1) (ReconcileOperations y'1) = ReconcileOperations (P'.mergeAppend x'1 y'1)

instance P'.Default ReconcileOperations where
  defaultValue = ReconcileOperations P'.defaultValue

instance P'.Wire ReconcileOperations where
  wireSize ft' self'@(ReconcileOperations x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(ReconcileOperations x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{operations = P'.append (operations old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ReconcileOperations) ReconcileOperations where
  getVal m' f' = f' m'

instance P'.GPB ReconcileOperations

instance P'.ReflectDescriptor ReconcileOperations where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.ReconcileOperations\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReconcileOperations\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Call\",\"ReconcileOperations.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.ReconcileOperations.operations\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"ReconcileOperations\"], baseName' = FName \"operations\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.ReconcileOperations.Operation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Call\",MName \"ReconcileOperations\"], baseName = MName \"Operation\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType ReconcileOperations where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ReconcileOperations where
  textPut msg
   = do
       P'.tellT "operations" (operations msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'operations]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'operations
         = P'.try
            (do
               v <- P'.getT "operations"
               Prelude'.return (\ o -> o{operations = P'.append (operations o) v}))