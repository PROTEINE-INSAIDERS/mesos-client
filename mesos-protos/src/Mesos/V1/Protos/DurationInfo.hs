{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DurationInfo (DurationInfo(..), nanoseconds) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data DurationInfo = DurationInfo{_nanoseconds :: !(P'.Int64)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''DurationInfo

instance P'.ToJSON DurationInfo where
  toJSON msg = P'.objectNoEmpty ([("nanoseconds", P'.toJSONShowWithPayload (nanoseconds msg))] ++ Prelude'.concat [])

instance P'.FromJSON DurationInfo where
  parseJSON
   = P'.withObject "DurationInfo"
      (\ o ->
        do
          nanoseconds <- P'.explicitParseField (P'.parseJSONReadWithPayload "int64") o "nanoseconds"
          Prelude'.return P'.defaultValue{_nanoseconds = nanoseconds})

instance P'.Mergeable DurationInfo where
  mergeAppend (DurationInfo x'1) (DurationInfo y'1) = DurationInfo (P'.mergeAppend x'1 y'1)

instance P'.Default DurationInfo where
  defaultValue = DurationInfo P'.defaultValue

instance P'.Wire DurationInfo where
  wireSize ft' self'@(DurationInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 3 x'1)
  wirePutWithSize ft' self'@(DurationInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 3 x'1]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_nanoseconds = new'Field}) (P'.wireGet 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> DurationInfo) DurationInfo where
  getVal m' f' = f' m'

instance P'.GPB DurationInfo

instance P'.ReflectDescriptor DurationInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8]) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DurationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DurationInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DurationInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DurationInfo.nanoseconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DurationInfo\"], baseName' = FName \"nanoseconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType DurationInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg DurationInfo where
  textPut msg
   = do
       P'.tellT "nanoseconds" (_nanoseconds msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_nanoseconds]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_nanoseconds
         = P'.try
            (do
               v <- P'.getT "nanoseconds"
               Prelude'.return (\ o -> o{_nanoseconds = v}))