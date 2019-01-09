{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.StopMaintenance (StopMaintenance(..), machines) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.MachineID as Protos (MachineID)

data StopMaintenance = StopMaintenance{_machines :: !(P'.Seq Protos.MachineID)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''StopMaintenance

instance P'.ToJSON StopMaintenance where
  toJSON msg = P'.objectNoEmpty ([("machines", P'.toJSON (Prelude'.fmap P'.toJSON (machines msg)))] ++ Prelude'.concat [])

instance P'.FromJSON StopMaintenance where
  parseJSON
   = P'.withObject "StopMaintenance"
      (\ o ->
        do
          machines <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                       (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "machines")
          Prelude'.return P'.defaultValue{_machines = machines})

instance P'.Mergeable StopMaintenance where
  mergeAppend (StopMaintenance x'1) (StopMaintenance y'1) = StopMaintenance (P'.mergeAppend x'1 y'1)

instance P'.Default StopMaintenance where
  defaultValue = StopMaintenance P'.defaultValue

instance P'.Wire StopMaintenance where
  wireSize ft' self'@(StopMaintenance x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(StopMaintenance x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_machines = P'.append (_machines old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> StopMaintenance) StopMaintenance where
  getVal m' f' = f' m'

instance P'.GPB StopMaintenance

instance P'.ReflectDescriptor StopMaintenance where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call.StopMaintenance\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"StopMaintenance\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call\",\"StopMaintenance.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.StopMaintenance.machines\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"StopMaintenance\"], baseName' = FName \"machines\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MachineID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MachineID\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType StopMaintenance where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg StopMaintenance where
  textPut msg
   = do
       P'.tellT "machines" (_machines msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_machines]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_machines
         = P'.try
            (do
               v <- P'.getT "machines"
               Prelude'.return (\ o -> o{_machines = P'.append (_machines o) v}))