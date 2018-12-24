{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Maintenance.Protos.ClusterStatus (ClusterStatus(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Maintenance.Protos.ClusterStatus.DrainingMachine as Protos.ClusterStatus (DrainingMachine)
import qualified Mesos.V1.Protos.MachineID as Protos (MachineID)

data ClusterStatus = ClusterStatus{draining_machines :: !(P'.Seq Protos.ClusterStatus.DrainingMachine),
                                   down_machines :: !(P'.Seq Protos.MachineID)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON ClusterStatus where
  toJSON msg
   = P'.objectNoEmpty
      ([("draining_machines", P'.toJSON (Prelude'.fmap P'.toJSON (draining_machines msg))),
        ("down_machines", P'.toJSON (Prelude'.fmap P'.toJSON (down_machines msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ClusterStatus where
  parseJSON
   = P'.withObject "ClusterStatus"
      (\ o ->
        do
          draining_machines <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "draining_machines")
          down_machines <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "down_machines")
          Prelude'.return P'.defaultValue{draining_machines = draining_machines, down_machines = down_machines})

instance P'.Mergeable ClusterStatus where
  mergeAppend (ClusterStatus x'1 x'2) (ClusterStatus y'1 y'2) = ClusterStatus (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default ClusterStatus where
  defaultValue = ClusterStatus P'.defaultValue P'.defaultValue

instance P'.Wire ClusterStatus where
  wireSize ft' self'@(ClusterStatus x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(ClusterStatus x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{draining_machines = P'.append (draining_machines old'Self) new'Field})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{down_machines = P'.append (down_machines old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ClusterStatus) ClusterStatus where
  getVal m' f' = f' m'

instance P'.GPB ClusterStatus

instance P'.ReflectDescriptor ClusterStatus where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.maintenance.ClusterStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\"], baseName = MName \"ClusterStatus\"}, descFilePath = [\"Mesos\",\"V1\",\"Maintenance\",\"Protos\",\"ClusterStatus.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.ClusterStatus.draining_machines\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"ClusterStatus\"], baseName' = FName \"draining_machines\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.maintenance.ClusterStatus.DrainingMachine\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\",MName \"ClusterStatus\"], baseName = MName \"DrainingMachine\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.ClusterStatus.down_machines\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"ClusterStatus\"], baseName' = FName \"down_machines\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MachineID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MachineID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType ClusterStatus where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ClusterStatus where
  textPut msg
   = do
       P'.tellT "draining_machines" (draining_machines msg)
       P'.tellT "down_machines" (down_machines msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'draining_machines, parse'down_machines]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'draining_machines
         = P'.try
            (do
               v <- P'.getT "draining_machines"
               Prelude'.return (\ o -> o{draining_machines = P'.append (draining_machines o) v}))
        parse'down_machines
         = P'.try
            (do
               v <- P'.getT "down_machines"
               Prelude'.return (\ o -> o{down_machines = P'.append (down_machines o) v}))