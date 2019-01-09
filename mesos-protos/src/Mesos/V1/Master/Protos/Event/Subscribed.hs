{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Event.Subscribed (Subscribed(..), get_state, heartbeat_interval_seconds) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Master.Protos.Response.GetState as Protos.Response (GetState)

data Subscribed = Subscribed{_get_state :: !(P'.Maybe Protos.Response.GetState),
                             _heartbeat_interval_seconds :: !(P'.Maybe P'.Double)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Subscribed

instance P'.ToJSON Subscribed where
  toJSON msg
   = P'.objectNoEmpty
      ([("get_state", P'.toJSON (Prelude'.fmap P'.toJSON (get_state msg))),
        ("heartbeat_interval_seconds", P'.toJSON (Prelude'.fmap P'.toJSON (heartbeat_interval_seconds msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Subscribed where
  parseJSON
   = P'.withObject "Subscribed"
      (\ o ->
        do
          get_state <- P'.explicitParseFieldMaybe P'.parseJSON o "get_state"
          heartbeat_interval_seconds <- P'.explicitParseFieldMaybe P'.parseJSON o "heartbeat_interval_seconds"
          Prelude'.return P'.defaultValue{_get_state = get_state, _heartbeat_interval_seconds = heartbeat_interval_seconds})

instance P'.Mergeable Subscribed where
  mergeAppend (Subscribed x'1 x'2) (Subscribed y'1 y'2) = Subscribed (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Subscribed where
  defaultValue = Subscribed P'.defaultValue P'.defaultValue

instance P'.Wire Subscribed where
  wireSize ft' self'@(Subscribed x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 1 x'2)
  wirePutWithSize ft' self'@(Subscribed x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 10 11 x'1, P'.wirePutOptWithSize 17 1 x'2]
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
                    (\ !new'Field -> old'Self{_get_state = P'.mergeAppend (_get_state old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{_heartbeat_interval_seconds = Prelude'.Just new'Field}) (P'.wireGet 1)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Subscribed) Subscribed where
  getVal m' f' = f' m'

instance P'.GPB Subscribed

instance P'.ReflectDescriptor Subscribed where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 17])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Event.Subscribed\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"Subscribed\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Event\",\"Subscribed.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.Subscribed.get_state\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"get_state\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetState\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.Subscribed.heartbeat_interval_seconds\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"Subscribed\"], baseName' = FName \"heartbeat_interval_seconds\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Subscribed where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Subscribed where
  textPut msg
   = do
       P'.tellT "get_state" (_get_state msg)
       P'.tellT "heartbeat_interval_seconds" (_heartbeat_interval_seconds msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_get_state, parse'_heartbeat_interval_seconds]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_get_state
         = P'.try
            (do
               v <- P'.getT "get_state"
               Prelude'.return (\ o -> o{_get_state = v}))
        parse'_heartbeat_interval_seconds
         = P'.try
            (do
               v <- P'.getT "heartbeat_interval_seconds"
               Prelude'.return (\ o -> o{_heartbeat_interval_seconds = v}))