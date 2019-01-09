{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Call.Subscribe (Subscribe(..), framework_info, suppressed_roles) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.FrameworkInfo as Protos (FrameworkInfo)

data Subscribe = Subscribe{_framework_info :: !(Protos.FrameworkInfo), _suppressed_roles :: !(P'.Seq P'.Utf8)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Subscribe

instance P'.ToJSON Subscribe where
  toJSON msg
   = P'.objectNoEmpty
      ([("framework_info", P'.toJSON (framework_info msg)),
        ("suppressed_roles", P'.toJSON (Prelude'.fmap P'.toJSON (suppressed_roles msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Subscribe where
  parseJSON
   = P'.withObject "Subscribe"
      (\ o ->
        do
          framework_info <- P'.explicitParseField P'.parseJSON o "framework_info"
          suppressed_roles <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                               (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "suppressed_roles")
          Prelude'.return P'.defaultValue{_framework_info = framework_info, _suppressed_roles = suppressed_roles})

instance P'.Mergeable Subscribe where
  mergeAppend (Subscribe x'1 x'2) (Subscribe y'1 y'2) = Subscribe (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Subscribe where
  defaultValue = Subscribe P'.defaultValue P'.defaultValue

instance P'.Wire Subscribe where
  wireSize ft' self'@(Subscribe x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeRep 1 9 x'2)
  wirePutWithSize ft' self'@(Subscribe x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutRepWithSize 18 9 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_framework_info = P'.mergeAppend (_framework_info old'Self) (new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_suppressed_roles = P'.append (_suppressed_roles old'Self) new'Field})
                    (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Subscribe) Subscribe where
  getVal m' f' = f' m'

instance P'.GPB Subscribe

instance P'.ReflectDescriptor Subscribe where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Subscribe\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Subscribe\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Call\",\"Subscribe.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.Subscribe.framework_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"framework_info\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.Subscribe.suppressed_roles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Subscribe\"], baseName' = FName \"suppressed_roles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Subscribe where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Subscribe where
  textPut msg
   = do
       P'.tellT "framework_info" (_framework_info msg)
       P'.tellT "suppressed_roles" (_suppressed_roles msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_framework_info, parse'_suppressed_roles]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_framework_info
         = P'.try
            (do
               v <- P'.getT "framework_info"
               Prelude'.return (\ o -> o{_framework_info = v}))
        parse'_suppressed_roles
         = P'.try
            (do
               v <- P'.getT "suppressed_roles"
               Prelude'.return (\ o -> o{_suppressed_roles = P'.append (_suppressed_roles o) v}))