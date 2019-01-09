{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DeviceWhitelist (DeviceWhitelist(..), allowed_devices) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.DeviceAccess as Protos (DeviceAccess)

data DeviceWhitelist = DeviceWhitelist{_allowed_devices :: !(P'.Seq Protos.DeviceAccess)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''DeviceWhitelist

instance P'.ToJSON DeviceWhitelist where
  toJSON msg
   = P'.objectNoEmpty ([("allowed_devices", P'.toJSON (Prelude'.fmap P'.toJSON (allowed_devices msg)))] ++ Prelude'.concat [])

instance P'.FromJSON DeviceWhitelist where
  parseJSON
   = P'.withObject "DeviceWhitelist"
      (\ o ->
        do
          allowed_devices <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                              (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "allowed_devices")
          Prelude'.return P'.defaultValue{_allowed_devices = allowed_devices})

instance P'.Mergeable DeviceWhitelist where
  mergeAppend (DeviceWhitelist x'1) (DeviceWhitelist y'1) = DeviceWhitelist (P'.mergeAppend x'1 y'1)

instance P'.Default DeviceWhitelist where
  defaultValue = DeviceWhitelist P'.defaultValue

instance P'.Wire DeviceWhitelist where
  wireSize ft' self'@(DeviceWhitelist x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1)
  wirePutWithSize ft' self'@(DeviceWhitelist x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_allowed_devices = P'.append (_allowed_devices old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DeviceWhitelist) DeviceWhitelist where
  getVal m' f' = f' m'

instance P'.GPB DeviceWhitelist

instance P'.ReflectDescriptor DeviceWhitelist where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DeviceWhitelist\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DeviceWhitelist\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DeviceWhitelist.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DeviceWhitelist.allowed_devices\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DeviceWhitelist\"], baseName' = FName \"allowed_devices\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DeviceAccess\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DeviceAccess\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType DeviceWhitelist where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DeviceWhitelist where
  textPut msg
   = do
       P'.tellT "allowed_devices" (_allowed_devices msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_allowed_devices]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_allowed_devices
         = P'.try
            (do
               v <- P'.getT "allowed_devices"
               Prelude'.return (\ o -> o{_allowed_devices = P'.append (_allowed_devices o) v}))