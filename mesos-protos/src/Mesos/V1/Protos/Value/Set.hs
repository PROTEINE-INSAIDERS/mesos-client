{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Value.Set (Set(..), item) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Set = Set{_item :: !(P'.Seq P'.Utf8)}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Set

instance P'.ToJSON Set where
  toJSON msg = P'.objectNoEmpty ([("item", P'.toJSON (Prelude'.fmap P'.toJSON (item msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Set where
  parseJSON
   = P'.withObject "Set"
      (\ o ->
        do
          item <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                   (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "item")
          Prelude'.return P'.defaultValue{_item = item})

instance P'.Mergeable Set where
  mergeAppend (Set x'1) (Set y'1) = Set (P'.mergeAppend x'1 y'1)

instance P'.Default Set where
  defaultValue = Set P'.defaultValue

instance P'.Wire Set where
  wireSize ft' self'@(Set x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 9 x'1)
  wirePutWithSize ft' self'@(Set x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_item = P'.append (_item old'Self) new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Set) Set where
  getVal m' f' = f' m'

instance P'.GPB Set

instance P'.ReflectDescriptor Set where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Value.Set\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Set\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Value\",\"Set.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Value.Set.item\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Value\",MName \"Set\"], baseName' = FName \"item\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Set where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Set where
  textPut msg
   = do
       P'.tellT "item" (_item msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_item]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_item
         = P'.try
            (do
               v <- P'.getT "item"
               Prelude'.return (\ o -> o{_item = P'.append (_item o) v}))