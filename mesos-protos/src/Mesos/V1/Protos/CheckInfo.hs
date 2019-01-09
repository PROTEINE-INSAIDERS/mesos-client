{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CheckInfo (CheckInfo(..), type', command, http, tcp, delay_seconds, interval_seconds, timeout_seconds) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CheckInfo.Command as Protos.CheckInfo (Command)
import qualified Mesos.V1.Protos.CheckInfo.Http as Protos.CheckInfo (Http)
import qualified Mesos.V1.Protos.CheckInfo.Tcp as Protos.CheckInfo (Tcp)
import qualified Mesos.V1.Protos.CheckInfo.Type as Protos.CheckInfo (Type)

data CheckInfo = CheckInfo{_type' :: !(P'.Maybe Protos.CheckInfo.Type), _command :: !(P'.Maybe Protos.CheckInfo.Command),
                           _http :: !(P'.Maybe Protos.CheckInfo.Http), _tcp :: !(P'.Maybe Protos.CheckInfo.Tcp),
                           _delay_seconds :: !(P'.Maybe P'.Double), _interval_seconds :: !(P'.Maybe P'.Double),
                           _timeout_seconds :: !(P'.Maybe P'.Double)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''CheckInfo

instance P'.ToJSON CheckInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))), ("command", P'.toJSON (Prelude'.fmap P'.toJSON (command msg))),
        ("http", P'.toJSON (Prelude'.fmap P'.toJSON (http msg))), ("tcp", P'.toJSON (Prelude'.fmap P'.toJSON (tcp msg))),
        ("delay_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (delay_seconds msg))),
        ("interval_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (interval_seconds msg))),
        ("timeout_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (timeout_seconds msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON CheckInfo where
  parseJSON
   = P'.withObject "CheckInfo"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          command <- P'.explicitParseFieldMaybe P'.parseJSON o "command"
          http <- P'.explicitParseFieldMaybe P'.parseJSON o "http"
          tcp <- P'.explicitParseFieldMaybe P'.parseJSON o "tcp"
          delay_seconds <- do
                             tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "delay_seconds"
                             Prelude'.return (Prelude'.maybe (Prelude'.Just (15.0)) Prelude'.Just tmp)
          interval_seconds <- do
                                tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "interval_seconds"
                                Prelude'.return (Prelude'.maybe (Prelude'.Just (10.0)) Prelude'.Just tmp)
          timeout_seconds <- do
                               tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "timeout_seconds"
                               Prelude'.return (Prelude'.maybe (Prelude'.Just (20.0)) Prelude'.Just tmp)
          Prelude'.return
           P'.defaultValue{_type' = type', _command = command, _http = http, _tcp = tcp, _delay_seconds = delay_seconds,
                           _interval_seconds = interval_seconds, _timeout_seconds = timeout_seconds})

instance P'.Mergeable CheckInfo where
  mergeAppend (CheckInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7) (CheckInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = CheckInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default CheckInfo where
  defaultValue
   = CheckInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue (Prelude'.Just 15.0) (Prelude'.Just 10.0)
      (Prelude'.Just 20.0)

instance P'.Wire CheckInfo where
  wireSize ft' self'@(CheckInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 1 x'5
             + P'.wireSizeOpt 1 1 x'6
             + P'.wireSizeOpt 1 1 x'7)
  wirePutWithSize ft' self'@(CheckInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3,
             P'.wirePutOptWithSize 33 1 x'5, P'.wirePutOptWithSize 41 1 x'6, P'.wirePutOptWithSize 49 1 x'7,
             P'.wirePutOptWithSize 58 11 x'4]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_command = P'.mergeAppend (_command old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_http = P'.mergeAppend (_http old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{_tcp = P'.mergeAppend (_tcp old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{_delay_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             41 -> Prelude'.fmap (\ !new'Field -> old'Self{_interval_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             49 -> Prelude'.fmap (\ !new'Field -> old'Self{_timeout_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CheckInfo) CheckInfo where
  getVal m' f' = f' m'

instance P'.GPB CheckInfo

instance P'.ReflectDescriptor CheckInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 33, 41, 49, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CheckInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CheckInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CheckInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CheckInfo.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CheckInfo\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.command\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"command\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CheckInfo.Command\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CheckInfo\"], baseName = MName \"Command\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.http\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"http\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CheckInfo.Http\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CheckInfo\"], baseName = MName \"Http\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.tcp\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"tcp\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CheckInfo.Tcp\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CheckInfo\"], baseName = MName \"Tcp\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.delay_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"delay_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"15.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (15 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.interval_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"interval_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 41}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"10.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (10 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckInfo.timeout_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckInfo\"], baseName' = FName \"timeout_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"20.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (20 % 1)))}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType CheckInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CheckInfo where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "command" (_command msg)
       P'.tellT "http" (_http msg)
       P'.tellT "tcp" (_tcp msg)
       P'.tellT "delay_seconds" (_delay_seconds msg)
       P'.tellT "interval_seconds" (_interval_seconds msg)
       P'.tellT "timeout_seconds" (_timeout_seconds msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_type', parse'_command, parse'_http, parse'_tcp, parse'_delay_seconds, parse'_interval_seconds,
                   parse'_timeout_seconds])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
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