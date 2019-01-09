{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CSIPluginContainerInfo (CSIPluginContainerInfo(..), services, command, resources, container) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CSIPluginContainerInfo.Service as Protos.CSIPluginContainerInfo (Service)
import qualified Mesos.V1.Protos.CommandInfo as Protos (CommandInfo)
import qualified Mesos.V1.Protos.ContainerInfo as Protos (ContainerInfo)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data CSIPluginContainerInfo = CSIPluginContainerInfo{_services :: !(P'.Seq Protos.CSIPluginContainerInfo.Service),
                                                     _command :: !(P'.Maybe Protos.CommandInfo),
                                                     _resources :: !(P'.Seq Protos.Resource),
                                                     _container :: !(P'.Maybe Protos.ContainerInfo)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                        Prelude'.Generic)

Control.Lens.TH.makeLenses ''CSIPluginContainerInfo

instance P'.ToJSON CSIPluginContainerInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("services", P'.toJSON (Prelude'.fmap P'.toJSON (services msg))),
        ("command", P'.toJSON (Prelude'.fmap P'.toJSON (command msg))),
        ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg))),
        ("container", P'.toJSON (Prelude'.fmap P'.toJSON (container msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON CSIPluginContainerInfo where
  parseJSON
   = P'.withObject "CSIPluginContainerInfo"
      (\ o ->
        do
          services <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                       (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "services")
          command <- P'.explicitParseFieldMaybe P'.parseJSON o "command"
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          container <- P'.explicitParseFieldMaybe P'.parseJSON o "container"
          Prelude'.return P'.defaultValue{_services = services, _command = command, _resources = resources, _container = container})

instance P'.Mergeable CSIPluginContainerInfo where
  mergeAppend (CSIPluginContainerInfo x'1 x'2 x'3 x'4) (CSIPluginContainerInfo y'1 y'2 y'3 y'4)
   = CSIPluginContainerInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default CSIPluginContainerInfo where
  defaultValue = CSIPluginContainerInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire CSIPluginContainerInfo where
  wireSize ft' self'@(CSIPluginContainerInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(CSIPluginContainerInfo x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutRepWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutRepWithSize 26 11 x'3,
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_services = P'.append (_services old'Self) new'Field}) (P'.wireGet 14)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_services = P'.mergeAppend (_services old'Self) new'Field})
                    (P'.wireGetPacked 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_command = P'.mergeAppend (_command old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_container = P'.mergeAppend (_container old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CSIPluginContainerInfo) CSIPluginContainerInfo where
  getVal m' f' = f' m'

instance P'.GPB CSIPluginContainerInfo

instance P'.ReflectDescriptor CSIPluginContainerInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 10, 18, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CSIPluginContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CSIPluginContainerInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CSIPluginContainerInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginContainerInfo.services\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"services\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Just (WireTag {getWireTag = 8},WireTag {getWireTag = 10}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CSIPluginContainerInfo.Service\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName = MName \"Service\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginContainerInfo.command\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"command\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CommandInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CommandInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginContainerInfo.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CSIPluginContainerInfo.container\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CSIPluginContainerInfo\"], baseName' = FName \"container\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ContainerInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ContainerInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType CSIPluginContainerInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CSIPluginContainerInfo where
  textPut msg
   = do
       P'.tellT "services" (_services msg)
       P'.tellT "command" (_command msg)
       P'.tellT "resources" (_resources msg)
       P'.tellT "container" (_container msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_services, parse'_command, parse'_resources, parse'_container]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_services
         = P'.try
            (do
               v <- P'.getT "services"
               Prelude'.return (\ o -> o{_services = P'.append (_services o) v}))
        parse'_command
         = P'.try
            (do
               v <- P'.getT "command"
               Prelude'.return (\ o -> o{_command = v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))
        parse'_container
         = P'.try
            (do
               v <- P'.getT "container"
               Prelude'.return (\ o -> o{_container = v}))