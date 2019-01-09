{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Resource.DiskInfo.Persistence (Persistence(..), id, principal) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Persistence = Persistence{_id :: !(P'.Utf8), _principal :: !(P'.Maybe P'.Utf8)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Persistence

instance P'.ToJSON Persistence where
  toJSON msg
   = P'.objectNoEmpty
      ([("id", P'.toJSON (id msg)), ("principal", P'.toJSON (Prelude'.fmap P'.toJSON (principal msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Persistence where
  parseJSON
   = P'.withObject "Persistence"
      (\ o ->
        do
          id <- P'.explicitParseField P'.parseJSON o "id"
          principal <- P'.explicitParseFieldMaybe P'.parseJSON o "principal"
          Prelude'.return P'.defaultValue{_id = id, _principal = principal})

instance P'.Mergeable Persistence where
  mergeAppend (Persistence x'1 x'2) (Persistence y'1 y'2) = Persistence (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Persistence where
  defaultValue = Persistence P'.defaultValue P'.defaultValue

instance P'.Wire Persistence where
  wireSize ft' self'@(Persistence x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePutWithSize ft' self'@(Persistence x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 18 9 x'2]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_id = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_principal = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Persistence) Persistence where
  getVal m' f' = f' m'

instance P'.GPB Persistence

instance P'.ReflectDescriptor Persistence where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo.Persistence\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\"], baseName = MName \"Persistence\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Resource\",\"DiskInfo\",\"Persistence.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Persistence.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Persistence\"], baseName' = FName \"id\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.DiskInfo.Persistence.principal\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"DiskInfo\",MName \"Persistence\"], baseName' = FName \"principal\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Persistence where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Persistence where
  textPut msg
   = do
       P'.tellT "id" (_id msg)
       P'.tellT "principal" (_principal msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_id, parse'_principal]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{_id = v}))
        parse'_principal
         = P'.try
            (do
               v <- P'.getT "principal"
               Prelude'.return (\ o -> o{_principal = v}))