{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Call (Call(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Scheduler.Protos.Call.Accept as Protos.Call (Accept)
import qualified Mesos.V1.Scheduler.Protos.Call.AcceptInverseOffers as Protos.Call (AcceptInverseOffers)
import qualified Mesos.V1.Scheduler.Protos.Call.Acknowledge as Protos.Call (Acknowledge)
import qualified Mesos.V1.Scheduler.Protos.Call.AcknowledgeOperationStatus as Protos.Call (AcknowledgeOperationStatus)
import qualified Mesos.V1.Scheduler.Protos.Call.Decline as Protos.Call (Decline)
import qualified Mesos.V1.Scheduler.Protos.Call.DeclineInverseOffers as Protos.Call (DeclineInverseOffers)
import qualified Mesos.V1.Scheduler.Protos.Call.Kill as Protos.Call (Kill)
import qualified Mesos.V1.Scheduler.Protos.Call.Message as Protos.Call (Message)
import qualified Mesos.V1.Scheduler.Protos.Call.Reconcile as Protos.Call (Reconcile)
import qualified Mesos.V1.Scheduler.Protos.Call.ReconcileOperations as Protos.Call (ReconcileOperations)
import qualified Mesos.V1.Scheduler.Protos.Call.Request as Protos.Call (Request)
import qualified Mesos.V1.Scheduler.Protos.Call.Revive as Protos.Call (Revive)
import qualified Mesos.V1.Scheduler.Protos.Call.Shutdown as Protos.Call (Shutdown)
import qualified Mesos.V1.Scheduler.Protos.Call.Subscribe as Protos.Call (Subscribe)
import qualified Mesos.V1.Scheduler.Protos.Call.Suppress as Protos.Call (Suppress)
import qualified Mesos.V1.Scheduler.Protos.Call.Type as Protos.Call (Type)

data Call = Call{framework_id :: !(P'.Maybe Protos.FrameworkID), type' :: !(P'.Maybe Protos.Call.Type),
                 subscribe :: !(P'.Maybe Protos.Call.Subscribe), accept :: !(P'.Maybe Protos.Call.Accept),
                 decline :: !(P'.Maybe Protos.Call.Decline), accept_inverse_offers :: !(P'.Maybe Protos.Call.AcceptInverseOffers),
                 decline_inverse_offers :: !(P'.Maybe Protos.Call.DeclineInverseOffers), revive :: !(P'.Maybe Protos.Call.Revive),
                 kill :: !(P'.Maybe Protos.Call.Kill), shutdown :: !(P'.Maybe Protos.Call.Shutdown),
                 acknowledge :: !(P'.Maybe Protos.Call.Acknowledge),
                 acknowledge_operation_status :: !(P'.Maybe Protos.Call.AcknowledgeOperationStatus),
                 reconcile :: !(P'.Maybe Protos.Call.Reconcile),
                 reconcile_operations :: !(P'.Maybe Protos.Call.ReconcileOperations), message :: !(P'.Maybe Protos.Call.Message),
                 request :: !(P'.Maybe Protos.Call.Request), suppress :: !(P'.Maybe Protos.Call.Suppress)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Call where
  mergeAppend (Call x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17)
   (Call y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17)
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

instance P'.Wire Call where
  wireSize ft' self'@(Call x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11
             + P'.wireSizeOpt 2 11 x'12
             + P'.wireSizeOpt 1 11 x'13
             + P'.wireSizeOpt 2 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 1 11 x'16
             + P'.wireSizeOpt 2 11 x'17)
  wirePutWithSize ft' self'@(Call x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 16 14 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4, P'.wirePutOptWithSize 42 11 x'5, P'.wirePutOptWithSize 50 11 x'9,
             P'.wirePutOptWithSize 58 11 x'10, P'.wirePutOptWithSize 66 11 x'11, P'.wirePutOptWithSize 74 11 x'13,
             P'.wirePutOptWithSize 82 11 x'15, P'.wirePutOptWithSize 90 11 x'16, P'.wirePutOptWithSize 106 11 x'6,
             P'.wirePutOptWithSize 114 11 x'7, P'.wirePutOptWithSize 122 11 x'8, P'.wirePutOptWithSize 130 11 x'17,
             P'.wirePutOptWithSize 138 11 x'12, P'.wirePutOptWithSize 146 11 x'14]
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
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{framework_id = P'.mergeAppend (framework_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{subscribe = P'.mergeAppend (subscribe old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{accept = P'.mergeAppend (accept old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{decline = P'.mergeAppend (decline old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{accept_inverse_offers = P'.mergeAppend (accept_inverse_offers old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{decline_inverse_offers =
                                 P'.mergeAppend (decline_inverse_offers old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap (\ !new'Field -> old'Self{revive = P'.mergeAppend (revive old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{kill = P'.mergeAppend (kill old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{shutdown = P'.mergeAppend (shutdown old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{acknowledge = P'.mergeAppend (acknowledge old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             138 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{acknowledge_operation_status =
                                 P'.mergeAppend (acknowledge_operation_status old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{reconcile = P'.mergeAppend (reconcile old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             146 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{reconcile_operations = P'.mergeAppend (reconcile_operations old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{message = P'.mergeAppend (message old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{request = P'.mergeAppend (request old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{suppress = P'.mergeAppend (suppress old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Call) Call where
  getVal m' f' = f' m'

instance P'.GPB Call

instance P'.ReflectDescriptor Call where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [10, 16, 26, 34, 42, 50, 58, 66, 74, 82, 90, 106, 114, 122, 130, 138, 146])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\"], baseName = MName \"Call\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Call.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.framework_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"framework_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.subscribe\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"subscribe\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Subscribe\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Subscribe\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.accept\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"accept\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Accept\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Accept\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.decline\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"decline\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Decline\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Decline\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.accept_inverse_offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"accept_inverse_offers\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.AcceptInverseOffers\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"AcceptInverseOffers\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.decline_inverse_offers\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"decline_inverse_offers\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.DeclineInverseOffers\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"DeclineInverseOffers\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.revive\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"revive\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Revive\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Revive\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.kill\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"kill\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Kill\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Kill\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.shutdown\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"shutdown\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Shutdown\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Shutdown\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.acknowledge\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"acknowledge\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Acknowledge\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Acknowledge\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.acknowledge_operation_status\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"acknowledge_operation_status\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 138}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.AcknowledgeOperationStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"AcknowledgeOperationStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.reconcile\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"reconcile\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Reconcile\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Reconcile\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.reconcile_operations\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"reconcile_operations\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.ReconcileOperations\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"ReconcileOperations\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.message\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"message\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Message\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Message\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.request\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"request\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Request\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Request\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.suppress\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\"], baseName' = FName \"suppress\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Suppress\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Suppress\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType Call where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Call where
  textPut msg
   = do
       P'.tellT "framework_id" (framework_id msg)
       P'.tellT "type" (type' msg)
       P'.tellT "subscribe" (subscribe msg)
       P'.tellT "accept" (accept msg)
       P'.tellT "decline" (decline msg)
       P'.tellT "accept_inverse_offers" (accept_inverse_offers msg)
       P'.tellT "decline_inverse_offers" (decline_inverse_offers msg)
       P'.tellT "revive" (revive msg)
       P'.tellT "kill" (kill msg)
       P'.tellT "shutdown" (shutdown msg)
       P'.tellT "acknowledge" (acknowledge msg)
       P'.tellT "acknowledge_operation_status" (acknowledge_operation_status msg)
       P'.tellT "reconcile" (reconcile msg)
       P'.tellT "reconcile_operations" (reconcile_operations msg)
       P'.tellT "message" (message msg)
       P'.tellT "request" (request msg)
       P'.tellT "suppress" (suppress msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'framework_id, parse'type', parse'subscribe, parse'accept, parse'decline, parse'accept_inverse_offers,
                   parse'decline_inverse_offers, parse'revive, parse'kill, parse'shutdown, parse'acknowledge,
                   parse'acknowledge_operation_status, parse'reconcile, parse'reconcile_operations, parse'message, parse'request,
                   parse'suppress])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'framework_id
         = P'.try
            (do
               v <- P'.getT "framework_id"
               Prelude'.return (\ o -> o{framework_id = v}))
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'subscribe
         = P'.try
            (do
               v <- P'.getT "subscribe"
               Prelude'.return (\ o -> o{subscribe = v}))
        parse'accept
         = P'.try
            (do
               v <- P'.getT "accept"
               Prelude'.return (\ o -> o{accept = v}))
        parse'decline
         = P'.try
            (do
               v <- P'.getT "decline"
               Prelude'.return (\ o -> o{decline = v}))
        parse'accept_inverse_offers
         = P'.try
            (do
               v <- P'.getT "accept_inverse_offers"
               Prelude'.return (\ o -> o{accept_inverse_offers = v}))
        parse'decline_inverse_offers
         = P'.try
            (do
               v <- P'.getT "decline_inverse_offers"
               Prelude'.return (\ o -> o{decline_inverse_offers = v}))
        parse'revive
         = P'.try
            (do
               v <- P'.getT "revive"
               Prelude'.return (\ o -> o{revive = v}))
        parse'kill
         = P'.try
            (do
               v <- P'.getT "kill"
               Prelude'.return (\ o -> o{kill = v}))
        parse'shutdown
         = P'.try
            (do
               v <- P'.getT "shutdown"
               Prelude'.return (\ o -> o{shutdown = v}))
        parse'acknowledge
         = P'.try
            (do
               v <- P'.getT "acknowledge"
               Prelude'.return (\ o -> o{acknowledge = v}))
        parse'acknowledge_operation_status
         = P'.try
            (do
               v <- P'.getT "acknowledge_operation_status"
               Prelude'.return (\ o -> o{acknowledge_operation_status = v}))
        parse'reconcile
         = P'.try
            (do
               v <- P'.getT "reconcile"
               Prelude'.return (\ o -> o{reconcile = v}))
        parse'reconcile_operations
         = P'.try
            (do
               v <- P'.getT "reconcile_operations"
               Prelude'.return (\ o -> o{reconcile_operations = v}))
        parse'message
         = P'.try
            (do
               v <- P'.getT "message"
               Prelude'.return (\ o -> o{message = v}))
        parse'request
         = P'.try
            (do
               v <- P'.getT "request"
               Prelude'.return (\ o -> o{request = v}))
        parse'suppress
         = P'.try
            (do
               v <- P'.getT "suppress"
               Prelude'.return (\ o -> o{suppress = v}))