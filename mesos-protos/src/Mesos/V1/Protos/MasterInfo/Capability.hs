{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.MasterInfo.Capability (Capability(..), type') where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.MasterInfo.Capability.Type as Protos.MasterInfo.Capability (Type)

data Capability = Capability{_type' :: !(P'.Maybe Protos.MasterInfo.Capability.Type)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Capability

instance P'.ToJSON Capability where
  toJSON msg = P'.objectNoEmpty ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Capability where
  parseJSON
   = P'.withObject "Capability"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          Prelude'.return P'.defaultValue{_type' = type'})

instance P'.Mergeable Capability where
  mergeAppend (Capability x'1) (Capability y'1) = Capability (P'.mergeAppend x'1 y'1)

instance P'.Default Capability where
  defaultValue = Capability P'.defaultValue

instance P'.Wire Capability where
  wireSize ft' self'@(Capability x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1)
  wirePutWithSize ft' self'@(Capability x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 14 x'1]
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
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Capability) Capability where
  getVal m' f' = f' m'

instance P'.GPB Capability

instance P'.ReflectDescriptor Capability where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.MasterInfo.Capability\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"MasterInfo\"], baseName = MName \"Capability\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"MasterInfo\",\"Capability.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.MasterInfo.Capability.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"MasterInfo\",MName \"Capability\"], baseName' = FName \"type'\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MasterInfo.Capability.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"MasterInfo\",MName \"Capability\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Capability where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Capability where
  textPut msg
   = do
       P'.tellT "type" (_type' msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_type']) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{_type' = v}))