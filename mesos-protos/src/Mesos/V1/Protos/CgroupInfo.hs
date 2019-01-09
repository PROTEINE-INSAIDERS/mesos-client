{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CgroupInfo (CgroupInfo(..), net_cls) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CgroupInfo.NetCls as Protos.CgroupInfo (NetCls)

data CgroupInfo = CgroupInfo{_net_cls :: !(P'.Maybe Protos.CgroupInfo.NetCls)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''CgroupInfo

instance P'.ToJSON CgroupInfo where
  toJSON msg = P'.objectNoEmpty ([("net_cls", P'.toJSON (Prelude'.fmap P'.toJSON (net_cls msg)))] ++ Prelude'.concat [])

instance P'.FromJSON CgroupInfo where
  parseJSON
   = P'.withObject "CgroupInfo"
      (\ o ->
        do
          net_cls <- P'.explicitParseFieldMaybe P'.parseJSON o "net_cls"
          Prelude'.return P'.defaultValue{_net_cls = net_cls})

instance P'.Mergeable CgroupInfo where
  mergeAppend (CgroupInfo x'1) (CgroupInfo y'1) = CgroupInfo (P'.mergeAppend x'1 y'1)

instance P'.Default CgroupInfo where
  defaultValue = CgroupInfo P'.defaultValue

instance P'.Wire CgroupInfo where
  wireSize ft' self'@(CgroupInfo x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1)
  wirePutWithSize ft' self'@(CgroupInfo x'1)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_cls = P'.mergeAppend (_net_cls old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CgroupInfo) CgroupInfo where
  getVal m' f' = f' m'

instance P'.GPB CgroupInfo

instance P'.ReflectDescriptor CgroupInfo where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"CgroupInfo\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CgroupInfo.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CgroupInfo.net_cls\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CgroupInfo\"], baseName' = FName \"net_cls\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.NetCls\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\"], baseName = MName \"NetCls\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType CgroupInfo where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CgroupInfo where
  textPut msg
   = do
       P'.tellT "net_cls" (_net_cls msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_net_cls]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_net_cls
         = P'.try
            (do
               v <- P'.getT "net_cls"
               Prelude'.return (\ o -> o{_net_cls = v}))