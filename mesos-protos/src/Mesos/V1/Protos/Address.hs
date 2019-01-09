{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Address (Address(..), hostname, ip, port) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Address = Address{_hostname :: !(P'.Maybe P'.Utf8), _ip :: !(P'.Maybe P'.Utf8), _port :: !(P'.Int32)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Address

instance P'.ToJSON Address where
  toJSON msg
   = P'.objectNoEmpty
      ([("hostname", P'.toJSON (Prelude'.fmap P'.toJSON (hostname msg))), ("ip", P'.toJSON (Prelude'.fmap P'.toJSON (ip msg))),
        ("port", P'.toJSON (port msg))]
        ++ Prelude'.concat [])

instance P'.FromJSON Address where
  parseJSON
   = P'.withObject "Address"
      (\ o ->
        do
          hostname <- P'.explicitParseFieldMaybe P'.parseJSON o "hostname"
          ip <- P'.explicitParseFieldMaybe P'.parseJSON o "ip"
          port <- P'.explicitParseField P'.parseJSON o "port"
          Prelude'.return P'.defaultValue{_hostname = hostname, _ip = ip, _port = port})

instance P'.Mergeable Address where
  mergeAppend (Address x'1 x'2 x'3) (Address y'1 y'2 y'3)
   = Address (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Address where
  defaultValue = Address P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Address where
  wireSize ft' self'@(Address x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeReq 1 5 x'3)
  wirePutWithSize ft' self'@(Address x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 9 x'1, P'.wirePutOptWithSize 18 9 x'2, P'.wirePutReqWithSize 24 5 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_hostname = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_ip = Prelude'.Just new'Field}) (P'.wireGet 9)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_port = new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Address) Address where
  getVal m' f' = f' m'

instance P'.GPB Address

instance P'.ReflectDescriptor Address where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [24]) (P'.fromDistinctAscList [10, 18, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Address\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Address\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Address.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Address.hostname\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Address\"], baseName' = FName \"hostname\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Address.ip\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Address\"], baseName' = FName \"ip\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Address.port\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Address\"], baseName' = FName \"port\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Address where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Address where
  textPut msg
   = do
       P'.tellT "hostname" (_hostname msg)
       P'.tellT "ip" (_ip msg)
       P'.tellT "port" (_port msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_hostname, parse'_ip, parse'_port]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{_hostname = v}))
        parse'_ip
         = P'.try
            (do
               v <- P'.getT "ip"
               Prelude'.return (\ o -> o{_ip = v}))
        parse'_port
         = P'.try
            (do
               v <- P'.getT "port"
               Prelude'.return (\ o -> o{_port = v}))