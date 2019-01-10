{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.NetworkInfo.IPAddress (IPAddress(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.NetworkInfo.Protocol as Protos.NetworkInfo (Protocol)

data IPAddress = IPAddress{protocol :: !(P'.Maybe Protos.NetworkInfo.Protocol), ip_address :: !(P'.Maybe P'.Utf8)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON IPAddress where
  toJSON msg
   = P'.objectNoEmpty
      ([("protocol", P'.toJSON (Prelude'.fmap P'.toJSON (protocol msg))),
        ("ip_address", P'.toJSON (Prelude'.fmap P'.toJSON (ip_address msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON IPAddress where
  parseJSON
   = P'.withObject "IPAddress"
      (\ o ->
        do
          protocol <- do
                        tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "protocol"
                        Prelude'.return (Prelude'.maybe (Prelude'.Just ((Prelude'.read "IPv4"))) Prelude'.Just tmp)
          ip_address <- P'.explicitParseFieldMaybe P'.parseJSON o "ip_address"
          Prelude'.return P'.defaultValue{protocol = protocol, ip_address = ip_address})

instance P'.Mergeable IPAddress where
  mergeAppend (IPAddress x'1 x'2) (IPAddress y'1 y'2) = IPAddress (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default IPAddress where
  defaultValue = IPAddress (Prelude'.Just (Prelude'.read "IPv4")) P'.defaultValue

instance P'.Wire IPAddress where
  wireSize ft' self'@(IPAddress x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePutWithSize ft' self'@(IPAddress x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 9 x'2]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{protocol = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{ip_address = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> IPAddress) IPAddress where
  getVal m' f' = f' m'

instance P'.GPB IPAddress

instance P'.ReflectDescriptor IPAddress where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo.IPAddress\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"NetworkInfo\"], baseName = MName \"IPAddress\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"NetworkInfo\",\"IPAddress.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.IPAddress.protocol\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\",MName \"IPAddress\"], baseName' = FName \"protocol\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.NetworkInfo.Protocol\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"NetworkInfo\"], baseName = MName \"Protocol\"}), hsRawDefault = Just \"IPv4\", hsDefault = Just (HsDef'Enum \"IPv4\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.NetworkInfo.IPAddress.ip_address\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"NetworkInfo\",MName \"IPAddress\"], baseName' = FName \"ip_address\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType IPAddress where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg IPAddress where
  textPut msg
   = do
       P'.tellT "protocol" (protocol msg)
       P'.tellT "ip_address" (ip_address msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'protocol, parse'ip_address]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'protocol
         = P'.try
            (do
               v <- P'.getT "protocol"
               Prelude'.return (\ o -> o{protocol = v}))
        parse'ip_address
         = P'.try
            (do
               v <- P'.getT "ip_address"
               Prelude'.return (\ o -> o{ip_address = v}))