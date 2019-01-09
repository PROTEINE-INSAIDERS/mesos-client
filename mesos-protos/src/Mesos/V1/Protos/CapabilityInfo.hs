{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CapabilityInfo (CapabilityInfo(..), capabilities) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CapabilityInfo.Capability as Protos.CapabilityInfo (Capability)

data CapabilityInfo = CapabilityInfo{_capabilities :: !(P'.Seq Protos.CapabilityInfo.Capability)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''CapabilityInfo

instance P'.ToJSON CapabilityInfo where
  toJSON msg = P'.objectNoEmpty ([("capabilities", P'.toJSON (Prelude'.fmap P'.toJSON (capabilities msg)))] ++ Prelude'.concat [])

instance P'.FromJSON CapabilityInfo where
  parseJSON
   = P'.withObject "CapabilityInfo"
      (\ o ->
        do
          capabilities <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "capabilities")
          Prelude'.return P'.defaultValue{_capabilities = capabilities})

instance P'.Mergeable CapabilityInfo where
  mergeAppend (CapabilityInfo x'1) (CapabilityInfo y'1) = CapabilityInfo (P'.mergeAppend x'1 y'1)

instance P'.Default CapabilityInfo where
  defaultValue = CapabilityInfo P'.defaultValue

instance P'.Wire CapabilityInfo where
  wireSize ft' self'@(CapabilityInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 14 x'1)
  wirePutWithSize ft' self'@(CapabilityInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 8 14 x'1]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_capabilities = P'.append (_capabilities old'Self) new'Field})
                   (P'.wireGet 14)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_capabilities = P'.mergeAppend (_capabilities old'Self) new'Field})
                    (P'.wireGetPacked 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CapabilityInfo) CapabilityInfo where
  getVal m' f' = f' m'

instance P'.GPB CapabilityInfo

instance P'.ReflectDescriptor CapabilityInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CapabilityInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CapabilityInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CapabilityInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CapabilityInfo.capabilities\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CapabilityInfo\"], baseName' = FName \"capabilities\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Just (WireTag {getWireTag = 8},WireTag {getWireTag = 10}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CapabilityInfo.Capability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CapabilityInfo\"], baseName = MName \"Capability\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType CapabilityInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CapabilityInfo where
  textPut msg
   = do
       P'.tellT "capabilities" (_capabilities msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_capabilities]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_capabilities
         = P'.try
            (do
               v <- P'.getT "capabilities"
               Prelude'.return (\ o -> o{_capabilities = P'.append (_capabilities o) v}))