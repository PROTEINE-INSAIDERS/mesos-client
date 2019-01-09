{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CgroupInfo.Blkio.Statistics (Statistics(..), cfq, cfq_recursive, throttling) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CgroupInfo.Blkio.CFQ.Statistics as Protos.CgroupInfo.Blkio.CFQ (Statistics)
import qualified Mesos.V1.Protos.CgroupInfo.Blkio.Throttling.Statistics as Protos.CgroupInfo.Blkio.Throttling (Statistics)

data Statistics = Statistics{_cfq :: !(P'.Seq Protos.CgroupInfo.Blkio.CFQ.Statistics),
                             _cfq_recursive :: !(P'.Seq Protos.CgroupInfo.Blkio.CFQ.Statistics),
                             _throttling :: !(P'.Seq Protos.CgroupInfo.Blkio.Throttling.Statistics)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Statistics

instance P'.ToJSON Statistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("cfq", P'.toJSON (Prelude'.fmap P'.toJSON (cfq msg))),
        ("cfq_recursive", P'.toJSON (Prelude'.fmap P'.toJSON (cfq_recursive msg))),
        ("throttling", P'.toJSON (Prelude'.fmap P'.toJSON (throttling msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Statistics where
  parseJSON
   = P'.withObject "Statistics"
      (\ o ->
        do
          cfq <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                  (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "cfq")
          cfq_recursive <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                            (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "cfq_recursive")
          throttling <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                         (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "throttling")
          Prelude'.return P'.defaultValue{_cfq = cfq, _cfq_recursive = cfq_recursive, _throttling = throttling})

instance P'.Mergeable Statistics where
  mergeAppend (Statistics x'1 x'2 x'3) (Statistics y'1 y'2 y'3)
   = Statistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)

instance P'.Default Statistics where
  defaultValue = Statistics P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire Statistics where
  wireSize ft' self'@(Statistics x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2 + P'.wireSizeRep 1 11 x'3)
  wirePutWithSize ft' self'@(Statistics x'1 x'2 x'3)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_cfq = P'.append (_cfq old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{_cfq_recursive = P'.append (_cfq_recursive old'Self) new'Field})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{_throttling = P'.append (_throttling old'Self) new'Field})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Statistics) Statistics where
  getVal m' f' = f' m'

instance P'.GPB Statistics

instance P'.ReflectDescriptor Statistics where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Statistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Statistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CgroupInfo\",\"Blkio\",\"Statistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.Statistics.cfq\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"Statistics\"], baseName' = FName \"cfq\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\"], baseName = MName \"Statistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.Statistics.cfq_recursive\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"Statistics\"], baseName' = FName \"cfq_recursive\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ.Statistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"CFQ\"], baseName = MName \"Statistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.Blkio.Statistics.throttling\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"Statistics\"], baseName' = FName \"throttling\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Throttling.Statistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\",MName \"Throttling\"], baseName = MName \"Statistics\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Statistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Statistics where
  textPut msg
   = do
       P'.tellT "cfq" (_cfq msg)
       P'.tellT "cfq_recursive" (_cfq_recursive msg)
       P'.tellT "throttling" (_throttling msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_cfq, parse'_cfq_recursive, parse'_throttling]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_cfq
         = P'.try
            (do
               v <- P'.getT "cfq"
               Prelude'.return (\ o -> o{_cfq = P'.append (_cfq o) v}))
        parse'_cfq_recursive
         = P'.try
            (do
               v <- P'.getT "cfq_recursive"
               Prelude'.return (\ o -> o{_cfq_recursive = P'.append (_cfq_recursive o) v}))
        parse'_throttling
         = P'.try
            (do
               v <- P'.getT "throttling"
               Prelude'.return (\ o -> o{_throttling = P'.append (_throttling o) v}))