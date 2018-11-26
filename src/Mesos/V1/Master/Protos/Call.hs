{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call (Call(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
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

data Call = Call{type' :: !(P'.Maybe Protos.Call.Type), get_metrics :: !(P'.Maybe Protos.Call.GetMetrics),
                 set_logging_level :: !(P'.Maybe Protos.Call.SetLoggingLevel), list_files :: !(P'.Maybe Protos.Call.ListFiles),
                 read_file :: !(P'.Maybe Protos.Call.ReadFile), update_weights :: !(P'.Maybe Protos.Call.UpdateWeights),
                 reserve_resources :: !(P'.Maybe Protos.Call.ReserveResources),
                 unreserve_resources :: !(P'.Maybe Protos.Call.UnreserveResources),
                 create_volumes :: !(P'.Maybe Protos.Call.CreateVolumes), destroy_volumes :: !(P'.Maybe Protos.Call.DestroyVolumes),
                 grow_volume :: !(P'.Maybe Protos.Call.GrowVolume), shrink_volume :: !(P'.Maybe Protos.Call.ShrinkVolume),
                 update_maintenance_schedule :: !(P'.Maybe Protos.Call.UpdateMaintenanceSchedule),
                 start_maintenance :: !(P'.Maybe Protos.Call.StartMaintenance),
                 stop_maintenance :: !(P'.Maybe Protos.Call.StopMaintenance), update_quota :: !(P'.Maybe Protos.Call.UpdateQuota),
                 teardown :: !(P'.Maybe Protos.Call.Teardown), mark_agent_gone :: !(P'.Maybe Protos.Call.MarkAgentGone),
                 set_quota :: !(P'.Maybe Protos.Call.SetQuota), remove_quota :: !(P'.Maybe Protos.Call.RemoveQuota)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

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
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{get_metrics = P'.mergeAppend (get_metrics old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{set_logging_level = P'.mergeAppend (set_logging_level old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{list_files = P'.mergeAppend (list_files old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{read_file = P'.mergeAppend (read_file old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{update_weights = P'.mergeAppend (update_weights old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{reserve_resources = P'.mergeAppend (reserve_resources old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{unreserve_resources = P'.mergeAppend (unreserve_resources old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{create_volumes = P'.mergeAppend (create_volumes old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{destroy_volumes = P'.mergeAppend (destroy_volumes old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             146 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{grow_volume = P'.mergeAppend (grow_volume old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             154 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{shrink_volume = P'.mergeAppend (shrink_volume old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{update_maintenance_schedule =
                                P'.mergeAppend (update_maintenance_schedule old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             98 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{start_maintenance = P'.mergeAppend (start_maintenance old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{stop_maintenance = P'.mergeAppend (stop_maintenance old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             162 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{update_quota = P'.mergeAppend (update_quota old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{teardown = P'.mergeAppend (teardown old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             138 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{mark_agent_gone = P'.mergeAppend (mark_agent_gone old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{set_quota = P'.mergeAppend (set_quota old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{remove_quota = P'.mergeAppend (remove_quota old'Self) (Prelude'.Just new'Field)})
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
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\"], baseName = MName \"Call\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.get_metrics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"get_metrics\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.GetMetrics\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"GetMetrics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.set_logging_level\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"set_logging_level\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.SetLoggingLevel\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"SetLoggingLevel\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.list_files\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"list_files\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ListFiles\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ListFiles\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.read_file\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"read_file\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ReadFile\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReadFile\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.update_weights\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update_weights\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateWeights\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateWeights\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.reserve_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"reserve_resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ReserveResources\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReserveResources\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.unreserve_resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"unreserve_resources\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UnreserveResources\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UnreserveResources\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.create_volumes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"create_volumes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.CreateVolumes\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"CreateVolumes\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.destroy_volumes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"destroy_volumes\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.DestroyVolumes\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"DestroyVolumes\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.grow_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"grow_volume\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.GrowVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"GrowVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.shrink_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"shrink_volume\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.ShrinkVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ShrinkVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.update_maintenance_schedule\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update_maintenance_schedule\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateMaintenanceSchedule\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateMaintenanceSchedule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.start_maintenance\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"start_maintenance\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.StartMaintenance\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"StartMaintenance\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.stop_maintenance\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"stop_maintenance\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.StopMaintenance\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"StopMaintenance\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.update_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"update_quota\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 162}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.UpdateQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"UpdateQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.teardown\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"teardown\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.Teardown\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Teardown\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.mark_agent_gone\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"mark_agent_gone\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 138}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.MarkAgentGone\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"MarkAgentGone\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.set_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"set_quota\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.SetQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"SetQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.remove_quota\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"remove_quota\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Call.RemoveQuota\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"RemoveQuota\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Call where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Call where
  textPut msg
   = do
       P'.tellT "type" (type' msg)
       P'.tellT "get_metrics" (get_metrics msg)
       P'.tellT "set_logging_level" (set_logging_level msg)
       P'.tellT "list_files" (list_files msg)
       P'.tellT "read_file" (read_file msg)
       P'.tellT "update_weights" (update_weights msg)
       P'.tellT "reserve_resources" (reserve_resources msg)
       P'.tellT "unreserve_resources" (unreserve_resources msg)
       P'.tellT "create_volumes" (create_volumes msg)
       P'.tellT "destroy_volumes" (destroy_volumes msg)
       P'.tellT "grow_volume" (grow_volume msg)
       P'.tellT "shrink_volume" (shrink_volume msg)
       P'.tellT "update_maintenance_schedule" (update_maintenance_schedule msg)
       P'.tellT "start_maintenance" (start_maintenance msg)
       P'.tellT "stop_maintenance" (stop_maintenance msg)
       P'.tellT "update_quota" (update_quota msg)
       P'.tellT "teardown" (teardown msg)
       P'.tellT "mark_agent_gone" (mark_agent_gone msg)
       P'.tellT "set_quota" (set_quota msg)
       P'.tellT "remove_quota" (remove_quota msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'type', parse'get_metrics, parse'set_logging_level, parse'list_files, parse'read_file, parse'update_weights,
                   parse'reserve_resources, parse'unreserve_resources, parse'create_volumes, parse'destroy_volumes,
                   parse'grow_volume, parse'shrink_volume, parse'update_maintenance_schedule, parse'start_maintenance,
                   parse'stop_maintenance, parse'update_quota, parse'teardown, parse'mark_agent_gone, parse'set_quota,
                   parse'remove_quota])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'get_metrics
         = P'.try
            (do
               v <- P'.getT "get_metrics"
               Prelude'.return (\ o -> o{get_metrics = v}))
        parse'set_logging_level
         = P'.try
            (do
               v <- P'.getT "set_logging_level"
               Prelude'.return (\ o -> o{set_logging_level = v}))
        parse'list_files
         = P'.try
            (do
               v <- P'.getT "list_files"
               Prelude'.return (\ o -> o{list_files = v}))
        parse'read_file
         = P'.try
            (do
               v <- P'.getT "read_file"
               Prelude'.return (\ o -> o{read_file = v}))
        parse'update_weights
         = P'.try
            (do
               v <- P'.getT "update_weights"
               Prelude'.return (\ o -> o{update_weights = v}))
        parse'reserve_resources
         = P'.try
            (do
               v <- P'.getT "reserve_resources"
               Prelude'.return (\ o -> o{reserve_resources = v}))
        parse'unreserve_resources
         = P'.try
            (do
               v <- P'.getT "unreserve_resources"
               Prelude'.return (\ o -> o{unreserve_resources = v}))
        parse'create_volumes
         = P'.try
            (do
               v <- P'.getT "create_volumes"
               Prelude'.return (\ o -> o{create_volumes = v}))
        parse'destroy_volumes
         = P'.try
            (do
               v <- P'.getT "destroy_volumes"
               Prelude'.return (\ o -> o{destroy_volumes = v}))
        parse'grow_volume
         = P'.try
            (do
               v <- P'.getT "grow_volume"
               Prelude'.return (\ o -> o{grow_volume = v}))
        parse'shrink_volume
         = P'.try
            (do
               v <- P'.getT "shrink_volume"
               Prelude'.return (\ o -> o{shrink_volume = v}))
        parse'update_maintenance_schedule
         = P'.try
            (do
               v <- P'.getT "update_maintenance_schedule"
               Prelude'.return (\ o -> o{update_maintenance_schedule = v}))
        parse'start_maintenance
         = P'.try
            (do
               v <- P'.getT "start_maintenance"
               Prelude'.return (\ o -> o{start_maintenance = v}))
        parse'stop_maintenance
         = P'.try
            (do
               v <- P'.getT "stop_maintenance"
               Prelude'.return (\ o -> o{stop_maintenance = v}))
        parse'update_quota
         = P'.try
            (do
               v <- P'.getT "update_quota"
               Prelude'.return (\ o -> o{update_quota = v}))
        parse'teardown
         = P'.try
            (do
               v <- P'.getT "teardown"
               Prelude'.return (\ o -> o{teardown = v}))
        parse'mark_agent_gone
         = P'.try
            (do
               v <- P'.getT "mark_agent_gone"
               Prelude'.return (\ o -> o{mark_agent_gone = v}))
        parse'set_quota
         = P'.try
            (do
               v <- P'.getT "set_quota"
               Prelude'.return (\ o -> o{set_quota = v}))
        parse'remove_quota
         = P'.try
            (do
               v <- P'.getT "remove_quota"
               Prelude'.return (\ o -> o{remove_quota = v}))