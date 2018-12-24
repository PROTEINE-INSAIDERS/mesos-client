{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Device.Number (Number(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Number = Number{major_number :: !(P'.Word64), minor_number :: !(P'.Word64)}
              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Number where
  toJSON msg
   = P'.objectNoEmpty
      ([("major_number", P'.toJSONShowWithPayload (major_number msg)),
        ("minor_number", P'.toJSONShowWithPayload (minor_number msg))]
        ++ Prelude'.concat [])

instance P'.FromJSON Number where
  parseJSON
   = P'.withObject "Number"
      (\ o ->
        do
          major_number <- P'.explicitParseField (P'.parseJSONReadWithPayload "uint64") o "major_number"
          minor_number <- P'.explicitParseField (P'.parseJSONReadWithPayload "uint64") o "minor_number"
          Prelude'.return P'.defaultValue{major_number = major_number, minor_number = minor_number})

instance P'.Mergeable Number where
  mergeAppend (Number x'1 x'2) (Number y'1 y'2) = Number (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)

instance P'.Default Number where
  defaultValue = Number P'.defaultValue P'.defaultValue

instance P'.Wire Number where
  wireSize ft' self'@(Number x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeReq 1 4 x'1 + P'.wireSizeReq 1 4 x'2)
  wirePutWithSize ft' self'@(Number x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutReqWithSize 8 4 x'1, P'.wirePutReqWithSize 16 4 x'2]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{major_number = new'Field}) (P'.wireGet 4)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{minor_number = new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Number) Number where
  getVal m' f' = f' m'

instance P'.GPB Number

instance P'.ReflectDescriptor Number where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 16]) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Device.Number\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Device\"], baseName = MName \"Number\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Device\",\"Number.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Device.Number.major_number\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Device\",MName \"Number\"], baseName' = FName \"major_number\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Device.Number.minor_number\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Device\",MName \"Number\"], baseName' = FName \"minor_number\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Number where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Number where
  textPut msg
   = do
       P'.tellT "major_number" (major_number msg)
       P'.tellT "minor_number" (minor_number msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'major_number, parse'minor_number]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'major_number
         = P'.try
            (do
               v <- P'.getT "major_number"
               Prelude'.return (\ o -> o{major_number = v}))
        parse'minor_number
         = P'.try
            (do
               v <- P'.getT "minor_number"
               Prelude'.return (\ o -> o{minor_number = v}))