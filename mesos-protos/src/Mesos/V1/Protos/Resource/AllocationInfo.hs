{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Resource.AllocationInfo (AllocationInfo(..), role) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data AllocationInfo = AllocationInfo{_role :: !(P'.Maybe P'.Utf8)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''AllocationInfo

instance P'.ToJSON AllocationInfo where
  toJSON msg = P'.objectNoEmpty ([("role", P'.toJSON (Prelude'.fmap P'.toJSON (role msg)))] ++ Prelude'.concat [])

instance P'.FromJSON AllocationInfo where
  parseJSON
   = P'.withObject "AllocationInfo"
      (\ o ->
        do
          role <- P'.explicitParseFieldMaybe P'.parseJSON o "role"
          Prelude'.return P'.defaultValue{_role = role})

instance P'.Mergeable AllocationInfo where
  mergeAppend (AllocationInfo x'1) (AllocationInfo y'1) = AllocationInfo (P'.mergeAppend x'1 y'1)

instance P'.Default AllocationInfo where
  defaultValue = AllocationInfo P'.defaultValue

instance P'.Wire AllocationInfo where
  wireSize ft' self'@(AllocationInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1)
  wirePutWithSize ft' self'@(AllocationInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 9 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_role = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> AllocationInfo) AllocationInfo where
  getVal m' f' = f' m'

instance P'.GPB AllocationInfo

instance P'.ReflectDescriptor AllocationInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Resource.AllocationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"AllocationInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Resource\",\"AllocationInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.AllocationInfo.role\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\",MName \"AllocationInfo\"], baseName' = FName \"role\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType AllocationInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg AllocationInfo where
  textPut msg
   = do
       P'.tellT "role" (_role msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_role]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_role
         = P'.try
            (do
               v <- P'.getT "role"
               Prelude'.return (\ o -> o{_role = v}))