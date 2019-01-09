{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Credential (Credential(..), principal, secret) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Credential = Credential{_principal :: !(P'.Utf8), _secret :: !(P'.Maybe P'.Utf8)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Credential

instance P'.ToJSON Credential where
  toJSON msg
   = P'.objectNoEmpty
      ([("principal", P'.toJSON (principal msg)), ("secret", P'.toJSON (Prelude'.fmap P'.toJSON (secret msg)))] ++
        Prelude'.concat [])

instance P'.FromJSON Credential where
  parseJSON
   = P'.withObject "Credential"
      (\ o ->
        do
          principal <- P'.explicitParseField P'.parseJSON o "principal"
          secret <- P'.explicitParseFieldMaybe P'.parseJSON o "secret"
          Prelude'.return P'.defaultValue{_principal = principal, _secret = secret})

instance P'.Mergeable Credential where
  mergeAppend (Credential x'1 x'2) (Credential y'1 y'2) = Credential (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Credential where
  defaultValue = Credential P'.defaultValue P'.defaultValue

instance P'.Wire Credential where
  wireSize ft' self'@(Credential x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePutWithSize ft' self'@(Credential x'1 x'2)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_principal = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_secret = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Credential) Credential where
  getVal m' f' = f' m'

instance P'.GPB Credential

instance P'.ReflectDescriptor Credential where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Credential\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Credential\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Credential.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Credential.principal\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Credential\"], baseName' = FName \"principal\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Credential.secret\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Credential\"], baseName' = FName \"secret\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Credential where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Credential where
  textPut msg
   = do
       P'.tellT "principal" (_principal msg)
       P'.tellT "secret" (_secret msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_principal, parse'_secret]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_principal
         = P'.try
            (do
               v <- P'.getT "principal"
               Prelude'.return (\ o -> o{_principal = v}))
        parse'_secret
         = P'.try
            (do
               v <- P'.getT "secret"
               Prelude'.return (\ o -> o{_secret = v}))