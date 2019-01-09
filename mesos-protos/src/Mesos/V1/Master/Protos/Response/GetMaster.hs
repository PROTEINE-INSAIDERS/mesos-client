{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetMaster (GetMaster(..), master_info, start_time, elected_time) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.MasterInfo as Protos (MasterInfo)

data GetMaster = GetMaster{_master_info :: !(P'.Maybe Protos.MasterInfo), _start_time :: !(P'.Maybe P'.Double),
                           _elected_time :: !(P'.Maybe P'.Double)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''GetMaster

instance P'.ToJSON GetMaster where
  toJSON msg
   = P'.objectNoEmpty
      ([("master_info", P'.toJSON (Prelude'.fmap P'.toJSON (master_info msg))),
        ("start_time", P'.toJSON (Prelude'.fmap P'.toJSON (start_time msg))),
        ("elected_time", P'.toJSON (Prelude'.fmap P'.toJSON (elected_time msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON GetMaster where
  parseJSON
   = P'.withObject "GetMaster"
      (\ o ->
        do
          master_info <- P'.explicitParseFieldMaybe P'.parseJSON o "master_info"
          start_time <- P'.explicitParseFieldMaybe P'.parseJSON o "start_time"
          elected_time <- P'.explicitParseFieldMaybe P'.parseJSON o "elected_time"
          Prelude'.return P'.defaultValue{_master_info = master_info, _start_time = start_time, _elected_time = elected_time})

instance P'.Mergeable GetMaster where
  mergeAppend (GetMaster x'1 x'2 x'3) (GetMaster y'1 y'2 y'3)
   = GetMaster (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default GetMaster where
  defaultValue = GetMaster P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire GetMaster where
  wireSize ft' self'@(GetMaster x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 1 x'2 + P'.wireSizeOpt 1 1 x'3)
  wirePutWithSize ft' self'@(GetMaster x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 17 1 x'2, P'.wirePutOptWithSize 25 1 x'3]
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
                    (\ !new'Field -> old'Self{_master_info = P'.mergeAppend (_master_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{_start_time = Prelude'.Just new'Field}) (P'.wireGet 1)
             25 -> Prelude'.fmap (\ !new'Field -> old'Self{_elected_time = Prelude'.Just new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetMaster) GetMaster where
  getVal m' f' = f' m'

instance P'.GPB GetMaster

instance P'.ReflectDescriptor GetMaster where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 17, 25])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetMaster\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetMaster\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetMaster.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetMaster.master_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetMaster\"], baseName' = FName \"master_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MasterInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MasterInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetMaster.start_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetMaster\"], baseName' = FName \"start_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetMaster.elected_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetMaster\"], baseName' = FName \"elected_time\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType GetMaster where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetMaster where
  textPut msg
   = do
       P'.tellT "master_info" (_master_info msg)
       P'.tellT "start_time" (_start_time msg)
       P'.tellT "elected_time" (_elected_time msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_master_info, parse'_start_time, parse'_elected_time]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_master_info
         = P'.try
            (do
               v <- P'.getT "master_info"
               Prelude'.return (\ o -> o{_master_info = v}))
        parse'_start_time
         = P'.try
            (do
               v <- P'.getT "start_time"
               Prelude'.return (\ o -> o{_start_time = v}))
        parse'_elected_time
         = P'.try
            (do
               v <- P'.getT "elected_time"
               Prelude'.return (\ o -> o{_elected_time = v}))