{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Maintenance.Protos.ClusterStatus.DrainingMachine (DrainingMachine(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Allocator.Protos.InverseOfferStatus as Protos (InverseOfferStatus)
import qualified Mesos.V1.Protos.MachineID as Protos (MachineID)

data DrainingMachine = DrainingMachine{id :: !(Protos.MachineID), statuses :: !(P'.Seq Protos.InverseOfferStatus)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable DrainingMachine where
  mergeAppend (DrainingMachine x'1 x'2) (DrainingMachine y'1 y'2)
   = DrainingMachine (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default DrainingMachine where
  defaultValue = DrainingMachine P'.defaultValue P'.defaultValue

instance P'.Wire DrainingMachine where
  wireSize ft' self'@(DrainingMachine x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePutWithSize ft' self'@(DrainingMachine x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{id = P'.mergeAppend (id old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{statuses = P'.append (statuses old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DrainingMachine) DrainingMachine where
  getVal m' f' = f' m'

instance P'.GPB DrainingMachine

instance P'.ReflectDescriptor DrainingMachine where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.maintenance.ClusterStatus.DrainingMachine\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\",MName \"ClusterStatus\"], baseName = MName \"DrainingMachine\"}, descFilePath = [\"Mesos\",\"V1\",\"Maintenance\",\"Protos\",\"ClusterStatus\",\"DrainingMachine.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.ClusterStatus.DrainingMachine.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"ClusterStatus\",MName \"DrainingMachine\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MachineID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MachineID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.ClusterStatus.DrainingMachine.statuses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"ClusterStatus\",MName \"DrainingMachine\"], baseName' = FName \"statuses\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.allocator.InverseOfferStatus\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Allocator\"], parentModule = [MName \"Protos\"], baseName = MName \"InverseOfferStatus\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType DrainingMachine where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DrainingMachine where
  textPut msg
   = do
       P'.tellT "id" (id msg)
       P'.tellT "statuses" (statuses msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'id, parse'statuses]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{id = v}))
        parse'statuses
         = P'.try
            (do
               v <- P'.getT "statuses"
               Prelude'.return (\ o -> o{statuses = P'.append (statuses o) v}))