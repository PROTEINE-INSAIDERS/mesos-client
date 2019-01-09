{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.FrameworkInfo
       (FrameworkInfo(..), user, name, id, failover_timeout, checkpoint, role, roles, hostname, principal, webui_url, capabilities,
        labels)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.FrameworkInfo.Capability as Protos.FrameworkInfo (Capability)
import qualified Mesos.V1.Protos.Labels as Protos (Labels)

data FrameworkInfo = FrameworkInfo{_user :: !(P'.Utf8), _name :: !(P'.Utf8), _id :: !(P'.Maybe Protos.FrameworkID),
                                   _failover_timeout :: !(P'.Maybe P'.Double), _checkpoint :: !(P'.Maybe P'.Bool),
                                   _role :: !(P'.Maybe P'.Utf8), _roles :: !(P'.Seq P'.Utf8), _hostname :: !(P'.Maybe P'.Utf8),
                                   _principal :: !(P'.Maybe P'.Utf8), _webui_url :: !(P'.Maybe P'.Utf8),
                                   _capabilities :: !(P'.Seq Protos.FrameworkInfo.Capability), _labels :: !(P'.Maybe Protos.Labels)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''FrameworkInfo

instance P'.ToJSON FrameworkInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("user", P'.toJSON (user msg)), ("name", P'.toJSON (name msg)), ("id", P'.toJSON (Prelude'.fmap P'.toJSON (id msg))),
        ("failover_timeout", P'.toJSON (Prelude'.fmap P'.toJSON (failover_timeout msg))),
        ("checkpoint", P'.toJSON (Prelude'.fmap P'.toJSON (checkpoint msg))),
        ("role", P'.toJSON (Prelude'.fmap P'.toJSON (role msg))), ("roles", P'.toJSON (Prelude'.fmap P'.toJSON (roles msg))),
        ("hostname", P'.toJSON (Prelude'.fmap P'.toJSON (hostname msg))),
        ("principal", P'.toJSON (Prelude'.fmap P'.toJSON (principal msg))),
        ("webui_url", P'.toJSON (Prelude'.fmap P'.toJSON (webui_url msg))),
        ("capabilities", P'.toJSON (Prelude'.fmap P'.toJSON (capabilities msg))),
        ("labels", P'.toJSON (Prelude'.fmap P'.toJSON (labels msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON FrameworkInfo where
  parseJSON
   = P'.withObject "FrameworkInfo"
      (\ o ->
        do
          user <- P'.explicitParseField P'.parseJSON o "user"
          name <- P'.explicitParseField P'.parseJSON o "name"
          id <- P'.explicitParseFieldMaybe P'.parseJSON o "id"
          failover_timeout <- do
                                tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "failover_timeout"
                                Prelude'.return (Prelude'.maybe (Prelude'.Just (0.0)) Prelude'.Just tmp)
          checkpoint <- do
                          tmp <- P'.explicitParseFieldMaybe P'.parseJSONBool o "checkpoint"
                          Prelude'.return (Prelude'.maybe (Prelude'.Just (Prelude'.False)) Prelude'.Just tmp)
          role <- do
                    tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "role"
                    Prelude'.return (Prelude'.maybe (Prelude'.Just ((P'.Utf8 (P'.pack "*")))) Prelude'.Just tmp)
          roles <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "roles")
          hostname <- P'.explicitParseFieldMaybe P'.parseJSON o "hostname"
          principal <- P'.explicitParseFieldMaybe P'.parseJSON o "principal"
          webui_url <- P'.explicitParseFieldMaybe P'.parseJSON o "webui_url"
          capabilities <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "capabilities")
          labels <- P'.explicitParseFieldMaybe P'.parseJSON o "labels"
          Prelude'.return
           P'.defaultValue{_user = user, _name = name, _id = id, _failover_timeout = failover_timeout, _checkpoint = checkpoint,
                           _role = role, _roles = roles, _hostname = hostname, _principal = principal, _webui_url = webui_url,
                           _capabilities = capabilities, _labels = labels})

instance P'.Mergeable FrameworkInfo where
  mergeAppend (FrameworkInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   (FrameworkInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12)
   = FrameworkInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)

instance P'.Default FrameworkInfo where
  defaultValue
   = FrameworkInfo P'.defaultValue P'.defaultValue P'.defaultValue (Prelude'.Just 0.0) (Prelude'.Just Prelude'.False)
      (Prelude'.Just (P'.Utf8 (P'.pack "*")))
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire FrameworkInfo where
  wireSize ft' self'@(FrameworkInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 1 x'4 +
             P'.wireSizeOpt 1 8 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeRep 1 9 x'7
             + P'.wireSizeOpt 1 9 x'8
             + P'.wireSizeOpt 1 9 x'9
             + P'.wireSizeOpt 1 9 x'10
             + P'.wireSizeRep 1 11 x'11
             + P'.wireSizeOpt 1 11 x'12)
  wirePutWithSize ft' self'@(FrameworkInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 18 9 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 33 1 x'4, P'.wirePutOptWithSize 40 8 x'5, P'.wirePutOptWithSize 50 9 x'6,
             P'.wirePutOptWithSize 58 9 x'8, P'.wirePutOptWithSize 66 9 x'9, P'.wirePutOptWithSize 74 9 x'10,
             P'.wirePutRepWithSize 82 11 x'11, P'.wirePutOptWithSize 90 11 x'12, P'.wirePutRepWithSize 98 9 x'7]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_user = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = P'.mergeAppend (_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{_failover_timeout = Prelude'.Just new'Field}) (P'.wireGet 1)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_checkpoint = Prelude'.Just new'Field}) (P'.wireGet 8)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{_role = Prelude'.Just new'Field}) (P'.wireGet 9)
             98 -> Prelude'.fmap (\ !new'Field -> old'Self{_roles = P'.append (_roles old'Self) new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_hostname = Prelude'.Just new'Field}) (P'.wireGet 9)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{_principal = Prelude'.Just new'Field}) (P'.wireGet 9)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_webui_url = Prelude'.Just new'Field}) (P'.wireGet 9)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{_capabilities = P'.append (_capabilities old'Self) new'Field})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{_labels = P'.mergeAppend (_labels old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> FrameworkInfo) FrameworkInfo where
  getVal m' f' = f' m'

instance P'.GPB FrameworkInfo

instance P'.ReflectDescriptor FrameworkInfo where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18, 26, 33, 40, 50, 58, 66, 74, 82, 90, 98])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"FrameworkInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.user\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"user\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.failover_timeout\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"failover_timeout\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"0.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (0 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.checkpoint\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"checkpoint\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.role\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"role\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"*\", hsDefault = Just (HsDef'ByteString \"*\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.roles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"roles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.hostname\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"hostname\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.principal\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"principal\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.webui_url\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"webui_url\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.capabilities\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"capabilities\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo.Capability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"FrameworkInfo\"], baseName = MName \"Capability\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.FrameworkInfo.labels\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"FrameworkInfo\"], baseName' = FName \"labels\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Labels\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Labels\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType FrameworkInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg FrameworkInfo where
  textPut msg
   = do
       P'.tellT "user" (_user msg)
       P'.tellT "name" (_name msg)
       P'.tellT "id" (_id msg)
       P'.tellT "failover_timeout" (_failover_timeout msg)
       P'.tellT "checkpoint" (_checkpoint msg)
       P'.tellT "role" (_role msg)
       P'.tellT "roles" (_roles msg)
       P'.tellT "hostname" (_hostname msg)
       P'.tellT "principal" (_principal msg)
       P'.tellT "webui_url" (_webui_url msg)
       P'.tellT "capabilities" (_capabilities msg)
       P'.tellT "labels" (_labels msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_user, parse'_name, parse'_id, parse'_failover_timeout, parse'_checkpoint, parse'_role, parse'_roles,
                   parse'_hostname, parse'_principal, parse'_webui_url, parse'_capabilities, parse'_labels])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_user
         = P'.try
            (do
               v <- P'.getT "user"
               Prelude'.return (\ o -> o{_user = v}))
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_failover_timeout
         = P'.try
            (do
               v <- P'.getT "failover_timeout"
               Prelude'.return (\ o -> o{_failover_timeout = v}))
        parse'_checkpoint
         = P'.try
            (do
               v <- P'.getT "checkpoint"
               Prelude'.return (\ o -> o{_checkpoint = v}))
        parse'_role
         = P'.try
            (do
               v <- P'.getT "role"
               Prelude'.return (\ o -> o{_role = v}))
        parse'_roles
         = P'.try
            (do
               v <- P'.getT "roles"
               Prelude'.return (\ o -> o{_roles = P'.append (_roles o) v}))
        parse'_hostname
         = P'.try
            (do
               v <- P'.getT "hostname"
               Prelude'.return (\ o -> o{_hostname = v}))
        parse'_principal
         = P'.try
            (do
               v <- P'.getT "principal"
               Prelude'.return (\ o -> o{_principal = v}))
        parse'_webui_url
         = P'.try
            (do
               v <- P'.getT "webui_url"
               Prelude'.return (\ o -> o{_webui_url = v}))
        parse'_capabilities
         = P'.try
            (do
               v <- P'.getT "capabilities"
               Prelude'.return (\ o -> o{_capabilities = P'.append (_capabilities o) v}))
        parse'_labels
         = P'.try
            (do
               v <- P'.getT "labels"
               Prelude'.return (\ o -> o{_labels = v}))