{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Response.GetFrameworks (GetFrameworks(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Master.Protos.Response.GetFrameworks.Framework as Protos.Response.GetFrameworks (Framework)
import qualified Mesos.V1.Protos.FrameworkInfo as Protos (FrameworkInfo)

data GetFrameworks = GetFrameworks{frameworks :: !(P'.Seq Protos.Response.GetFrameworks.Framework),
                                   completed_frameworks :: !(P'.Seq Protos.Response.GetFrameworks.Framework),
                                   recovered_frameworks :: !(P'.Seq Protos.FrameworkInfo)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON GetFrameworks where
  toJSON msg
   = P'.objectNoEmpty
      ([("frameworks", P'.toJSON (Prelude'.fmap P'.toJSON (frameworks msg))),
        ("completed_frameworks", P'.toJSON (Prelude'.fmap P'.toJSON (completed_frameworks msg))),
        ("recovered_frameworks", P'.toJSON (Prelude'.fmap P'.toJSON (recovered_frameworks msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON GetFrameworks where
  parseJSON
   = P'.withObject "GetFrameworks"
      (\ o ->
        do
          frameworks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "frameworks")
          completed_frameworks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                   (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                     "completed_frameworks")
          recovered_frameworks <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                   (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                     "recovered_frameworks")
          Prelude'.return
           P'.defaultValue{frameworks = frameworks, completed_frameworks = completed_frameworks,
                           recovered_frameworks = recovered_frameworks})

instance P'.Mergeable GetFrameworks where
  mergeAppend (GetFrameworks x'1 x'2 x'3) (GetFrameworks y'1 y'2 y'3)
   = GetFrameworks (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default GetFrameworks where
  defaultValue = GetFrameworks P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire GetFrameworks where
  wireSize ft' self'@(GetFrameworks x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeRep 1 11 x'3)
  wirePutWithSize ft' self'@(GetFrameworks x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutRepWithSize 10 11 x'1, P'.wirePutRepWithSize 18 11 x'2, P'.wirePutRepWithSize 26 11 x'3]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{frameworks = P'.append (frameworks old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{completed_frameworks = P'.append (completed_frameworks old'Self) new'Field})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{recovered_frameworks = P'.append (recovered_frameworks old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> GetFrameworks) GetFrameworks where
  getVal m' f' = f' m'

instance P'.GPB GetFrameworks

instance P'.ReflectDescriptor GetFrameworks where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\"], baseName = MName \"GetFrameworks\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Response\",\"GetFrameworks.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.frameworks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName' = FName \"frameworks\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks.Framework\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName = MName \"Framework\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.completed_frameworks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName' = FName \"completed_frameworks\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks.Framework\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName = MName \"Framework\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Response.GetFrameworks.recovered_frameworks\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName' = FName \"recovered_frameworks\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.FrameworkInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"FrameworkInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType GetFrameworks where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg GetFrameworks where
  textPut msg
   = do
       P'.tellT "frameworks" (frameworks msg)
       P'.tellT "completed_frameworks" (completed_frameworks msg)
       P'.tellT "recovered_frameworks" (recovered_frameworks msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'frameworks, parse'completed_frameworks, parse'recovered_frameworks]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'frameworks
         = P'.try
            (do
               v <- P'.getT "frameworks"
               Prelude'.return (\ o -> o{frameworks = P'.append (frameworks o) v}))
        parse'completed_frameworks
         = P'.try
            (do
               v <- P'.getT "completed_frameworks"
               Prelude'.return (\ o -> o{completed_frameworks = P'.append (completed_frameworks o) v}))
        parse'recovered_frameworks
         = P'.try
            (do
               v <- P'.getT "recovered_frameworks"
               Prelude'.return (\ o -> o{recovered_frameworks = P'.append (recovered_frameworks o) v}))