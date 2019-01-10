{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TTYInfo.WindowSize (WindowSize(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data WindowSize = WindowSize{rows :: !(P'.Word32), columns :: !(P'.Word32)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON WindowSize where
  toJSON msg = P'.objectNoEmpty ([("rows", P'.toJSON (rows msg)), ("columns", P'.toJSON (columns msg))] ++ Prelude'.concat [])

instance P'.FromJSON WindowSize where
  parseJSON
   = P'.withObject "WindowSize"
      (\ o ->
        do
          rows <- P'.explicitParseField P'.parseJSON o "rows"
          columns <- P'.explicitParseField P'.parseJSON o "columns"
          Prelude'.return P'.defaultValue{rows = rows, columns = columns})

instance P'.Mergeable WindowSize where
  mergeAppend (WindowSize x'1 x'2) (WindowSize y'1 y'2) = WindowSize (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default WindowSize where
  defaultValue = WindowSize P'.defaultValue P'.defaultValue

instance P'.Wire WindowSize where
  wireSize ft' self'@(WindowSize x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 13 x'1 + P'.wireSizeReq 1 13 x'2)
  wirePutWithSize ft' self'@(WindowSize x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 13 x'1, P'.wirePutReqWithSize 16 13 x'2]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{rows = new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{columns = new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> WindowSize) WindowSize where
  getVal m' f' = f' m'

instance P'.GPB WindowSize

instance P'.ReflectDescriptor WindowSize where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 16]) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.TTYInfo.WindowSize\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"TTYInfo\"], baseName = MName \"WindowSize\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"TTYInfo\",\"WindowSize.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TTYInfo.WindowSize.rows\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TTYInfo\",MName \"WindowSize\"], baseName' = FName \"rows\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.TTYInfo.WindowSize.columns\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"TTYInfo\",MName \"WindowSize\"], baseName' = FName \"columns\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType WindowSize where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg WindowSize where
  textPut msg
   = do
       P'.tellT "rows" (rows msg)
       P'.tellT "columns" (columns msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'rows, parse'columns]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'rows
         = P'.try
            (do
               v <- P'.getT "rows"
               Prelude'.return (\ o -> o{rows = v}))
        parse'columns
         = P'.try
            (do
               v <- P'.getT "columns"
               Prelude'.return (\ o -> o{columns = v}))