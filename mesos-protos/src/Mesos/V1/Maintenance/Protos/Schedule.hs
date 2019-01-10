{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Maintenance.Protos.Schedule (Schedule(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Maintenance.Protos.Window as Protos (Window)

data Schedule = Schedule{windows :: !(P'.Seq Protos.Window)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Schedule where
  toJSON msg = P'.objectNoEmpty ([("windows", P'.toJSON (Prelude'.fmap P'.toJSON (windows msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Schedule where
  parseJSON
   = P'.withObject "Schedule"
      (\ o ->
        do
          windows <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                      (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "windows")
          Prelude'.return P'.defaultValue{windows = windows})

instance P'.Mergeable Schedule where
  mergeAppend (Schedule x'1) (Schedule y'1) = Schedule (P'.mergeAppend x'1 y'1)

instance P'.Default Schedule where
  defaultValue = Schedule P'.defaultValue

instance P'.Wire Schedule where
  wireSize ft' self'@(Schedule x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(Schedule x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{windows = P'.append (windows old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Schedule) Schedule where
  getVal m' f' = f' m'

instance P'.GPB Schedule

instance P'.ReflectDescriptor Schedule where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.maintenance.Schedule\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\"], baseName = MName \"Schedule\"}, descFilePath = [\"Mesos\",\"V1\",\"Maintenance\",\"Protos\",\"Schedule.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.maintenance.Schedule.windows\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule' = [MName \"Protos\",MName \"Schedule\"], baseName' = FName \"windows\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.maintenance.Window\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Maintenance\"], parentModule = [MName \"Protos\"], baseName = MName \"Window\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Schedule where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Schedule where
  textPut msg
   = do
       P'.tellT "windows" (windows msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'windows]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'windows
         = P'.try
            (do
               v <- P'.getT "windows"
               Prelude'.return (\ o -> o{windows = P'.append (windows o) v}))