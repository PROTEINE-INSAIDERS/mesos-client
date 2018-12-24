{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DomainInfo.FaultDomain (FaultDomain(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.DomainInfo.FaultDomain.RegionInfo as Protos.DomainInfo.FaultDomain (RegionInfo)
import qualified Mesos.V1.Protos.DomainInfo.FaultDomain.ZoneInfo as Protos.DomainInfo.FaultDomain (ZoneInfo)

data FaultDomain = FaultDomain{region :: !(Protos.DomainInfo.FaultDomain.RegionInfo),
                               zone :: !(Protos.DomainInfo.FaultDomain.ZoneInfo)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON FaultDomain where
  toJSON msg = P'.objectNoEmpty ([("region", P'.toJSON (region msg)), ("zone", P'.toJSON (zone msg))] ++ Prelude'.concat [])

instance P'.FromJSON FaultDomain where
  parseJSON
   = P'.withObject "FaultDomain"
      (\ o ->
        do
          region <- P'.explicitParseField P'.parseJSON o "region"
          zone <- P'.explicitParseField P'.parseJSON o "zone"
          Prelude'.return P'.defaultValue{region = region, zone = zone})

instance P'.Mergeable FaultDomain where
  mergeAppend (FaultDomain x'1 x'2) (FaultDomain y'1 y'2) = FaultDomain (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default FaultDomain where
  defaultValue = FaultDomain P'.defaultValue P'.defaultValue

instance P'.Wire FaultDomain where
  wireSize ft' self'@(FaultDomain x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(FaultDomain x'1 x'2)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{region = P'.mergeAppend (region old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{zone = P'.mergeAppend (zone old'Self) (new'Field)}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> FaultDomain) FaultDomain where
  getVal m' f' = f' m'

instance P'.GPB FaultDomain

instance P'.ReflectDescriptor FaultDomain where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DomainInfo.FaultDomain\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DomainInfo\"], baseName = MName \"FaultDomain\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DomainInfo\",\"FaultDomain.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DomainInfo.FaultDomain.region\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DomainInfo\",MName \"FaultDomain\"], baseName' = FName \"region\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DomainInfo.FaultDomain.RegionInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DomainInfo\",MName \"FaultDomain\"], baseName = MName \"RegionInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DomainInfo.FaultDomain.zone\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DomainInfo\",MName \"FaultDomain\"], baseName' = FName \"zone\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DomainInfo.FaultDomain.ZoneInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DomainInfo\",MName \"FaultDomain\"], baseName = MName \"ZoneInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType FaultDomain where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg FaultDomain where
  textPut msg
   = do
       P'.tellT "region" (region msg)
       P'.tellT "zone" (zone msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'region, parse'zone]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'region
         = P'.try
            (do
               v <- P'.getT "region"
               Prelude'.return (\ o -> o{region = v}))
        parse'zone
         = P'.try
            (do
               v <- P'.getT "zone"
               Prelude'.return (\ o -> o{zone = v}))