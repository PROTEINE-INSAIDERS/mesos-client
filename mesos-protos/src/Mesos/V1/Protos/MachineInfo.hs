{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.MachineInfo (MachineInfo(..), id, mode, unavailability) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.MachineID as Protos (MachineID)
import qualified Mesos.V1.Protos.MachineInfo.Mode as Protos.MachineInfo (Mode)
import qualified Mesos.V1.Protos.Unavailability as Protos (Unavailability)

data MachineInfo = MachineInfo{_id :: !(Protos.MachineID), _mode :: !(P'.Maybe Protos.MachineInfo.Mode),
                               _unavailability :: !(P'.Maybe Protos.Unavailability)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''MachineInfo

instance P'.ToJSON MachineInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("id", P'.toJSON (id msg)), ("mode", P'.toJSON (Prelude'.fmap P'.toJSON (mode msg))),
        ("unavailability", P'.toJSON (Prelude'.fmap P'.toJSON (unavailability msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON MachineInfo where
  parseJSON
   = P'.withObject "MachineInfo"
      (\ o ->
        do
          id <- P'.explicitParseField P'.parseJSON o "id"
          mode <- P'.explicitParseFieldMaybe P'.parseJSON o "mode"
          unavailability <- P'.explicitParseFieldMaybe P'.parseJSON o "unavailability"
          Prelude'.return P'.defaultValue{_id = id, _mode = mode, _unavailability = unavailability})

instance P'.Mergeable MachineInfo where
  mergeAppend (MachineInfo x'1 x'2 x'3) (MachineInfo y'1 y'2 y'3)
   = MachineInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default MachineInfo where
  defaultValue = MachineInfo P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire MachineInfo where
  wireSize ft' self'@(MachineInfo x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeOpt 1 11 x'3)
  wirePutWithSize ft' self'@(MachineInfo x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutOptWithSize 16 14 x'2, P'.wirePutOptWithSize 26 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = P'.mergeAppend (_id old'Self) (new'Field)}) (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{_mode = Prelude'.Just new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_unavailability = P'.mergeAppend (_unavailability old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> MachineInfo) MachineInfo where
  getVal m' f' = f' m'

instance P'.GPB MachineInfo

instance P'.ReflectDescriptor MachineInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 16, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.MachineInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MachineInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"MachineInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.MachineInfo.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"MachineInfo\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MachineID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MachineID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.MachineInfo.mode\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"MachineInfo\"], baseName' = FName \"mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MachineInfo.Mode\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"MachineInfo\"], baseName = MName \"Mode\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.MachineInfo.unavailability\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"MachineInfo\"], baseName' = FName \"unavailability\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Unavailability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Unavailability\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType MachineInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg MachineInfo where
  textPut msg
   = do
       P'.tellT "id" (_id msg)
       P'.tellT "mode" (_mode msg)
       P'.tellT "unavailability" (_unavailability msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_id, parse'_mode, parse'_unavailability]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_mode
         = P'.try
            (do
               v <- P'.getT "mode"
               Prelude'.return (\ o -> o{_mode = v}))
        parse'_unavailability
         = P'.try
            (do
               v <- P'.getT "unavailability"
               Prelude'.return (\ o -> o{_unavailability = v}))