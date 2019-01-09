{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Filters (Filters(..), refuse_seconds) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Filters = Filters{_refuse_seconds :: !(P'.Maybe P'.Double)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Filters

instance P'.ToJSON Filters where
  toJSON msg
   = P'.objectNoEmpty ([("refuse_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (refuse_seconds msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Filters where
  parseJSON
   = P'.withObject "Filters"
      (\ o ->
        do
          refuse_seconds <- do
                              tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "refuse_seconds"
                              Prelude'.return (Prelude'.maybe (Prelude'.Just (5.0)) Prelude'.Just tmp)
          Prelude'.return P'.defaultValue{_refuse_seconds = refuse_seconds})

instance P'.Mergeable Filters where
  mergeAppend (Filters x'1) (Filters y'1) = Filters (P'.mergeAppend x'1 y'1)

instance P'.Default Filters where
  defaultValue = Filters (Prelude'.Just 5.0)

instance P'.Wire Filters where
  wireSize ft' self'@(Filters x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 1 x'1)
  wirePutWithSize ft' self'@(Filters x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 9 1 x'1]
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
             9 -> Prelude'.fmap (\ !new'Field -> old'Self{_refuse_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Filters) Filters where
  getVal m' f' = f' m'

instance P'.GPB Filters

instance P'.ReflectDescriptor Filters where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [9])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Filters\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Filters\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Filters.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Filters.refuse_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Filters\"], baseName' = FName \"refuse_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Just \"5.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (5 % 1)))}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Filters where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Filters where
  textPut msg
   = do
       P'.tellT "refuse_seconds" (_refuse_seconds msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_refuse_seconds]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_refuse_seconds
         = P'.try
            (do
               v <- P'.getT "refuse_seconds"
               Prelude'.return (\ o -> o{_refuse_seconds = v}))