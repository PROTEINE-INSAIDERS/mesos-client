{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.KillPolicy (KillPolicy(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.DurationInfo as Protos (DurationInfo)

data KillPolicy = KillPolicy{grace_period :: !(P'.Maybe Protos.DurationInfo)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON KillPolicy where
  toJSON msg = P'.objectNoEmpty ([("grace_period", P'.toJSON (Prelude'.fmap P'.toJSON (grace_period msg)))] ++ Prelude'.concat [])

instance P'.FromJSON KillPolicy where
  parseJSON
   = P'.withObject "KillPolicy"
      (\ o ->
        do
          grace_period <- P'.explicitParseFieldMaybe P'.parseJSON o "grace_period"
          Prelude'.return P'.defaultValue{grace_period = grace_period})

instance P'.Mergeable KillPolicy where
  mergeAppend (KillPolicy x'1) (KillPolicy y'1) = KillPolicy (P'.mergeAppend x'1 y'1)

instance P'.Default KillPolicy where
  defaultValue = KillPolicy P'.defaultValue

instance P'.Wire KillPolicy where
  wireSize ft' self'@(KillPolicy x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1)
  wirePutWithSize ft' self'@(KillPolicy x'1)
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
                    (\ !new'Field -> old'Self{grace_period = P'.mergeAppend (grace_period old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> KillPolicy) KillPolicy where
  getVal m' f' = f' m'

instance P'.GPB KillPolicy

instance P'.ReflectDescriptor KillPolicy where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.KillPolicy\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"KillPolicy\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"KillPolicy.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.KillPolicy.grace_period\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"KillPolicy\"], baseName' = FName \"grace_period\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DurationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DurationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType KillPolicy where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg KillPolicy where
  textPut msg
   = do
       P'.tellT "grace_period" (grace_period msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'grace_period]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'grace_period
         = P'.try
            (do
               v <- P'.getT "grace_period"
               Prelude'.return (\ o -> o{grace_period = v}))