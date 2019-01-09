{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Offer.Operation.GrowVolume (GrowVolume(..), volume, addition) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data GrowVolume = GrowVolume{_volume :: !(Protos.Resource), _addition :: !(Protos.Resource)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''GrowVolume

instance P'.ToJSON GrowVolume where
  toJSON msg = P'.objectNoEmpty ([("volume", P'.toJSON (volume msg)), ("addition", P'.toJSON (addition msg))] ++ Prelude'.concat [])

instance P'.FromJSON GrowVolume where
  parseJSON
   = P'.withObject "GrowVolume"
      (\ o ->
        do
          volume <- P'.explicitParseField P'.parseJSON o "volume"
          addition <- P'.explicitParseField P'.parseJSON o "addition"
          Prelude'.return P'.defaultValue{_volume = volume, _addition = addition})

instance P'.Mergeable GrowVolume where
  mergeAppend (GrowVolume x'1 x'2) (GrowVolume y'1 y'2) = GrowVolume (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default GrowVolume where
  defaultValue = GrowVolume P'.defaultValue P'.defaultValue

instance P'.Wire GrowVolume where
  wireSize ft' self'@(GrowVolume x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(GrowVolume x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1, P'.wirePutReqWithSize 18 11 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_volume = P'.mergeAppend (_volume old'Self) (new'Field)}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_addition = P'.mergeAppend (_addition old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GrowVolume) GrowVolume where
  getVal m' f' = f' m'

instance P'.GPB GrowVolume

instance P'.ReflectDescriptor GrowVolume where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 18]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.GrowVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"GrowVolume\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Offer\",\"Operation\",\"GrowVolume.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.GrowVolume.volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"GrowVolume\"], baseName' = FName \"volume\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.GrowVolume.addition\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\",MName \"GrowVolume\"], baseName' = FName \"addition\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType GrowVolume where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GrowVolume where
  textPut msg
   = do
       P'.tellT "volume" (_volume msg)
       P'.tellT "addition" (_addition msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_volume, parse'_addition]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_volume
         = P'.try
            (do
               v <- P'.getT "volume"
               Prelude'.return (\ o -> o{_volume = v}))
        parse'_addition
         = P'.try
            (do
               v <- P'.getT "addition"
               Prelude'.return (\ o -> o{_addition = v}))