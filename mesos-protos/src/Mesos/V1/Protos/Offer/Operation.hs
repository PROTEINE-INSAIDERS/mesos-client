{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Offer.Operation (Operation(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Offer.Operation.Create as Protos.Offer.Operation (Create)
import qualified Mesos.V1.Protos.Offer.Operation.CreateDisk as Protos.Offer.Operation (CreateDisk)
import qualified Mesos.V1.Protos.Offer.Operation.Destroy as Protos.Offer.Operation (Destroy)
import qualified Mesos.V1.Protos.Offer.Operation.DestroyDisk as Protos.Offer.Operation (DestroyDisk)
import qualified Mesos.V1.Protos.Offer.Operation.GrowVolume as Protos.Offer.Operation (GrowVolume)
import qualified Mesos.V1.Protos.Offer.Operation.Launch as Protos.Offer.Operation (Launch)
import qualified Mesos.V1.Protos.Offer.Operation.LaunchGroup as Protos.Offer.Operation (LaunchGroup)
import qualified Mesos.V1.Protos.Offer.Operation.Reserve as Protos.Offer.Operation (Reserve)
import qualified Mesos.V1.Protos.Offer.Operation.ShrinkVolume as Protos.Offer.Operation (ShrinkVolume)
import qualified Mesos.V1.Protos.Offer.Operation.Type as Protos.Offer.Operation (Type)
import qualified Mesos.V1.Protos.Offer.Operation.Unreserve as Protos.Offer.Operation (Unreserve)
import qualified Mesos.V1.Protos.OperationID as Protos (OperationID)

data Operation = Operation{type' :: !(P'.Maybe Protos.Offer.Operation.Type), id :: !(P'.Maybe Protos.OperationID),
                           launch :: !(P'.Maybe Protos.Offer.Operation.Launch),
                           launch_group :: !(P'.Maybe Protos.Offer.Operation.LaunchGroup),
                           reserve :: !(P'.Maybe Protos.Offer.Operation.Reserve),
                           unreserve :: !(P'.Maybe Protos.Offer.Operation.Unreserve),
                           create :: !(P'.Maybe Protos.Offer.Operation.Create),
                           destroy :: !(P'.Maybe Protos.Offer.Operation.Destroy),
                           grow_volume :: !(P'.Maybe Protos.Offer.Operation.GrowVolume),
                           shrink_volume :: !(P'.Maybe Protos.Offer.Operation.ShrinkVolume),
                           create_disk :: !(P'.Maybe Protos.Offer.Operation.CreateDisk),
                           destroy_disk :: !(P'.Maybe Protos.Offer.Operation.DestroyDisk)}
                 deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Operation where
  toJSON msg
   = P'.objectNoEmpty
      ([("type", P'.toJSON (Prelude'.fmap P'.toJSON (type' msg))), ("id", P'.toJSON (Prelude'.fmap P'.toJSON (id msg))),
        ("launch", P'.toJSON (Prelude'.fmap P'.toJSON (launch msg))),
        ("launch_group", P'.toJSON (Prelude'.fmap P'.toJSON (launch_group msg))),
        ("reserve", P'.toJSON (Prelude'.fmap P'.toJSON (reserve msg))),
        ("unreserve", P'.toJSON (Prelude'.fmap P'.toJSON (unreserve msg))),
        ("create", P'.toJSON (Prelude'.fmap P'.toJSON (create msg))),
        ("destroy", P'.toJSON (Prelude'.fmap P'.toJSON (destroy msg))),
        ("grow_volume", P'.toJSON (Prelude'.fmap P'.toJSON (grow_volume msg))),
        ("shrink_volume", P'.toJSON (Prelude'.fmap P'.toJSON (shrink_volume msg))),
        ("create_disk", P'.toJSON (Prelude'.fmap P'.toJSON (create_disk msg))),
        ("destroy_disk", P'.toJSON (Prelude'.fmap P'.toJSON (destroy_disk msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Operation where
  parseJSON
   = P'.withObject "Operation"
      (\ o ->
        do
          type' <- P'.explicitParseFieldMaybe P'.parseJSON o "type"
          id <- P'.explicitParseFieldMaybe P'.parseJSON o "id"
          launch <- P'.explicitParseFieldMaybe P'.parseJSON o "launch"
          launch_group <- P'.explicitParseFieldMaybe P'.parseJSON o "launch_group"
          reserve <- P'.explicitParseFieldMaybe P'.parseJSON o "reserve"
          unreserve <- P'.explicitParseFieldMaybe P'.parseJSON o "unreserve"
          create <- P'.explicitParseFieldMaybe P'.parseJSON o "create"
          destroy <- P'.explicitParseFieldMaybe P'.parseJSON o "destroy"
          grow_volume <- P'.explicitParseFieldMaybe P'.parseJSON o "grow_volume"
          shrink_volume <- P'.explicitParseFieldMaybe P'.parseJSON o "shrink_volume"
          create_disk <- P'.explicitParseFieldMaybe P'.parseJSON o "create_disk"
          destroy_disk <- P'.explicitParseFieldMaybe P'.parseJSON o "destroy_disk"
          Prelude'.return
           P'.defaultValue{type' = type', id = id, launch = launch, launch_group = launch_group, reserve = reserve,
                           unreserve = unreserve, create = create, destroy = destroy, grow_volume = grow_volume,
                           shrink_volume = shrink_volume, create_disk = create_disk, destroy_disk = destroy_disk})

instance P'.Mergeable Operation where
  mergeAppend (Operation x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   (Operation y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12)
   = Operation (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)

instance P'.Default Operation where
  defaultValue
   = Operation P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Operation where
  wireSize ft' self'@(Operation x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 11 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9
             + P'.wireSizeOpt 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11
             + P'.wireSizeOpt 2 11 x'12)
  wirePutWithSize ft' self'@(Operation x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 14 x'1, P'.wirePutOptWithSize 18 11 x'3, P'.wirePutOptWithSize 26 11 x'5,
             P'.wirePutOptWithSize 34 11 x'6, P'.wirePutOptWithSize 42 11 x'7, P'.wirePutOptWithSize 50 11 x'8,
             P'.wirePutOptWithSize 58 11 x'4, P'.wirePutOptWithSize 98 11 x'2, P'.wirePutOptWithSize 106 11 x'9,
             P'.wirePutOptWithSize 114 11 x'10, P'.wirePutOptWithSize 122 11 x'11, P'.wirePutOptWithSize 130 11 x'12]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             98 -> Prelude'.fmap (\ !new'Field -> old'Self{id = P'.mergeAppend (id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{launch = P'.mergeAppend (launch old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             58 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{launch_group = P'.mergeAppend (launch_group old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{reserve = P'.mergeAppend (reserve old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{unreserve = P'.mergeAppend (unreserve old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{create = P'.mergeAppend (create old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{destroy = P'.mergeAppend (destroy old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{grow_volume = P'.mergeAppend (grow_volume old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{shrink_volume = P'.mergeAppend (shrink_volume old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{create_disk = P'.mergeAppend (create_disk old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{destroy_disk = P'.mergeAppend (destroy_disk old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Operation) Operation where
  getVal m' f' = f' m'

instance P'.GPB Operation

instance P'.ReflectDescriptor Operation where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 26, 34, 42, 50, 58, 98, 106, 114, 122, 130])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\"], baseName = MName \"Operation\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Offer\",\"Operation.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.OperationID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"OperationID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.launch\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"launch\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.Launch\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Launch\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.launch_group\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"launch_group\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.LaunchGroup\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"LaunchGroup\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.reserve\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"reserve\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.Reserve\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Reserve\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.unreserve\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"unreserve\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.Unreserve\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Unreserve\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.create\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"create\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.Create\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Create\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.destroy\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"destroy\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.Destroy\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"Destroy\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.grow_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"grow_volume\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.GrowVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"GrowVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.shrink_volume\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"shrink_volume\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.ShrinkVolume\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"ShrinkVolume\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.create_disk\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"create_disk\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.CreateDisk\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"CreateDisk\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Offer.Operation.destroy_disk\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName' = FName \"destroy_disk\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Offer.Operation.DestroyDisk\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Offer\",MName \"Operation\"], baseName = MName \"DestroyDisk\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Operation where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Operation where
  textPut msg
   = do
       P'.tellT "type" (type' msg)
       P'.tellT "id" (id msg)
       P'.tellT "launch" (launch msg)
       P'.tellT "launch_group" (launch_group msg)
       P'.tellT "reserve" (reserve msg)
       P'.tellT "unreserve" (unreserve msg)
       P'.tellT "create" (create msg)
       P'.tellT "destroy" (destroy msg)
       P'.tellT "grow_volume" (grow_volume msg)
       P'.tellT "shrink_volume" (shrink_volume msg)
       P'.tellT "create_disk" (create_disk msg)
       P'.tellT "destroy_disk" (destroy_disk msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'type', parse'id, parse'launch, parse'launch_group, parse'reserve, parse'unreserve, parse'create,
                   parse'destroy, parse'grow_volume, parse'shrink_volume, parse'create_disk, parse'destroy_disk])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'id
         = P'.try
            (do
               v <- P'.getT "id"
               Prelude'.return (\ o -> o{id = v}))
        parse'launch
         = P'.try
            (do
               v <- P'.getT "launch"
               Prelude'.return (\ o -> o{launch = v}))
        parse'launch_group
         = P'.try
            (do
               v <- P'.getT "launch_group"
               Prelude'.return (\ o -> o{launch_group = v}))
        parse'reserve
         = P'.try
            (do
               v <- P'.getT "reserve"
               Prelude'.return (\ o -> o{reserve = v}))
        parse'unreserve
         = P'.try
            (do
               v <- P'.getT "unreserve"
               Prelude'.return (\ o -> o{unreserve = v}))
        parse'create
         = P'.try
            (do
               v <- P'.getT "create"
               Prelude'.return (\ o -> o{create = v}))
        parse'destroy
         = P'.try
            (do
               v <- P'.getT "destroy"
               Prelude'.return (\ o -> o{destroy = v}))
        parse'grow_volume
         = P'.try
            (do
               v <- P'.getT "grow_volume"
               Prelude'.return (\ o -> o{grow_volume = v}))
        parse'shrink_volume
         = P'.try
            (do
               v <- P'.getT "shrink_volume"
               Prelude'.return (\ o -> o{shrink_volume = v}))
        parse'create_disk
         = P'.try
            (do
               v <- P'.getT "create_disk"
               Prelude'.return (\ o -> o{create_disk = v}))
        parse'destroy_disk
         = P'.try
            (do
               v <- P'.getT "destroy_disk"
               Prelude'.return (\ o -> o{destroy_disk = v}))