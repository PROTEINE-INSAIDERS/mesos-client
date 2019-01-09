{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Role (Role(..), name, weight, frameworks, resources) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.FrameworkID as Protos (FrameworkID)
import qualified Mesos.V1.Protos.Resource as Protos (Resource)

data Role = Role{_name :: !(P'.Utf8), _weight :: !(P'.Double), _frameworks :: !(P'.Seq Protos.FrameworkID),
                 _resources :: !(P'.Seq Protos.Resource)}
            deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Role

instance P'.ToJSON Role where
  toJSON msg
   = P'.objectNoEmpty
      ([("name", P'.toJSON (name msg)), ("weight", P'.toJSON (weight msg)),
        ("frameworks", P'.toJSON (Prelude'.fmap P'.toJSON (frameworks msg))),
        ("resources", P'.toJSON (Prelude'.fmap P'.toJSON (resources msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Role where
  parseJSON
   = P'.withObject "Role"
      (\ o ->
        do
          name <- P'.explicitParseField P'.parseJSON o "name"
          weight <- P'.explicitParseField P'.parseJSON o "weight"
          frameworks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "frameworks")
          resources <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                        (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "resources")
          Prelude'.return P'.defaultValue{_name = name, _weight = weight, _frameworks = frameworks, _resources = resources})

instance P'.Mergeable Role where
  mergeAppend (Role x'1 x'2 x'3 x'4) (Role y'1 y'2 y'3 y'4)
   = Role (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default Role where
  defaultValue = Role P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Role where
  wireSize ft' self'@(Role x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeReq 1 1 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 11 x'4)
  wirePutWithSize ft' self'@(Role x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutReqWithSize 17 1 x'2, P'.wirePutRepWithSize 26 11 x'3,
             P'.wirePutRepWithSize 34 11 x'4]
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
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{_weight = new'Field}) (P'.wireGet 1)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_frameworks = P'.append (_frameworks old'Self) new'Field})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{_resources = P'.append (_resources old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Role) Role where
  getVal m' f' = f' m'

instance P'.GPB Role

instance P'.ReflectDescriptor Role where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10, 17]) (P'.fromDistinctAscList [10, 17, 26, 34])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Role\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Role\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Role.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Role.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Role\"], baseName' = FName \"name\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Role.weight\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Role\"], baseName' = FName \"weight\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Role.frameworks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Role\"], baseName' = FName \"frameworks\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Role.resources\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Role\"], baseName' = FName \"resources\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Role where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Role where
  textPut msg
   = do
       P'.tellT "name" (_name msg)
       P'.tellT "weight" (_weight msg)
       P'.tellT "frameworks" (_frameworks msg)
       P'.tellT "resources" (_resources msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_name, parse'_weight, parse'_frameworks, parse'_resources]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{_name = v}))
        parse'_weight
         = P'.try
            (do
               v <- P'.getT "weight"
               Prelude'.return (\ o -> o{_weight = v}))
        parse'_frameworks
         = P'.try
            (do
               v <- P'.getT "frameworks"
               Prelude'.return (\ o -> o{_frameworks = P'.append (_frameworks o) v}))
        parse'_resources
         = P'.try
            (do
               v <- P'.getT "resources"
               Prelude'.return (\ o -> o{_resources = P'.append (_resources o) v}))