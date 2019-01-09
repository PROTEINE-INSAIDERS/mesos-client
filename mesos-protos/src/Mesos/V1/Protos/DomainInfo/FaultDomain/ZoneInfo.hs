{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.DomainInfo.FaultDomain.ZoneInfo (ZoneInfo(..), name) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data ZoneInfo = ZoneInfo{_name :: !(P'.Utf8)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ZoneInfo

instance P'.ToJSON ZoneInfo where
  toJSON msg = P'.objectNoEmpty ([("name", P'.toJSON (name msg))] ++ Prelude'.concat [])

instance P'.FromJSON ZoneInfo where
  parseJSON
   = P'.withObject "ZoneInfo"
      (\ o ->
        do
          name <- P'.explicitParseField P'.parseJSON o "name"
          Prelude'.return P'.defaultValue{_name = name})

instance P'.Mergeable ZoneInfo where
  mergeAppend (ZoneInfo x'1) (ZoneInfo y'1) = ZoneInfo (P'.mergeAppend x'1 y'1)

instance P'.Default ZoneInfo where
  defaultValue = ZoneInfo P'.defaultValue

instance P'.Wire ZoneInfo where
  wireSize ft' self'@(ZoneInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1)
  wirePutWithSize ft' self'@(ZoneInfo x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 9 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_name = new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ZoneInfo) ZoneInfo where
  getVal m' f' = f' m'

instance P'.GPB ZoneInfo

instance P'.ReflectDescriptor ZoneInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.DomainInfo.FaultDomain.ZoneInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"DomainInfo\",MName \"FaultDomain\"], baseName = MName \"ZoneInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"DomainInfo\",\"FaultDomain\",\"ZoneInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.DomainInfo.FaultDomain.ZoneInfo.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"DomainInfo\",MName \"FaultDomain\",MName \"ZoneInfo\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType ZoneInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ZoneInfo where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_name]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))