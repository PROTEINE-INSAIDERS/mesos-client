{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CheckStatusInfo.Command (Command(..), exit_code) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data Command = Command{_exit_code :: !(P'.Maybe P'.Int32)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''Command

instance P'.ToJSON Command where
  toJSON msg = P'.objectNoEmpty ([("exit_code", P'.toJSON (Prelude'.fmap P'.toJSON (exit_code msg)))] ++ Prelude'.concat [])

instance P'.FromJSON Command where
  parseJSON
   = P'.withObject "Command"
      (\ o ->
        do
          exit_code <- P'.explicitParseFieldMaybe P'.parseJSON o "exit_code"
          Prelude'.return P'.defaultValue{_exit_code = exit_code})

instance P'.Mergeable Command where
  mergeAppend (Command x'1) (Command y'1) = Command (P'.mergeAppend x'1 y'1)

instance P'.Default Command where
  defaultValue = Command P'.defaultValue

instance P'.Wire Command where
  wireSize ft' self'@(Command x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 5 x'1)
  wirePutWithSize ft' self'@(Command x'1)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize [P'.wirePutOptWithSize 8 5 x'1]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{_exit_code = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Command) Command where
  getVal m' f' = f' m'

instance P'.GPB Command

instance P'.ReflectDescriptor Command where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CheckStatusInfo.Command\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CheckStatusInfo\"], baseName = MName \"Command\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CheckStatusInfo\",\"Command.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.CheckStatusInfo.Command.exit_code\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"CheckStatusInfo\",MName \"Command\"], baseName' = FName \"exit_code\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType Command where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Command where
  textPut msg
   = do
       P'.tellT "exit_code" (_exit_code msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'_exit_code]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_exit_code
         = P'.try
            (do
               v <- P'.getT "exit_code"
               Prelude'.return (\ o -> o{_exit_code = v}))