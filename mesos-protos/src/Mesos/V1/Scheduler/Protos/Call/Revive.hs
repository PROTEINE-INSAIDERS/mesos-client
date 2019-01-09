{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Call.Revive (Revive(..), roles) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Revive = Revive{_roles :: !(P'.Seq P'.Utf8)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Revive

instance P'.ToJSON Revive where
  toJSON msg = P'.objectNoEmpty ([("roles", P'.toJSON (Prelude'.fmap P'.toJSON (roles msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Revive where
  parseJSON
   = P'.withObject "Revive"
      (\ o ->
        do
          roles <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                    (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "roles")
          Prelude'.return P'.defaultValue{_roles = roles})

instance P'.Mergeable Revive where
  mergeAppend (Revive x'1) (Revive y'1) = Revive (P'.mergeAppend x'1 y'1)

instance P'.Default Revive where
  defaultValue = Revive P'.defaultValue

instance P'.Wire Revive where
  wireSize ft' self'@(Revive x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 9 x'1)
  wirePutWithSize ft' self'@(Revive x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutRepWithSize 10 9 x'1]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_roles = P'.append (_roles old'Self) new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Revive) Revive where
  getVal m' f' = f' m'

instance P'.GPB Revive

instance P'.ReflectDescriptor Revive where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.scheduler.Call.Revive\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule = [MName \"Protos\",MName \"Call\"], baseName = MName \"Revive\"}, descFilePath = [\"Mesos\",\"V1\",\"Scheduler\",\"Protos\",\"Call\",\"Revive.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.scheduler.Call.Revive.roles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Scheduler\"], parentModule' = [MName \"Protos\",MName \"Call\",MName \"Revive\"], baseName' = FName \"roles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Revive where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Revive where
  textPut msg
   = do
       P'.tellT "roles" (_roles msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_roles]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_roles
         = P'.try
            (do
               v <- P'.getT "roles"
               Prelude'.return (\ o -> o{_roles = P'.append (_roles o) v}))