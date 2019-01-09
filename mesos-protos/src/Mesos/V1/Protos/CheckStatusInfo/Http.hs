{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CheckStatusInfo.Http (Http(..), status_code) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Http = Http{_status_code :: !(P'.Maybe P'.Word32)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Http

instance P'.ToJSON Http where
  toJSON msg = P'.objectNoEmpty ([("status_code", P'.toJSON (Prelude'.fmap P'.toJSON (status_code msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Http where
  parseJSON
   = P'.withObject "Http"
      (\ o ->
        do
          status_code <- P'.explicitParseFieldMaybe P'.parseJSON o "status_code"
          Prelude'.return P'.defaultValue{_status_code = status_code})

instance P'.Mergeable Http where
  mergeAppend (Http x'1) (Http y'1) = Http (P'.mergeAppend x'1 y'1)

instance P'.Default Http where
  defaultValue = Http P'.defaultValue

instance P'.Wire Http where
  wireSize ft' self'@(Http x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1)
  wirePutWithSize ft' self'@(Http x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 13 x'1]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_status_code = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Http) Http where
  getVal m' f' = f' m'

instance P'.GPB Http

instance P'.ReflectDescriptor Http where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CheckStatusInfo.Http\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CheckStatusInfo\"], baseName = MName \"Http\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CheckStatusInfo\",\"Http.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckStatusInfo.Http.status_code\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckStatusInfo\",MName \"Http\"], baseName' = FName \"status_code\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Http where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Http where
  textPut msg
   = do
       P'.tellT "status_code" (_status_code msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_status_code]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_status_code
         = P'.try
            (do
               v <- P'.getT "status_code"
               Prelude'.return (\ o -> o{_status_code = v}))