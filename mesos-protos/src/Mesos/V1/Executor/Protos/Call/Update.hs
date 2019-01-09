{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Executor.Protos.Call.Update (Update(..), status) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.TaskStatus as Protos (TaskStatus)

data Update = Update{_status :: !(Protos.TaskStatus)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Update

instance P'.ToJSON Update where
  toJSON msg = P'.objectNoEmpty ([("status", P'.toJSON (status msg))] ++ Prelude'.concat [])

instance P'.FromJSON Update where
  parseJSON
   = P'.withObject "Update"
      (\ o ->
        do
          status <- P'.explicitParseField P'.parseJSON o "status"
          Prelude'.return P'.defaultValue{_status = status})

instance P'.Mergeable Update where
  mergeAppend (Update x'1) (Update y'1) = Update (P'.mergeAppend x'1 y'1)

instance P'.Default Update where
  defaultValue = Update P'.defaultValue

instance P'.Wire Update where
  wireSize ft' self'@(Update x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(Update x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_status = P'.mergeAppend (_status old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Update) Update where
  getVal m' f' = f' m'

instance P'.GPB Update

instance P'.ReflectDescriptor Update where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.executor.Call.Update\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Update\"}, descFilePath = [\"Mesos\",\"V1\",\"Executor\",\"Protos\",\"Call\",\"Update.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.executor.Call.Update.status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Executor\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Update\"], baseName' = FName \"status\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TaskStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TaskStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Update where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Update where
  textPut msg
   = do
       P'.tellT "status" (_status msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_status]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_status
         = P'.try
            (do
               v <- P'.getT "status"
               Prelude'.return (\ o -> o{_status = v}))