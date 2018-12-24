{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetMaintenanceSchedule (GetMaintenanceSchedule(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Maintenance.Protos.Schedule as Protos (Schedule)

data GetMaintenanceSchedule = GetMaintenanceSchedule{schedule :: !(Protos.Schedule)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                        Prelude'.Generic)

instance P'.ToJSON GetMaintenanceSchedule where
  toJSON msg = P'.objectNoEmpty ([("schedule", P'.toJSON (schedule msg))] ++ Prelude'.concat [])

instance P'.FromJSON GetMaintenanceSchedule where
  parseJSON
   = P'.withObject "GetMaintenanceSchedule"
      (\ o ->
        do
          schedule <- P'.explicitParseField P'.parseJSON o "schedule"
          Prelude'.return P'.defaultValue{schedule = schedule})

instance P'.Mergeable GetMaintenanceSchedule where
  mergeAppend (GetMaintenanceSchedule x'1) (GetMaintenanceSchedule y'1) = GetMaintenanceSchedule (P'.mergeAppend x'1 y'1)

instance P'.Default GetMaintenanceSchedule where
  defaultValue = GetMaintenanceSchedule P'.defaultValue

instance P'.Wire GetMaintenanceSchedule where
  wireSize ft' self'@(GetMaintenanceSchedule x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(GetMaintenanceSchedule x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{schedule = P'.mergeAppend (schedule old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetMaintenanceSchedule) GetMaintenanceSchedule where
  getVal m' f' = f' m'

instance P'.GPB GetMaintenanceSchedule

instance P'.ReflectDescriptor GetMaintenanceSchedule where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetMaintenanceSchedule\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetMaintenanceSchedule\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetMaintenanceSchedule.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetMaintenanceSchedule.schedule\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetMaintenanceSchedule\"], baseName' = FName \"schedule\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.maintenance.Schedule\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\"], baseName = MName \"Schedule\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType GetMaintenanceSchedule where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetMaintenanceSchedule where
  textPut msg
   = do
       P'.tellT "schedule" (schedule msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'schedule]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'schedule
         = P'.try
            (do
               v <- P'.getT "schedule"
               Prelude'.return (\ o -> o{schedule = v}))