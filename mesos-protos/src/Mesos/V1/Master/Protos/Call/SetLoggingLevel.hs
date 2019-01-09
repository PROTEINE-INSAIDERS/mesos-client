{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Call.SetLoggingLevel (SetLoggingLevel(..), level, duration) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.DurationInfo as Protos (DurationInfo)

data SetLoggingLevel = SetLoggingLevel{_level :: !(P'.Word32), _duration :: !(Protos.DurationInfo)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''SetLoggingLevel

instance P'.ToJSON SetLoggingLevel where
  toJSON msg = P'.objectNoEmpty ([("level", P'.toJSON (level msg)), ("duration", P'.toJSON (duration msg))] ++ Prelude'.concat [])

instance P'.FromJSON SetLoggingLevel where
  parseJSON
   = P'.withObject "SetLoggingLevel"
      (\ o ->
        do
          level <- P'.explicitParseField P'.parseJSON o "level"
          duration <- P'.explicitParseField P'.parseJSON o "duration"
          Prelude'.return P'.defaultValue{_level = level, _duration = duration})

instance P'.Mergeable SetLoggingLevel where
  mergeAppend (SetLoggingLevel x'1 x'2) (SetLoggingLevel y'1 y'2)
   = SetLoggingLevel (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default SetLoggingLevel where
  defaultValue = SetLoggingLevel P'.defaultValue P'.defaultValue

instance P'.Wire SetLoggingLevel where
  wireSize ft' self'@(SetLoggingLevel x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 13 x'1 + P'.wireSizeReq 1 11 x'2)
  wirePutWithSize ft' self'@(SetLoggingLevel x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 13 x'1, P'.wirePutReqWithSize 18 11 x'2]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_level = new'Field}) (P'.wireGet 13)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_duration = P'.mergeAppend (_duration old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> SetLoggingLevel) SetLoggingLevel where
  getVal m' f' = f' m'

instance P'.GPB SetLoggingLevel

instance P'.ReflectDescriptor SetLoggingLevel where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 18]) (P'.fromDistinctAscList [8, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Call.SetLoggingLevel\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"SetLoggingLevel\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Call\",\"SetLoggingLevel.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.SetLoggingLevel.level\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"SetLoggingLevel\"], baseName' = FName \"level\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Call.SetLoggingLevel.duration\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"SetLoggingLevel\"], baseName' = FName \"duration\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DurationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DurationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType SetLoggingLevel where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg SetLoggingLevel where
  textPut msg
   = do
       P'.tellT "level" (_level msg)
       P'.tellT "duration" (_duration msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_level, parse'_duration]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_level
         = P'.try
            (do
               v <- P'.getT "level"
               Prelude'.return (\ o -> o{_level = v}))
        parse'_duration
         = P'.try
            (do
               v <- P'.getT "duration"
               Prelude'.return (\ o -> o{_duration = v}))