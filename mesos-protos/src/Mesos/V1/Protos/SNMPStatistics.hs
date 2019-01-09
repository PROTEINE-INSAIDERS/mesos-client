{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.SNMPStatistics (SNMPStatistics(..), ip_stats, icmp_stats, tcp_stats, udp_stats) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.IcmpStatistics as Protos (IcmpStatistics)
import qualified Mesos.V1.Protos.IpStatistics as Protos (IpStatistics)
import qualified Mesos.V1.Protos.TcpStatistics as Protos (TcpStatistics)
import qualified Mesos.V1.Protos.UdpStatistics as Protos (UdpStatistics)

data SNMPStatistics = SNMPStatistics{_ip_stats :: !(P'.Maybe Protos.IpStatistics), _icmp_stats :: !(P'.Maybe Protos.IcmpStatistics),
                                     _tcp_stats :: !(P'.Maybe Protos.TcpStatistics), _udp_stats :: !(P'.Maybe Protos.UdpStatistics)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''SNMPStatistics

instance P'.ToJSON SNMPStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("ip_stats", P'.toJSON (Prelude'.fmap P'.toJSON (ip_stats msg))),
        ("icmp_stats", P'.toJSON (Prelude'.fmap P'.toJSON (icmp_stats msg))),
        ("tcp_stats", P'.toJSON (Prelude'.fmap P'.toJSON (tcp_stats msg))),
        ("udp_stats", P'.toJSON (Prelude'.fmap P'.toJSON (udp_stats msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON SNMPStatistics where
  parseJSON
   = P'.withObject "SNMPStatistics"
      (\ o ->
        do
          ip_stats <- P'.explicitParseFieldMaybe P'.parseJSON o "ip_stats"
          icmp_stats <- P'.explicitParseFieldMaybe P'.parseJSON o "icmp_stats"
          tcp_stats <- P'.explicitParseFieldMaybe P'.parseJSON o "tcp_stats"
          udp_stats <- P'.explicitParseFieldMaybe P'.parseJSON o "udp_stats"
          Prelude'.return
           P'.defaultValue{_ip_stats = ip_stats, _icmp_stats = icmp_stats, _tcp_stats = tcp_stats, _udp_stats = udp_stats})

instance P'.Mergeable SNMPStatistics where
  mergeAppend (SNMPStatistics x'1 x'2 x'3 x'4) (SNMPStatistics y'1 y'2 y'3 y'4)
   = SNMPStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default SNMPStatistics where
  defaultValue = SNMPStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire SNMPStatistics where
  wireSize ft' self'@(SNMPStatistics x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(SNMPStatistics x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 34 11 x'4]
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
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_ip_stats = P'.mergeAppend (_ip_stats old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_icmp_stats = P'.mergeAppend (_icmp_stats old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_tcp_stats = P'.mergeAppend (_tcp_stats old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_udp_stats = P'.mergeAppend (_udp_stats old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SNMPStatistics) SNMPStatistics where
  getVal m' f' = f' m'

instance P'.GPB SNMPStatistics

instance P'.ReflectDescriptor SNMPStatistics where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.SNMPStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"SNMPStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"SNMPStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.SNMPStatistics.ip_stats\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"SNMPStatistics\"], baseName' = FName \"ip_stats\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.IpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"IpStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.SNMPStatistics.icmp_stats\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"SNMPStatistics\"], baseName' = FName \"icmp_stats\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.IcmpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"IcmpStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.SNMPStatistics.tcp_stats\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"SNMPStatistics\"], baseName' = FName \"tcp_stats\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TcpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TcpStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.SNMPStatistics.udp_stats\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"SNMPStatistics\"], baseName' = FName \"udp_stats\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.UdpStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"UdpStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType SNMPStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SNMPStatistics where
  textPut msg
   = do
       P'.tellT "ip_stats" (_ip_stats msg)
       P'.tellT "icmp_stats" (_icmp_stats msg)
       P'.tellT "tcp_stats" (_tcp_stats msg)
       P'.tellT "udp_stats" (_udp_stats msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_ip_stats, parse'_icmp_stats, parse'_tcp_stats, parse'_udp_stats]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_ip_stats
         = P'.try
            (do
               v <- P'.getT "ip_stats"
               Prelude'.return (\ o -> o{_ip_stats = v}))
        parse'_icmp_stats
         = P'.try
            (do
               v <- P'.getT "icmp_stats"
               Prelude'.return (\ o -> o{_icmp_stats = v}))
        parse'_tcp_stats
         = P'.try
            (do
               v <- P'.getT "tcp_stats"
               Prelude'.return (\ o -> o{_tcp_stats = v}))
        parse'_udp_stats
         = P'.try
            (do
               v <- P'.getT "udp_stats"
               Prelude'.return (\ o -> o{_udp_stats = v}))