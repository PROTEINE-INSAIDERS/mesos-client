{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Environment.Variable (Variable(..), name, type', value, secret) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Environment.Variable.Type as Protos.Environment.Variable (Type)
import qualified Mesos.V1.Protos.Secret as Protos (Secret)

data Variable = Variable{_name :: !(P'.Utf8), _type' :: !(P'.Maybe Protos.Environment.Variable.Type), _value :: !(P'.Maybe P'.Utf8),
                         _secret :: !(P'.Maybe Protos.Secret)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Variable

instance P'.ToJSON Variable where
  toJSON msg
   = P'.objectNoEmpty
      ([("name", P'.toJSON (name msg)), ("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("value", P'.toJSON (Prelude'.fmap P'.toJSON (value msg))), ("secret", P'.toJSON (Prelude'.fmap P'.toJSON (secret msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Variable where
  parseJSON
   = P'.withObject "Variable"
      (\ o ->
        do
          name <- P'.explicitParseField P'.parseJSON o "name"
          type' <- do
                     tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
                     Prelude'.return (Prelude'.maybe (Prelude'.Just ((Prelude'.read "VALUE"))) Prelude'.Just tmp)
          value <- P'.explicitParseFieldMaybe P'.parseJSON o "value"
          secret <- P'.explicitParseFieldMaybe P'.parseJSON o "secret"
          Prelude'.return P'.defaultValue{_name = name, _type' = type', _value = value, _secret = secret})

instance P'.Mergeable Variable where
  mergeAppend (Variable x'1 x'2 x'3 x'4) (Variable y'1 y'2 y'3 y'4)
   = Variable (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default Variable where
  defaultValue = Variable P'.defaultValue (Prelude'.Just (Prelude'.read "VALUE")) P'.defaultValue P'.defaultValue

instance P'.Wire Variable where
  wireSize ft' self'@(Variable x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeOpt 1 11 x'4)
  wirePutWithSize ft' self'@(Variable x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 18 9 x'3, P'.wirePutOptWithSize 24 14 x'2,
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_value = Prelude'.Just new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_secret = P'.mergeAppend (_secret old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Variable) Variable where
  getVal m' f' = f' m'

instance P'.GPB Variable

instance P'.ReflectDescriptor Variable where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18, 24, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Environment.Variable\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Environment\"], baseName = MName \"Variable\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Environment\",\"Variable.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Environment.Variable.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Environment\",MName \"Variable\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Environment.Variable.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Environment\",MName \"Variable\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Environment.Variable.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Environment\",MName \"Variable\"], baseName = MName \"Type\"}), hsRawDefault = Just \"VALUE\", hsDefault = Just (HsDef'Enum \"VALUE\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Environment.Variable.value\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Environment\",MName \"Variable\"], baseName' = FName \"value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Environment.Variable.secret\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Environment\",MName \"Variable\"], baseName' = FName \"secret\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Secret\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Secret\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Variable where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Variable where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "type" (_type' msg)
       P'.tellT "value" (_value msg)
       P'.tellT "secret" (_secret msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_name, parse'_type', parse'_value, parse'_secret]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{_value = v}))
        parse'_secret
         = P'.try
            (do
               v <- P'.getT "secret"
               Prelude'.return (\ o -> o{_secret = v}))