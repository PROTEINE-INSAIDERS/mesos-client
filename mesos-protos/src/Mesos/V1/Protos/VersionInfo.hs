{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.VersionInfo (VersionInfo(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data VersionInfo = VersionInfo{version :: !(P'.Utf8), build_date :: !(P'.Maybe P'.Utf8), build_time :: !(P'.Maybe P'.Double),
                               build_user :: !(P'.Maybe P'.Utf8), git_sha :: !(P'.Maybe P'.Utf8), git_branch :: !(P'.Maybe P'.Utf8),
                               git_tag :: !(P'.Maybe P'.Utf8)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON VersionInfo where
  toJSON msg
   = P'.objectNoEmpty
      ([("version", P'.toJSON (version msg)), ("build_date", P'.toJSON (Prelude'.fmap P'.toJSON (build_date msg))),
        ("build_time", P'.toJSON (Prelude'.fmap P'.toJSON (build_time msg))),
        ("build_user", P'.toJSON (Prelude'.fmap P'.toJSON (build_user msg))),
        ("git_sha", P'.toJSON (Prelude'.fmap P'.toJSON (git_sha msg))),
        ("git_branch", P'.toJSON (Prelude'.fmap P'.toJSON (git_branch msg))),
        ("git_tag", P'.toJSON (Prelude'.fmap P'.toJSON (git_tag msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON VersionInfo where
  parseJSON
   = P'.withObject "VersionInfo"
      (\ o ->
        do
          version <- P'.explicitParseField P'.parseJSON o "version"
          build_date <- P'.explicitParseFieldMaybe P'.parseJSON o "build_date"
          build_time <- P'.explicitParseFieldMaybe P'.parseJSON o "build_time"
          build_user <- P'.explicitParseFieldMaybe P'.parseJSON o "build_user"
          git_sha <- P'.explicitParseFieldMaybe P'.parseJSON o "git_sha"
          git_branch <- P'.explicitParseFieldMaybe P'.parseJSON o "git_branch"
          git_tag <- P'.explicitParseFieldMaybe P'.parseJSON o "git_tag"
          Prelude'.return
           P'.defaultValue{version = version, build_date = build_date, build_time = build_time, build_user = build_user,
                           git_sha = git_sha, git_branch = git_branch, git_tag = git_tag})

instance P'.Mergeable VersionInfo where
  mergeAppend (VersionInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7) (VersionInfo y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = VersionInfo (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)

instance P'.Default VersionInfo where
  defaultValue
   = VersionInfo P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire VersionInfo where
  wireSize ft' self'@(VersionInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeOpt 1 1 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeOpt 1 9 x'5
             + P'.wireSizeOpt 1 9 x'6
             + P'.wireSizeOpt 1 9 x'7)
  wirePutWithSize ft' self'@(VersionInfo x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'1, P'.wirePutOptWithSize 18 9 x'2, P'.wirePutOptWithSize 25 1 x'3,
             P'.wirePutOptWithSize 34 9 x'4, P'.wirePutOptWithSize 42 9 x'5, P'.wirePutOptWithSize 50 9 x'6,
             P'.wirePutOptWithSize 58 9 x'7]
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{version = new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{build_date = Prelude'.Just new'Field}) (P'.wireGet 9)
             25 -> Prelude'.fmap (\ !new'Field -> old'Self{build_time = Prelude'.Just new'Field}) (P'.wireGet 1)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{build_user = Prelude'.Just new'Field}) (P'.wireGet 9)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{git_sha = Prelude'.Just new'Field}) (P'.wireGet 9)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{git_branch = Prelude'.Just new'Field}) (P'.wireGet 9)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{git_tag = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> VersionInfo) VersionInfo where
  getVal m' f' = f' m'

instance P'.GPB VersionInfo

instance P'.ReflectDescriptor VersionInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18, 25, 34, 42, 50, 58])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.VersionInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"VersionInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"VersionInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.version\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"version\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.build_date\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"build_date\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.build_time\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"build_time\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.build_user\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"build_user\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.git_sha\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"git_sha\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.git_branch\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"git_branch\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.VersionInfo.git_tag\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"VersionInfo\"], baseName' = FName \"git_tag\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType VersionInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg VersionInfo where
  textPut msg
   = do
       P'.tellT "version" (version msg)
       P'.tellT "build_date" (build_date msg)
       P'.tellT "build_time" (build_time msg)
       P'.tellT "build_user" (build_user msg)
       P'.tellT "git_sha" (git_sha msg)
       P'.tellT "git_branch" (git_branch msg)
       P'.tellT "git_tag" (git_tag msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'version, parse'build_date, parse'build_time, parse'build_user, parse'git_sha, parse'git_branch,
                   parse'git_tag])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'version
         = P'.try
            (do
               v <- P'.getT "version"
               Prelude'.return (\ o -> o{version = v}))
        parse'build_date
         = P'.try
            (do
               v <- P'.getT "build_date"
               Prelude'.return (\ o -> o{build_date = v}))
        parse'build_time
         = P'.try
            (do
               v <- P'.getT "build_time"
               Prelude'.return (\ o -> o{build_time = v}))
        parse'build_user
         = P'.try
            (do
               v <- P'.getT "build_user"
               Prelude'.return (\ o -> o{build_user = v}))
        parse'git_sha
         = P'.try
            (do
               v <- P'.getT "git_sha"
               Prelude'.return (\ o -> o{git_sha = v}))
        parse'git_branch
         = P'.try
            (do
               v <- P'.getT "git_branch"
               Prelude'.return (\ o -> o{git_branch = v}))
        parse'git_tag
         = P'.try
            (do
               v <- P'.getT "git_tag"
               Prelude'.return (\ o -> o{git_tag = v}))