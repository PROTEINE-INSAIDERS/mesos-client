{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Value.Scalar (Scalar(..), value) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Scalar = Scalar{_value :: !(P'.Double)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Scalar

instance P'.ToJSON Scalar where
  toJSON msg = P'.objectNoEmpty ([("value", P'.toJSON (value msg))] ++ Prelude'.concat [])

instance P'.FromJSON Scalar where
  parseJSON
   = P'.withObject "Scalar"
      (\ o ->
        do
          value <- P'.explicitParseField P'.parseJSON o "value"
          Prelude'.return P'.defaultValue{_value = value})

instance P'.Mergeable Scalar where
  mergeAppend (Scalar x'1) (Scalar y'1) = Scalar (P'.mergeAppend x'1 y'1)

instance P'.Default Scalar where
  defaultValue = Scalar P'.defaultValue

instance P'.Wire Scalar where
  wireSize ft' self'@(Scalar x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 1 x'1)
  wirePutWithSize ft' self'@(Scalar x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 9 1 x'1]
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
             9 -> Prelude'.fmap (\ !new'Field -> old'Self{_value = new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Scalar) Scalar where
  getVal m' f' = f' m'

instance P'.GPB Scalar

instance P'.ReflectDescriptor Scalar where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [9]) (P'.fromDistinctAscList [9])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Value.Scalar\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Scalar\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Value\",\"Scalar.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Value.Scalar.value\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Value\",MName \"Scalar\"], baseName' = FName \"value\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Scalar where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Scalar where
  textPut msg
   = do
       P'.tellT "value" (_value msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_value]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_value
         = P'.try
            (do
               v <- P'.getT "value"
               Prelude'.return (\ o -> o{_value = v}))