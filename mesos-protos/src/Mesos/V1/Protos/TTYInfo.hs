{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TTYInfo (TTYInfo(..), window_size) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.TTYInfo.WindowSize as Protos.TTYInfo (WindowSize)

data TTYInfo = TTYInfo{_window_size :: !(P'.Maybe Protos.TTYInfo.WindowSize)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''TTYInfo

instance P'.ToJSON TTYInfo where
  toJSON msg = P'.objectNoEmpty ([("window_size", P'.toJSON (Prelude'.fmap P'.toJSON (window_size msg)))] ++ Prelude'.concat [])

instance P'.FromJSON TTYInfo where
  parseJSON
   = P'.withObject "TTYInfo"
      (\ o ->
        do
          window_size <- P'.explicitParseFieldMaybe P'.parseJSON o "window_size"
          Prelude'.return P'.defaultValue{_window_size = window_size})

instance P'.Mergeable TTYInfo where
  mergeAppend (TTYInfo x'1) (TTYInfo y'1) = TTYInfo (P'.mergeAppend x'1 y'1)

instance P'.Default TTYInfo where
  defaultValue = TTYInfo P'.defaultValue

instance P'.Wire TTYInfo where
  wireSize ft' self'@(TTYInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1)
  wirePutWithSize ft' self'@(TTYInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 11 x'1]
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
             10 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{_window_size = P'.mergeAppend (_window_size old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> TTYInfo) TTYInfo where
  getVal m' f' = f' m'

instance P'.GPB TTYInfo

instance P'.ReflectDescriptor TTYInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.TTYInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TTYInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"TTYInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TTYInfo.window_size\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TTYInfo\"], baseName' = FName \"window_size\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TTYInfo.WindowSize\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"TTYInfo\"], baseName = MName \"WindowSize\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType TTYInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg TTYInfo where
  textPut msg
   = do
       P'.tellT "window_size" (_window_size msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_window_size]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_window_size
         = P'.try
            (do
               v <- P'.getT "window_size"
               Prelude'.return (\ o -> o{_window_size = v}))