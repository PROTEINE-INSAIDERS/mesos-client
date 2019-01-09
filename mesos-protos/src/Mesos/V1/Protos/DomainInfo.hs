{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DomainInfo (DomainInfo(..), fault_domain) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.DomainInfo.FaultDomain as Protos.DomainInfo (FaultDomain)

data DomainInfo = DomainInfo{_fault_domain :: !(P'.Maybe Protos.DomainInfo.FaultDomain)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''DomainInfo

instance P'.ToJSON DomainInfo where
  toJSON msg = P'.objectNoEmpty ([("fault_domain", P'.toJSON (Prelude'.fmap P'.toJSON (fault_domain msg)))] ++ Prelude'.concat [])

instance P'.FromJSON DomainInfo where
  parseJSON
   = P'.withObject "DomainInfo"
      (\ o ->
        do
          fault_domain <- P'.explicitParseFieldMaybe P'.parseJSON o "fault_domain"
          Prelude'.return P'.defaultValue{_fault_domain = fault_domain})

instance P'.Mergeable DomainInfo where
  mergeAppend (DomainInfo x'1) (DomainInfo y'1) = DomainInfo (P'.mergeAppend x'1 y'1)

instance P'.Default DomainInfo where
  defaultValue = DomainInfo P'.defaultValue

instance P'.Wire DomainInfo where
  wireSize ft' self'@(DomainInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1)
  wirePutWithSize ft' self'@(DomainInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 11 x'1]
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
                    (\ !new'Field -> old'Self{_fault_domain = P'.mergeAppend (_fault_domain old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DomainInfo) DomainInfo where
  getVal m' f' = f' m'

instance P'.GPB DomainInfo

instance P'.ReflectDescriptor DomainInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DomainInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DomainInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DomainInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DomainInfo.fault_domain\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DomainInfo\"], baseName' = FName \"fault_domain\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DomainInfo.FaultDomain\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DomainInfo\"], baseName = MName \"FaultDomain\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType DomainInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DomainInfo where
  textPut msg
   = do
       P'.tellT "fault_domain" (_fault_domain msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_fault_domain]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_fault_domain
         = P'.try
            (do
               v <- P'.getT "fault_domain"
               Prelude'.return (\ o -> o{_fault_domain = v}))