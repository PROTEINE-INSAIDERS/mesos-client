{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Master.Protos.Event.FrameworkUpdated (FrameworkUpdated(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Master.Protos.Response.GetFrameworks.Framework as Protos.Response.GetFrameworks (Framework)

data FrameworkUpdated = FrameworkUpdated{framework :: !(Protos.Response.GetFrameworks.Framework)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable FrameworkUpdated where
  mergeAppend (FrameworkUpdated x'1) (FrameworkUpdated y'1) = FrameworkUpdated (P'.mergeAppend x'1 y'1)

instance P'.Default FrameworkUpdated where
  defaultValue = FrameworkUpdated P'.defaultValue

instance P'.Wire FrameworkUpdated where
  wireSize ft' self'@(FrameworkUpdated x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 11 x'1)
  wirePutWithSize ft' self'@(FrameworkUpdated x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 10 11 x'1]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{framework = P'.mergeAppend (framework old'Self) (new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> FrameworkUpdated) FrameworkUpdated where
  getVal m' f' = f' m'

instance P'.GPB FrameworkUpdated

instance P'.ReflectDescriptor FrameworkUpdated where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.master.Event.FrameworkUpdated\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Event\"], baseName = MName \"FrameworkUpdated\"}, descFilePath = [\"Mesos\",\"V1\",\"Master\",\"Protos\",\"Event\",\"FrameworkUpdated.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.master.Event.FrameworkUpdated.framework\", haskellPrefix' = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule' = [MName \"Protos\",MName \"Event\",MName \"FrameworkUpdated\"], baseName' = FName \"framework\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.master.Response.GetFrameworks.Framework\", haskellPrefix = [MName \"Mesos\",MName \"V1\",MName \"Master\"], parentModule = [MName \"Protos\",MName \"Response\",MName \"GetFrameworks\"], baseName = MName \"Framework\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False}"

instance P'.TextType FrameworkUpdated where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg FrameworkUpdated where
  textPut msg
   = do
       P'.tellT "framework" (framework msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'framework]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'framework
         = P'.try
            (do
               v <- P'.getT "framework"
               Prelude'.return (\ o -> o{framework = v}))