{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Event.Subscribed (Subscribed(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.MasterInfo as Protos (MasterInfo)

data Subscribed = Subscribed{framework_id :: (Protos.FrameworkID), heartbeat_interval_seconds :: (P'.Maybe P'.Double),
                             master_info :: (P'.Maybe Protos.MasterInfo)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Subscribed where
  mergeAppend (Subscribed x'1 x'2 x'3) (Subscribed y'1 y'2 y'3)
   = Subscribed (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Subscribed where
  defaultValue = Subscribed P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Subscribed where
  wireSize ft' self'@(Subscribed x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 1 x'2 + P'.wireSizeOpt 1 11 x'3)
  wirePutWithSize ft' self'@(Subscribed x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutOptWithSize 17 1 x'2, P'.wirePutOptWithSize 26 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{framework_id = P'.mergeAppend (framework_id old'Self) (new'Field)})
                    (P'.wireGet 11)
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{heartbeat_interval_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{master_info = P'.mergeAppend (master_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Subscribed) Subscribed where
  getVal m' f' = f' m'

instance P'.GPB Subscribed

instance P'.ReflectDescriptor Subscribed where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 17, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Event.Subscribed\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Subscribed\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Event\",\"Subscribed.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Subscribed.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Subscribed.heartbeat_interval_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"heartbeat_interval_seconds\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Event.Subscribed.master_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"master_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MasterInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MasterInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = True, makeLenses = False}"

instance P'.TextType Subscribed where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Subscribed where
  textPut msg
   = do
       P'.tellT "framework_id" (framework_id msg)
       P'.tellT "heartbeat_interval_seconds" (heartbeat_interval_seconds msg)
       P'.tellT "master_info" (master_info msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'framework_id, parse'heartbeat_interval_seconds, parse'master_info]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{framework_id = v}))
        parse'heartbeat_interval_seconds
         = P'.try
            (do
               v <- P'.getT "heartbeat_interval_seconds"
               Prelude'.return (\ o -> o{heartbeat_interval_seconds = v}))
        parse'master_info
         = P'.try
            (do
               v <- P'.getT "master_info"
               Prelude'.return (\ o -> o{master_info = v}))