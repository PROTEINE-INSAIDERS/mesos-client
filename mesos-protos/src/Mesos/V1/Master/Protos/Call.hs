{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call
       (Call(..), type', get_metrics, set_logging_level, list_files, read_file, update_weights, reserve_resources,
        unreserve_resources, create_volumes, destroy_volumes, grow_volume, shrink_volume, update_maintenance_schedule,
        start_maintenance, stop_maintenance, update_quota, teardown, mark_agent_gone, set_quota, remove_quota)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Call.CreateVolumes as Protos.Call (CreateVolumes)
import qualified Mesos.V1.Master.Protos.Call.DestroyVolumes as Protos.Call (DestroyVolumes)
import qualified Mesos.V1.Master.Protos.Call.GetMetrics as Protos.Call (GetMetrics)
import qualified Mesos.V1.Master.Protos.Call.GrowVolume as Protos.Call (GrowVolume)
import qualified Mesos.V1.Master.Protos.Call.ListFiles as Protos.Call (ListFiles)
import qualified Mesos.V1.Master.Protos.Call.MarkAgentGone as Protos.Call (MarkAgentGone)
import qualified Mesos.V1.Master.Protos.Call.ReadFile as Protos.Call (ReadFile)
import qualified Mesos.V1.Master.Protos.Call.RemoveQuota as Protos.Call (RemoveQuota)
import qualified Mesos.V1.Master.Protos.Call.ReserveResources as Protos.Call (ReserveResources)
import qualified Mesos.V1.Master.Protos.Call.SetLoggingLevel as Protos.Call (SetLoggingLevel)
import qualified Mesos.V1.Master.Protos.Call.SetQuota as Protos.Call (SetQuota)
import qualified Mesos.V1.Master.Protos.Call.ShrinkVolume as Protos.Call (ShrinkVolume)
import qualified Mesos.V1.Master.Protos.Call.StartMaintenance as Protos.Call (StartMaintenance)
import qualified Mesos.V1.Master.Protos.Call.StopMaintenance as Protos.Call (StopMaintenance)
import qualified Mesos.V1.Master.Protos.Call.Teardown as Protos.Call (Teardown)
import qualified Mesos.V1.Master.Protos.Call.Type as Protos.Call (Type)
import qualified Mesos.V1.Master.Protos.Call.UnreserveResources as Protos.Call (UnreserveResources)
import qualified Mesos.V1.Master.Protos.Call.UpdateMaintenanceSchedule as Protos.Call (UpdateMaintenanceSchedule)
import qualified Mesos.V1.Master.Protos.Call.UpdateQuota as Protos.Call (UpdateQuota)
import qualified Mesos.V1.Master.Protos.Call.UpdateWeights as Protos.Call (UpdateWeights)

data Call = Call{_type' :: !(P'.Maybe Protos.Call.Type), _get_metrics :: !(P'.Maybe Protos.Call.GetMetrics),
                 _set_logging_level :: !(P'.Maybe Protos.Call.SetLoggingLevel), _list_files :: !(P'.Maybe Protos.Call.ListFiles),
                 _read_file :: !(P'.Maybe Protos.Call.ReadFile), _update_weights :: !(P'.Maybe Protos.Call.UpdateWeights),
                 _reserve_resources :: !(P'.Maybe Protos.Call.ReserveResources),
                 _unreserve_resources :: !(P'.Maybe Protos.Call.UnreserveResources),
                 _create_volumes :: !(P'.Maybe Protos.Call.CreateVolumes),
                 _destroy_volumes :: !(P'.Maybe Protos.Call.DestroyVolumes), _grow_volume :: !(P'.Maybe Protos.Call.GrowVolume),
                 _shrink_volume :: !(P'.Maybe Protos.Call.ShrinkVolume),
                 _update_maintenance_schedule :: !(P'.Maybe Protos.Call.UpdateMaintenanceSchedule),
                 _start_maintenance :: !(P'.Maybe Protos.Call.StartMaintenance),
                 _stop_maintenance :: !(P'.Maybe Protos.Call.StopMaintenance), _update_quota :: !(P'.Maybe Protos.Call.UpdateQuota),
                 _teardown :: !(P'.Maybe Protos.Call.Teardown), _mark_agent_gone :: !(P'.Maybe Protos.Call.MarkAgentGone),
                 _set_quota :: !(P'.Maybe Protos.Call.SetQuota), _remove_quota :: !(P'.Maybe Protos.Call.RemoveQuota)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Call

instance P'.ToJSON Call where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("get_metrics", P'.toJSON (Prelude'.fmap P'.toJSON (get_metrics msg))),
        ("set_logging_level", P'.toJSON (Prelude'.fmap P'.toJSON (set_logging_level msg))),
        ("list_files", P'.toJSON (Prelude'.fmap P'.toJSON (list_files msg))),
        ("read_file", P'.toJSON (Prelude'.fmap P'.toJSON (read_file msg))),
        ("update_weights", P'.toJSON (Prelude'.fmap P'.toJSON (update_weights msg))),
        ("reserve_resources", P'.toJSON (Prelude'.fmap P'.toJSON (reserve_resources msg))),
        ("unreserve_resources", P'.toJSON (Prelude'.fmap P'.toJSON (unreserve_resources msg))),
        ("create_volumes", P'.toJSON (Prelude'.fmap P'.toJSON (create_volumes msg))),
        ("destroy_volumes", P'.toJSON (Prelude'.fmap P'.toJSON (destroy_volumes msg))),
        ("grow_volume", P'.toJSON (Prelude'.fmap P'.toJSON (grow_volume msg))),
        ("shrink_volume", P'.toJSON (Prelude'.fmap P'.toJSON (shrink_volume msg))),
        ("update_maintenance_schedule", P'.toJSON (Prelude'.fmap P'.toJSON (update_maintenance_schedule msg))),
        ("start_maintenance", P'.toJSON (Prelude'.fmap P'.toJSON (start_maintenance msg))),
        ("stop_maintenance", P'.toJSON (Prelude'.fmap P'.toJSON (stop_maintenance msg))),
        ("update_quota", P'.toJSON (Prelude'.fmap P'.toJSON (update_quota msg))),
        ("teardown", P'.toJSON (Prelude'.fmap P'.toJSON (teardown msg))),
        ("mark_agent_gone", P'.toJSON (Prelude'.fmap P'.toJSON (mark_agent_gone msg))),
        ("set_quota", P'.toJSON (Prelude'.fmap P'.toJSON (set_quota msg))),
        ("remove_quota", P'.toJSON (Prelude'.fmap P'.toJSON (remove_quota msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Call where
  parseJSON
   = P'.withObject "Call"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          get_metrics <- P'.explicitParseFieldMaybe P'.parseJSON o "get_metrics"
          set_logging_level <- P'.explicitParseFieldMaybe P'.parseJSON o "set_logging_level"
          list_files <- P'.explicitParseFieldMaybe P'.parseJSON o "list_files"
          read_file <- P'.explicitParseFieldMaybe P'.parseJSON o "read_file"
          update_weights <- P'.explicitParseFieldMaybe P'.parseJSON o "update_weights"
          reserve_resources <- P'.explicitParseFieldMaybe P'.parseJSON o "reserve_resources"
          unreserve_resources <- P'.explicitParseFieldMaybe P'.parseJSON o "unreserve_resources"
          create_volumes <- P'.explicitParseFieldMaybe P'.parseJSON o "create_volumes"
          destroy_volumes <- P'.explicitParseFieldMaybe P'.parseJSON o "destroy_volumes"
          grow_volume <- P'.explicitParseFieldMaybe P'.parseJSON o "grow_volume"
          shrink_volume <- P'.explicitParseFieldMaybe P'.parseJSON o "shrink_volume"
          update_maintenance_schedule <- P'.explicitParseFieldMaybe P'.parseJSON o "update_maintenance_schedule"
          start_maintenance <- P'.explicitParseFieldMaybe P'.parseJSON o "start_maintenance"
          stop_maintenance <- P'.explicitParseFieldMaybe P'.parseJSON o "stop_maintenance"
          update_quota <- P'.explicitParseFieldMaybe P'.parseJSON o "update_quota"
          teardown <- P'.explicitParseFieldMaybe P'.parseJSON o "teardown"
          mark_agent_gone <- P'.explicitParseFieldMaybe P'.parseJSON o "mark_agent_gone"
          set_quota <- P'.explicitParseFieldMaybe P'.parseJSON o "set_quota"
          remove_quota <- P'.explicitParseFieldMaybe P'.parseJSON o "remove_quota"
          Prelude'.return
           P'.defaultValue{_type' = type', _get_metrics = get_metrics, _set_logging_level = set_logging_level,
                           _list_files = list_files, _read_file = read_file, _update_weights = update_weights,
                           _reserve_resources = reserve_resources, _unreserve_resources = unreserve_resources,
                           _create_volumes = create_volumes, _destroy_volumes = destroy_volumes, _grow_volume = grow_volume,
                           _shrink_volume = shrink_volume, _update_maintenance_schedule = update_maintenance_schedule,
                           _start_maintenance = start_maintenance, _stop_maintenance = stop_maintenance,
                           _update_quota = update_quota, _teardown = teardown, _mark_agent_gone = mark_agent_gone,
                           _set_quota = set_quota, _remove_quota = remove_quota})

instance P'.Mergeable Call where
  mergeAppend (Call x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20)
   (Call y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20)
   = Call (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)
      (P'.mergeAppend x'20 y'20)

instance P'.Default Call where
  defaultValue
   = Call P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Call where
  wireSize ft' self'@(Call x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 2 11 x'11
             + P'.wireSizeOpt 2 11 x'12
             + P'.wireSizeOpt 1 11 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 2 11 x'16
             + P'.wireSizeOpt 2 11 x'17
             + P'.wireSizeOpt 2 11 x'18
             + P'.wireSizeOpt 1 11 x'19
             + P'.wireSizeOpt 1 11 x'20)
  wirePutWithSize ft' self'@(Call x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutOptWithSize 50 11 x'6,
             P'.wirePutOptWithSize 58 11 x'7, P'.wirePutOptWithSize 66 11 x'8, P'.wirePutOptWithSize 74 11 x'9,
             P'.wirePutOptWithSize 82 11 x'10, P'.wirePutOptWithSize 90 11 x'13, P'.wirePutOptWithSize 98 11 x'14,
             P'.wirePutOptWithSize 106 11 x'15, P'.wirePutOptWithSize 114 11 x'19, P'.wirePutOptWithSize 122 11 x'20,
             P'.wirePutOptWithSize 130 11 x'17, P'.wirePutOptWithSize 138 11 x'18, P'.wirePutOptWithSize 146 11 x'11,
             P'.wirePutOptWithSize 154 11 x'12, P'.wirePutOptWithSize 162 11 x'16]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_get_metrics = P'.mergeAppend (_get_metrics old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_set_logging_level = P'.mergeAppend (_set_logging_level old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_list_files = P'.mergeAppend (_list_files old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_read_file = P'.mergeAppend (_read_file old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_update_weights = P'.mergeAppend (_update_weights old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_reserve_resources = P'.mergeAppend (_reserve_resources old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_unreserve_resources = P'.mergeAppend (_unreserve_resources old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_create_volumes = P'.mergeAppend (_create_volumes old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_destroy_volumes = P'.mergeAppend (_destroy_volumes old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             146 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_grow_volume = P'.mergeAppend (_grow_volume old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             154 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_shrink_volume = P'.mergeAppend (_shrink_volume old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_update_maintenance_schedule =
                                P'.mergeAppend (_update_maintenance_schedule old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             98 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_start_maintenance = P'.mergeAppend (_start_maintenance old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_stop_maintenance = P'.mergeAppend (_stop_maintenance old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             162 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_update_quota = P'.mergeAppend (_update_quota old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_teardown = P'.mergeAppend (_teardown old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             138 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_mark_agent_gone = P'.mergeAppend (_mark_agent_gone old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_set_quota = P'.mergeAppend (_set_quota old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{_remove_quota = P'.mergeAppend (_remove_quota old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Call) Call where
  getVal m' f' = f' m'

instance P'.GPB Call

instance P'.ReflectDescriptor Call where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58, 66, 74, 82, 90, 98, 106, 114, 122, 130, 138, 146, 154, 162])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\"], baseName = MName \"Call\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.get_metrics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"get_metrics\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.GetMetrics\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"GetMetrics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.set_logging_level\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"set_logging_level\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.SetLoggingLevel\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"SetLoggingLevel\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.list_files\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"list_files\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ListFiles\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ListFiles\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.read_file\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"read_file\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ReadFile\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReadFile\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.update_weights\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update_weights\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateWeights\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateWeights\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.reserve_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"reserve_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ReserveResources\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReserveResources\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.unreserve_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"unreserve_resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UnreserveResources\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UnreserveResources\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.create_volumes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"create_volumes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.CreateVolumes\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"CreateVolumes\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.destroy_volumes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"destroy_volumes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.DestroyVolumes\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"DestroyVolumes\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.grow_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"grow_volume\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.GrowVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"GrowVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.shrink_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"shrink_volume\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ShrinkVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ShrinkVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.update_maintenance_schedule\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update_maintenance_schedule\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateMaintenanceSchedule\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateMaintenanceSchedule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.start_maintenance\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"start_maintenance\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.StartMaintenance\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"StartMaintenance\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.stop_maintenance\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"stop_maintenance\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.StopMaintenance\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"StopMaintenance\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.update_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update_quota\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 162}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.teardown\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"teardown\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.Teardown\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Teardown\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.mark_agent_gone\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"mark_agent_gone\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 138}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.MarkAgentGone\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"MarkAgentGone\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.set_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"set_quota\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.SetQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"SetQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.remove_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"remove_quota\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.RemoveQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"RemoveQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Call where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Call where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "get_metrics" (_get_metrics msg)
       P'.tellT "set_logging_level" (_set_logging_level msg)
       P'.tellT "list_files" (_list_files msg)
       P'.tellT "read_file" (_read_file msg)
       P'.tellT "update_weights" (_update_weights msg)
       P'.tellT "reserve_resources" (_reserve_resources msg)
       P'.tellT "unreserve_resources" (_unreserve_resources msg)
       P'.tellT "create_volumes" (_create_volumes msg)
       P'.tellT "destroy_volumes" (_destroy_volumes msg)
       P'.tellT "grow_volume" (_grow_volume msg)
       P'.tellT "shrink_volume" (_shrink_volume msg)
       P'.tellT "update_maintenance_schedule" (_update_maintenance_schedule msg)
       P'.tellT "start_maintenance" (_start_maintenance msg)
       P'.tellT "stop_maintenance" (_stop_maintenance msg)
       P'.tellT "update_quota" (_update_quota msg)
       P'.tellT "teardown" (_teardown msg)
       P'.tellT "mark_agent_gone" (_mark_agent_gone msg)
       P'.tellT "set_quota" (_set_quota msg)
       P'.tellT "remove_quota" (_remove_quota msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_get_metrics, parse'_set_logging_level, parse'_list_files, parse'_read_file,
                   parse'_update_weights, parse'_reserve_resources, parse'_unreserve_resources, parse'_create_volumes,
                   parse'_destroy_volumes, parse'_grow_volume, parse'_shrink_volume, parse'_update_maintenance_schedule,
                   parse'_start_maintenance, parse'_stop_maintenance, parse'_update_quota, parse'_teardown, parse'_mark_agent_gone,
                   parse'_set_quota, parse'_remove_quota])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_get_metrics
         = P'.try
            (do
               v <- P'.getT "get_metrics"
               Prelude'.return (\ o -> o{_get_metrics = v}))
        parse'_set_logging_level
         = P'.try
            (do
               v <- P'.getT "set_logging_level"
               Prelude'.return (\ o -> o{_set_logging_level = v}))
        parse'_list_files
         = P'.try
            (do
               v <- P'.getT "list_files"
               Prelude'.return (\ o -> o{_list_files = v}))
        parse'_read_file
         = P'.try
            (do
               v <- P'.getT "read_file"
               Prelude'.return (\ o -> o{_read_file = v}))
        parse'_update_weights
         = P'.try
            (do
               v <- P'.getT "update_weights"
               Prelude'.return (\ o -> o{_update_weights = v}))
        parse'_reserve_resources
         = P'.try
            (do
               v <- P'.getT "reserve_resources"
               Prelude'.return (\ o -> o{_reserve_resources = v}))
        parse'_unreserve_resources
         = P'.try
            (do
               v <- P'.getT "unreserve_resources"
               Prelude'.return (\ o -> o{_unreserve_resources = v}))
        parse'_create_volumes
         = P'.try
            (do
               v <- P'.getT "create_volumes"
               Prelude'.return (\ o -> o{_create_volumes = v}))
        parse'_destroy_volumes
         = P'.try
            (do
               v <- P'.getT "destroy_volumes"
               Prelude'.return (\ o -> o{_destroy_volumes = v}))
        parse'_grow_volume
         = P'.try
            (do
               v <- P'.getT "grow_volume"
               Prelude'.return (\ o -> o{_grow_volume = v}))
        parse'_shrink_volume
         = P'.try
            (do
               v <- P'.getT "shrink_volume"
               Prelude'.return (\ o -> o{_shrink_volume = v}))
        parse'_update_maintenance_schedule
         = P'.try
            (do
               v <- P'.getT "update_maintenance_schedule"
               Prelude'.return (\ o -> o{_update_maintenance_schedule = v}))
        parse'_start_maintenance
         = P'.try
            (do
               v <- P'.getT "start_maintenance"
               Prelude'.return (\ o -> o{_start_maintenance = v}))
        parse'_stop_maintenance
         = P'.try
            (do
               v <- P'.getT "stop_maintenance"
               Prelude'.return (\ o -> o{_stop_maintenance = v}))
        parse'_update_quota
         = P'.try
            (do
               v <- P'.getT "update_quota"
               Prelude'.return (\ o -> o{_update_quota = v}))
        parse'_teardown
         = P'.try
            (do
               v <- P'.getT "teardown"
               Prelude'.return (\ o -> o{_teardown = v}))
        parse'_mark_agent_gone
         = P'.try
            (do
               v <- P'.getT "mark_agent_gone"
               Prelude'.return (\ o -> o{_mark_agent_gone = v}))
        parse'_set_quota
         = P'.try
            (do
               v <- P'.getT "set_quota"
               Prelude'.return (\ o -> o{_set_quota = v}))
        parse'_remove_quota
         = P'.try
            (do
               v <- P'.getT "remove_quota"
               Prelude'.return (\ o -> o{_remove_quota = v}))