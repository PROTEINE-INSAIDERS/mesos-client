{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DeviceAccess.Access (Access(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Access = Access{read :: !(P'.Maybe P'.Bool), write :: !(P'.Maybe P'.Bool), mknod :: !(P'.Maybe P'.Bool)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Access where
  toJSON msg
   = P'.objectNoEmpty
      ([("read", P'.toJSON (Prelude'.fmap P'.toJSON (read msg))), ("write", P'.toJSON (Prelude'.fmap P'.toJSON (write msg))),
        ("mknod", P'.toJSON (Prelude'.fmap P'.toJSON (mknod msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Access where
  parseJSON
   = P'.withObject "Access"
      (\ o ->
        do
          read <- P'.explicitParseFieldMaybe P'.parseJSONBool o "read"
          write <- P'.explicitParseFieldMaybe P'.parseJSONBool o "write"
          mknod <- P'.explicitParseFieldMaybe P'.parseJSONBool o "mknod"
          Prelude'.return P'.defaultValue{read = read, write = write, mknod = mknod})

instance P'.Mergeable Access where
  mergeAppend (Access x'1 x'2 x'3) (Access y'1 y'2 y'3)
   = Access (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Access where
  defaultValue = Access P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Access where
  wireSize ft' self'@(Access x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 8 x'3)
  wirePutWithSize ft' self'@(Access x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 8 x'1, P'.wirePutOptWithSize 16 8 x'2, P'.wirePutOptWithSize 24 8 x'3]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{read = Prelude'.Just new'Field}) (P'.wireGet 8)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{write = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{mknod = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Access) Access where
  getVal m' f' = f' m'

instance P'.GPB Access

instance P'.ReflectDescriptor Access where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DeviceAccess.Access\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DeviceAccess\"], baseName = MName \"Access\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DeviceAccess\",\"Access.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DeviceAccess.Access.read\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DeviceAccess\",MName \"Access\"], baseName' = FName \"read\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DeviceAccess.Access.write\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DeviceAccess\",MName \"Access\"], baseName' = FName \"write\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DeviceAccess.Access.mknod\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DeviceAccess\",MName \"Access\"], baseName' = FName \"mknod\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Access where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Access where
  textPut msg
   = do
       P'.tellT "read" (read msg)
       P'.tellT "write" (write msg)
       P'.tellT "mknod" (mknod msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'read, parse'write, parse'mknod]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'read
         = P'.try
            (do
               v <- P'.getT "read"
               Prelude'.return (\ o -> o{read = v}))
        parse'write
         = P'.try
            (do
               v <- P'.getT "write"
               Prelude'.return (\ o -> o{write = v}))
        parse'mknod
         = P'.try
            (do
               v <- P'.getT "mknod"
               Prelude'.return (\ o -> o{mknod = v}))