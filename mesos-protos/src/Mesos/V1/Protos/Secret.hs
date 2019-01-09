{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Secret (Secret(..), type', reference, value) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Secret.Reference as Protos.Secret (Reference)
import qualified Mesos.V1.Protos.Secret.Type as Protos.Secret (Type)
import qualified Mesos.V1.Protos.Secret.Value as Protos.Secret (Value)

data Secret = Secret{_type' :: !(P'.Maybe Protos.Secret.Type), _reference :: !(P'.Maybe Protos.Secret.Reference),
                     _value :: !(P'.Maybe Protos.Secret.Value)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Secret

instance P'.ToJSON Secret where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))),
        ("reference", P'.toJSON (Prelude'.fmap P'.toJSON (reference msg))),
        ("value", P'.toJSON (Prelude'.fmap P'.toJSON (value msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Secret where
  parseJSON
   = P'.withObject "Secret"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          reference <- P'.explicitParseFieldMaybe P'.parseJSON o "reference"
          value <- P'.explicitParseFieldMaybe P'.parseJSON o "value"
          Prelude'.return P'.defaultValue{_type' = type', _reference = reference, _value = value})

instance P'.Mergeable Secret where
  mergeAppend (Secret x'1 x'2 x'3) (Secret y'1 y'2 y'3)
   = Secret (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Secret where
  defaultValue = Secret P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Secret where
  wireSize ft' self'@(Secret x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3)
  wirePutWithSize ft' self'@(Secret x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'2, P'.wirePutOptWithSize 26 11 x'3]
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
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_reference = P'.mergeAppend (_reference old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_value = P'.mergeAppend (_value old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Secret) Secret where
  getVal m' f' = f' m'

instance P'.GPB Secret

instance P'.ReflectDescriptor Secret where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Secret\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Secret\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Secret.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Secret.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Secret\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Secret.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Secret\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Secret.reference\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Secret\"], baseName' = FName \"reference\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Secret.Reference\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Secret\"], baseName = MName \"Reference\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Secret.value\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Secret\"], baseName' = FName \"value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Secret.Value\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Secret\"], baseName = MName \"Value\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Secret where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Secret where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
       P'.tellT "reference" (_reference msg)
       P'.tellT "value" (_value msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_type', parse'_reference, parse'_value]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))
        parse'_reference
         = P'.try
            (do
               v <- P'.getT "reference"
               Prelude'.return (\ o -> o{_reference = v}))
        parse'_value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{_value = v}))