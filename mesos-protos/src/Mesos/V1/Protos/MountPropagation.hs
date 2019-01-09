{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.MountPropagation (MountPropagation(..), mode) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.MountPropagation.Mode as Protos.MountPropagation (Mode)

data MountPropagation = MountPropagation{_mode :: !(P'.Maybe Protos.MountPropagation.Mode)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''MountPropagation

instance P'.ToJSON MountPropagation where
  toJSON msg = P'.objectNoEmpty ([("mode", P'.toJSON (Prelude'.fmap P'.toJSON (mode msg)))] ++ Prelude'.concat [])

instance P'.FromJSON MountPropagation where
  parseJSON
   = P'.withObject "MountPropagation"
      (\ o ->
        do
          mode <- P'.explicitParseFieldMaybe P'.parseJSON o "mode"
          Prelude'.return P'.defaultValue{_mode = mode})

instance P'.Mergeable MountPropagation where
  mergeAppend (MountPropagation x'1) (MountPropagation y'1) = MountPropagation (P'.mergeAppend x'1 y'1)

instance P'.Default MountPropagation where
  defaultValue = MountPropagation P'.defaultValue

instance P'.Wire MountPropagation where
  wireSize ft' self'@(MountPropagation x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1)
  wirePutWithSize ft' self'@(MountPropagation x'1)
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_mode = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> MountPropagation) MountPropagation where
  getVal m' f' = f' m'

instance P'.GPB MountPropagation

instance P'.ReflectDescriptor MountPropagation where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.MountPropagation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"MountPropagation\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"MountPropagation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.MountPropagation.mode\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"MountPropagation\"], baseName' = FName \"mode\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.MountPropagation.Mode\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"MountPropagation\"], baseName = MName \"Mode\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType MountPropagation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg MountPropagation where
  textPut msg
   = do
       P'.tellT "mode" (_mode msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_mode]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_mode
         = P'.try
            (do
               v <- P'.getT "mode"
               Prelude'.return (\ o -> o{_mode = v}))