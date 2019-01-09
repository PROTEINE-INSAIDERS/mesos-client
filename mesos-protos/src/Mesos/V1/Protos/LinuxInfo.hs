{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.LinuxInfo
       (LinuxInfo(..), capability_info, bounding_capabilities, effective_capabilities, share_pid_namespace) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CapabilityInfo as Protos (CapabilityInfo)

data LinuxInfo = LinuxInfo{_capability_info :: !(P'.Maybe Protos.CapabilityInfo),
                           _bounding_capabilities :: !(P'.Maybe Protos.CapabilityInfo),
                           _effective_capabilities :: !(P'.Maybe Protos.CapabilityInfo),
                           _share_pid_namespace :: !(P'.Maybe P'.Bool)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''LinuxInfo

instance P'.ToJSON LinuxInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("capability_info", P'.toJSON (Prelude'.fmap P'.toJSON (capability_info msg))),
        ("bounding_capabilities", P'.toJSON (Prelude'.fmap P'.toJSON (bounding_capabilities msg))),
        ("effective_capabilities", P'.toJSON (Prelude'.fmap P'.toJSON (effective_capabilities msg))),
        ("share_pid_namespace", P'.toJSON (Prelude'.fmap P'.toJSON (share_pid_namespace msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON LinuxInfo where
  parseJSON
   = P'.withObject "LinuxInfo"
      (\ o ->
        do
          capability_info <- P'.explicitParseFieldMaybe P'.parseJSON o "capability_info"
          bounding_capabilities <- P'.explicitParseFieldMaybe P'.parseJSON o "bounding_capabilities"
          effective_capabilities <- P'.explicitParseFieldMaybe P'.parseJSON o "effective_capabilities"
          share_pid_namespace <- P'.explicitParseFieldMaybe P'.parseJSONBool o "share_pid_namespace"
          Prelude'.return
           P'.defaultValue{_capability_info = capability_info, _bounding_capabilities = bounding_capabilities,
                           _effective_capabilities = effective_capabilities, _share_pid_namespace = share_pid_namespace})

instance P'.Mergeable LinuxInfo where
  mergeAppend (LinuxInfo x'1 x'2 x'3 x'4) (LinuxInfo y'1 y'2 y'3 y'4)
   = LinuxInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default LinuxInfo where
  defaultValue = LinuxInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire LinuxInfo where
  wireSize ft' self'@(LinuxInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 8 x'4)
  wirePutWithSize ft' self'@(LinuxInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 32 8 x'4]
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
                    (\ !new'Field ->
                      old'Self{_capability_info = P'.mergeAppend (_capability_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_bounding_capabilities = P'.mergeAppend (_bounding_capabilities old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{_effective_capabilities =
                                P'.mergeAppend (_effective_capabilities old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_share_pid_namespace = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> LinuxInfo) LinuxInfo where
  getVal m' f' = f' m'

instance P'.GPB LinuxInfo

instance P'.ReflectDescriptor LinuxInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.LinuxInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"LinuxInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"LinuxInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.LinuxInfo.capability_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"LinuxInfo\"], baseName' = FName \"capability_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CapabilityInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CapabilityInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.LinuxInfo.bounding_capabilities\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"LinuxInfo\"], baseName' = FName \"bounding_capabilities\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CapabilityInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CapabilityInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.LinuxInfo.effective_capabilities\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"LinuxInfo\"], baseName' = FName \"effective_capabilities\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CapabilityInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CapabilityInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.LinuxInfo.share_pid_namespace\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"LinuxInfo\"], baseName' = FName \"share_pid_namespace\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType LinuxInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg LinuxInfo where
  textPut msg
   = do
       P'.tellT "capability_info" (_capability_info msg)
       P'.tellT "bounding_capabilities" (_bounding_capabilities msg)
       P'.tellT "effective_capabilities" (_effective_capabilities msg)
       P'.tellT "share_pid_namespace" (_share_pid_namespace msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_capability_info, parse'_bounding_capabilities, parse'_effective_capabilities, parse'_share_pid_namespace])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_capability_info
         = P'.try
            (do
               v <- P'.getT "capability_info"
               Prelude'.return (\ o -> o{_capability_info = v}))
        parse'_bounding_capabilities
         = P'.try
            (do
               v <- P'.getT "bounding_capabilities"
               Prelude'.return (\ o -> o{_bounding_capabilities = v}))
        parse'_effective_capabilities
         = P'.try
            (do
               v <- P'.getT "effective_capabilities"
               Prelude'.return (\ o -> o{_effective_capabilities = v}))
        parse'_share_pid_namespace
         = P'.try
            (do
               v <- P'.getT "share_pid_namespace"
               Prelude'.return (\ o -> o{_share_pid_namespace = v}))