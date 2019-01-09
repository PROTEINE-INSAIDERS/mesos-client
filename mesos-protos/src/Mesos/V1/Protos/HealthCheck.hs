{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.HealthCheck
       (HealthCheck(..), delay_seconds, interval_seconds, timeout_seconds, consecutive_failures, grace_period_seconds, type',
        command, http, tcp)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CommandInfo as Protos (CommandInfo)
import qualified Mesos.V1.Protos.HealthCheck.HTTPCheckInfo as Protos.HealthCheck (HTTPCheckInfo)
import qualified Mesos.V1.Protos.HealthCheck.TCPCheckInfo as Protos.HealthCheck (TCPCheckInfo)
import qualified Mesos.V1.Protos.HealthCheck.Type as Protos.HealthCheck (Type)

data HealthCheck = HealthCheck{_delay_seconds :: !(P'.Maybe P'.Double), _interval_seconds :: !(P'.Maybe P'.Double),
                               _timeout_seconds :: !(P'.Maybe P'.Double), _consecutive_failures :: !(P'.Maybe P'.Word32),
                               _grace_period_seconds :: !(P'.Maybe P'.Double), _type' :: !(P'.Maybe Protos.HealthCheck.Type),
                               _command :: !(P'.Maybe Protos.CommandInfo), _http :: !(P'.Maybe Protos.HealthCheck.HTTPCheckInfo),
                               _tcp :: !(P'.Maybe Protos.HealthCheck.TCPCheckInfo)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''HealthCheck

instance P'.ToJSON HealthCheck where
  toJSON msg
   = P'.objectNoEmpty
      ([("delay_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (delay_seconds msg))),
        ("interval_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (interval_seconds msg))),
        ("timeout_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (timeout_seconds msg))),
        ("consecutive_failures", P'.toJSON (Prelude'.fmap P'.toJSON (consecutive_failures msg))),
        ("grace_period_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (grace_period_seconds msg))),
        ("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))), ("command", P'.toJSON (Prelude'.fmap P'.toJSON (command msg))),
        ("http", P'.toJSON (Prelude'.fmap P'.toJSON (http msg))), ("tcp", P'.toJSON (Prelude'.fmap P'.toJSON (tcp msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON HealthCheck where
  parseJSON
   = P'.withObject "HealthCheck"
      (\ o ->
        do
          delay_seconds <- do
                             tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "delay_seconds"
                             Prelude'.return (Prelude'.maybe (Prelude'.Just (15.0)) Prelude'.Just tmp)
          interval_seconds <- do
                                tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "interval_seconds"
                                Prelude'.return (Prelude'.maybe (Prelude'.Just (10.0)) Prelude'.Just tmp)
          timeout_seconds <- do
                               tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "timeout_seconds"
                               Prelude'.return (Prelude'.maybe (Prelude'.Just (20.0)) Prelude'.Just tmp)
          consecutive_failures <- do
                                    tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "consecutive_failures"
                                    Prelude'.return (Prelude'.maybe (Prelude'.Just (3)) Prelude'.Just tmp)
          grace_period_seconds <- do
                                    tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "grace_period_seconds"
                                    Prelude'.return (Prelude'.maybe (Prelude'.Just (10.0)) Prelude'.Just tmp)
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          command <- P'.explicitParseFieldMaybe P'.parseJSON o "command"
          http <- P'.explicitParseFieldMaybe P'.parseJSON o "http"
          tcp <- P'.explicitParseFieldMaybe P'.parseJSON o "tcp"
          Prelude'.return
           P'.defaultValue{_delay_seconds = delay_seconds, _interval_seconds = interval_seconds, _timeout_seconds = timeout_seconds,
                           _consecutive_failures = consecutive_failures, _grace_period_seconds = grace_period_seconds,
                           _type' = type', _command = command, _http = http, _tcp = tcp})

instance P'.Mergeable HealthCheck where
  mergeAppend (HealthCheck x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (HealthCheck y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = HealthCheck (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)

instance P'.Default HealthCheck where
  defaultValue
   = HealthCheck (Prelude'.Just 15.0) (Prelude'.Just 10.0) (Prelude'.Just 20.0) (Prelude'.Just 3) (Prelude'.Just 10.0)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire HealthCheck where
  wireSize ft' self'@(HealthCheck x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 1 x'1 + P'.wireSizeOpt 1 1 x'2 + P'.wireSizeOpt 1 1 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 1 x'5
             + P'.wireSizeOpt 1 14 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9)
  wirePutWithSize ft' self'@(HealthCheck x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 10 11 x'8, P'.wirePutOptWithSize 17 1 x'1, P'.wirePutOptWithSize 25 1 x'2,
             P'.wirePutOptWithSize 33 1 x'3, P'.wirePutOptWithSize 40 13 x'4, P'.wirePutOptWithSize 49 1 x'5,
             P'.wirePutOptWithSize 58 11 x'7, P'.wirePutOptWithSize 64 14 x'6, P'.wirePutOptWithSize 74 11 x'9]
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
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{_delay_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             25 -> Prelude'.fmap (\ !new'Field -> old'Self{_interval_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{_timeout_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_consecutive_failures = Prelude'.Just new'Field}) (P'.wireGet 13)
             49 -> Prelude'.fmap (\ !new'Field -> old'Self{_grace_period_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_command = P'.mergeAppend (_command old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_http = P'.mergeAppend (_http old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{_tcp = P'.mergeAppend (_tcp old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> HealthCheck) HealthCheck where
  getVal m' f' = f' m'

instance P'.GPB HealthCheck

instance P'.ReflectDescriptor HealthCheck where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 17, 25, 33, 40, 49, 58, 64, 74])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.HealthCheck\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"HealthCheck\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"HealthCheck.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.delay_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"delay_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"15.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (15 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.interval_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"interval_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"10.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (10 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.timeout_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"timeout_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"20.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (20 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.consecutive_failures\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"consecutive_failures\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"3\", hsDefault = Just (HsDef'Integer 3)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.grace_period_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"grace_period_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"10.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (10 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.HealthCheck.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.command\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"command\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CommandInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CommandInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.http\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"http\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.HealthCheck.HTTPCheckInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"HTTPCheckInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.HealthCheck.tcp\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"HealthCheck\"], baseName' = FName \"tcp\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.HealthCheck.TCPCheckInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"HealthCheck\"], baseName = MName \"TCPCheckInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType HealthCheck where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg HealthCheck where
  textPut msg
   = do
       P'.tellT "delay_seconds" (_delay_seconds msg)
       P'.tellT "interval_seconds" (_interval_seconds msg)
       P'.tellT "timeout_seconds" (_timeout_seconds msg)
       P'.tellT "consecutive_failures" (_consecutive_failures msg)
       P'.tellT "grace_period_seconds" (_grace_period_seconds msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "command" (_command msg)
       P'.tellT "http" (_http msg)
       P'.tellT "tcp" (_tcp msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_delay_seconds, parse'_interval_seconds, parse'_timeout_seconds, parse'_consecutive_failures,
                   parse'_grace_period_seconds, parse'_type', parse'_command, parse'_http, parse'_tcp])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_delay_seconds
         = P'.try
            (do
               v <- P'.getT "delay_seconds"
               Prelude'.return (\ o -> o{_delay_seconds = v}))
        parse'_interval_seconds
         = P'.try
            (do
               v <- P'.getT "interval_seconds"
               Prelude'.return (\ o -> o{_interval_seconds = v}))
        parse'_timeout_seconds
         = P'.try
            (do
               v <- P'.getT "timeout_seconds"
               Prelude'.return (\ o -> o{_timeout_seconds = v}))
        parse'_consecutive_failures
         = P'.try
            (do
               v <- P'.getT "consecutive_failures"
               Prelude'.return (\ o -> o{_consecutive_failures = v}))
        parse'_grace_period_seconds
         = P'.try
            (do
               v <- P'.getT "grace_period_seconds"
               Prelude'.return (\ o -> o{_grace_period_seconds = v}))
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_command
         = P'.try
            (do
               v <- P'.getT "command"
               Prelude'.return (\ o -> o{_command = v}))
        parse'_http
         = P'.try
            (do
               v <- P'.getT "http"
               Prelude'.return (\ o -> o{_http = v}))
        parse'_tcp
         = P'.try
            (do
               v <- P'.getT "tcp"
               Prelude'.return (\ o -> o{_tcp = v}))