{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DeviceAccess (DeviceAccess(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Device as Protos (Device)
import qualified Mesos.V1.Protos.DeviceAccess.Access as Protos.DeviceAccess (Access)

data DeviceAccess = DeviceAccess{device :: !(Protos.Device), access :: !(Protos.DeviceAccess.Access)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON DeviceAccess where
  toJSON msg = P'.objectNoEmpty ([("device", P'.toJSON (device msg)), ("access", P'.toJSON (access msg))] ++ Prelude'.concat [])

instance P'.FromJSON DeviceAccess where
  parseJSON
   = P'.withObject "DeviceAccess"
      (\ o ->
        do
          device <- P'.explicitParseField P'.parseJSON o "device"
          access <- P'.explicitParseField P'.parseJSON o "access"
          Prelude'.return P'.defaultValue{device = device, access = access})

instance P'.Mergeable DeviceAccess where
  mergeAppend (DeviceAccess x'1 x'2) (DeviceAccess y'1 y'2) = DeviceAccess (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default DeviceAccess where
  defaultValue = DeviceAccess P'.defaultValue P'.defaultValue

instance P'.Wire DeviceAccess where
  wireSize ft' self'@(DeviceAccess x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(DeviceAccess x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{device = P'.mergeAppend (device old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{access = P'.mergeAppend (access old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DeviceAccess) DeviceAccess where
  getVal m' f' = f' m'

instance P'.GPB DeviceAccess

instance P'.ReflectDescriptor DeviceAccess where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DeviceAccess\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DeviceAccess\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DeviceAccess.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DeviceAccess.device\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DeviceAccess\"], baseName' = FName \"device\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Device\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Device\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DeviceAccess.access\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DeviceAccess\"], baseName' = FName \"access\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DeviceAccess.Access\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DeviceAccess\"], baseName = MName \"Access\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType DeviceAccess where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DeviceAccess where
  textPut msg
   = do
       P'.tellT "device" (device msg)
       P'.tellT "access" (access msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'device, parse'access]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'device
         = P'.try
            (do
               v <- P'.getT "device"
               Prelude'.return (\ o -> o{device = v}))
        parse'access
         = P'.try
            (do
               v <- P'.getT "access"
               Prelude'.return (\ o -> o{access = v}))