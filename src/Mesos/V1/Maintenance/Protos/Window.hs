{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Maintenance.Protos.Window (Window(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.MachineID as Protos (MachineID)
import qualified Mesos.V1.Protos.Unavailability as Protos (Unavailability)

data Window = Window{machine_ids :: !(P'.Seq Protos.MachineID), unavailability :: !(Protos.Unavailability)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Window where
  mergeAppend (Window x'1 x'2) (Window y'1 y'2) = Window (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Window where
  defaultValue = Window P'.defaultValue P'.defaultValue

instance P'.Wire Window where
  wireSize ft' self'@(Window x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(Window x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{machine_ids = P'.append (machine_ids old'Self) new'Field})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{unavailability = P'.mergeAppend (unavailability old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Window) Window where
  getVal m' f' = f' m'

instance P'.GPB Window

instance P'.ReflectDescriptor Window where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.maintenance.Window\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\"], baseName = MName \"Window\"}, descFilePath = [\"Mesos\",\"V1\",\"Maintenance\",\"Protos\",\"Window.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.Window.machine_ids\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"Window\"], baseName' = FName \"machine_ids\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MachineID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MachineID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.Window.unavailability\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"Window\"], baseName' = FName \"unavailability\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Unavailability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Unavailability\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Window where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Window where
  textPut msg
   = do
       P'.tellT "machine_ids" (machine_ids msg)
       P'.tellT "unavailability" (unavailability msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'machine_ids, parse'unavailability]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'machine_ids
         = P'.try
            (do
               v <- P'.getT "machine_ids"
               Prelude'.return (\ o -> o{machine_ids = P'.append (machine_ids o) v}))
        parse'unavailability
         = P'.try
            (do
               v <- P'.getT "unavailability"
               Prelude'.return (\ o -> o{unavailability = v}))