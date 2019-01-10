{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Resource (Resource(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Mesos.V1.Protos.Resource.AllocationInfo as Protos.Resource (AllocationInfo)
import qualified Mesos.V1.Protos.Resource.DiskInfo as Protos.Resource (DiskInfo)
import qualified Mesos.V1.Protos.Resource.ReservationInfo as Protos.Resource (ReservationInfo)
import qualified Mesos.V1.Protos.Resource.RevocableInfo as Protos.Resource (RevocableInfo)
import qualified Mesos.V1.Protos.Resource.SharedInfo as Protos.Resource (SharedInfo)
import qualified Mesos.V1.Protos.ResourceProviderID as Protos (ResourceProviderID)
import qualified Mesos.V1.Protos.Value.Ranges as Protos.Value (Ranges)
import qualified Mesos.V1.Protos.Value.Scalar as Protos.Value (Scalar)
import qualified Mesos.V1.Protos.Value.Set as Protos.Value (Set)
import qualified Mesos.V1.Protos.Value.Type as Protos.Value (Type)

data Resource = Resource{provider_id :: !(P'.Maybe Protos.ResourceProviderID), name :: !(P'.Utf8), type' :: !(Protos.Value.Type),
                         scalar :: !(P'.Maybe Protos.Value.Scalar), ranges :: !(P'.Maybe Protos.Value.Ranges),
                         set :: !(P'.Maybe Protos.Value.Set), role :: !(P'.Maybe P'.Utf8),
                         allocation_info :: !(P'.Maybe Protos.Resource.AllocationInfo),
                         reservation :: !(P'.Maybe Protos.Resource.ReservationInfo),
                         reservations :: !(P'.Seq Protos.Resource.ReservationInfo), disk :: !(P'.Maybe Protos.Resource.DiskInfo),
                         revocable :: !(P'.Maybe Protos.Resource.RevocableInfo), shared :: !(P'.Maybe Protos.Resource.SharedInfo)}
                deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ToJSON Resource where
  toJSON msg
   = P'.objectNoEmpty
      ([("provider_id", P'.toJSON (Prelude'.fmap P'.toJSON (provider_id msg))), ("name", P'.toJSON (name msg)),
        ("type", P'.toJSON (type' msg)), ("scalar", P'.toJSON (Prelude'.fmap P'.toJSON (scalar msg))),
        ("ranges", P'.toJSON (Prelude'.fmap P'.toJSON (ranges msg))), ("set", P'.toJSON (Prelude'.fmap P'.toJSON (set msg))),
        ("role", P'.toJSON (Prelude'.fmap P'.toJSON (role msg))),
        ("allocation_info", P'.toJSON (Prelude'.fmap P'.toJSON (allocation_info msg))),
        ("reservation", P'.toJSON (Prelude'.fmap P'.toJSON (reservation msg))),
        ("reservations", P'.toJSON (Prelude'.fmap P'.toJSON (reservations msg))),
        ("disk", P'.toJSON (Prelude'.fmap P'.toJSON (disk msg))),
        ("revocable", P'.toJSON (Prelude'.fmap P'.toJSON (revocable msg))),
        ("shared", P'.toJSON (Prelude'.fmap P'.toJSON (shared msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON Resource where
  parseJSON
   = P'.withObject "Resource"
      (\ o ->
        do
          provider_id <- P'.explicitParseFieldMaybe P'.parseJSON o "provider_id"
          name <- P'.explicitParseField P'.parseJSON o "name"
          type' <- P'.explicitParseField P'.parseJSON o "type"
          scalar <- P'.explicitParseFieldMaybe P'.parseJSON o "scalar"
          ranges <- P'.explicitParseFieldMaybe P'.parseJSON o "ranges"
          set <- P'.explicitParseFieldMaybe P'.parseJSON o "set"
          role <- do
                    tmp <- P'.explicitParseFieldMaybe P'.parseJSON o "role"
                    Prelude'.return (Prelude'.maybe (Prelude'.Just ((P'.Utf8 (P'.pack "*")))) Prelude'.Just tmp)
          allocation_info <- P'.explicitParseFieldMaybe P'.parseJSON o "allocation_info"
          reservation <- P'.explicitParseFieldMaybe P'.parseJSON o "reservation"
          reservations <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                           (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "reservations")
          disk <- P'.explicitParseFieldMaybe P'.parseJSON o "disk"
          revocable <- P'.explicitParseFieldMaybe P'.parseJSON o "revocable"
          shared <- P'.explicitParseFieldMaybe P'.parseJSON o "shared"
          Prelude'.return
           P'.defaultValue{provider_id = provider_id, name = name, type' = type', scalar = scalar, ranges = ranges, set = set,
                           role = role, allocation_info = allocation_info, reservation = reservation, reservations = reservations,
                           disk = disk, revocable = revocable, shared = shared})

instance P'.Mergeable Resource where
  mergeAppend (Resource x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13)
   (Resource y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13)
   = Resource (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)

instance P'.Default Resource where
  defaultValue
   = Resource P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      (Prelude'.Just (P'.Utf8 (P'.pack "*")))
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire Resource where
  wireSize ft' self'@(Resource x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeReq 1 9 x'2 + P'.wireSizeReq 1 14 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 11 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 9 x'7
             + P'.wireSizeOpt 1 11 x'8
             + P'.wireSizeOpt 1 11 x'9
             + P'.wireSizeRep 1 11 x'10
             + P'.wireSizeOpt 1 11 x'11
             + P'.wireSizeOpt 1 11 x'12
             + P'.wireSizeOpt 1 11 x'13)
  wirePutWithSize ft' self'@(Resource x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 10 9 x'2, P'.wirePutReqWithSize 16 14 x'3, P'.wirePutOptWithSize 26 11 x'4,
             P'.wirePutOptWithSize 34 11 x'5, P'.wirePutOptWithSize 42 11 x'6, P'.wirePutOptWithSize 50 9 x'7,
             P'.wirePutOptWithSize 58 11 x'11, P'.wirePutOptWithSize 66 11 x'9, P'.wirePutOptWithSize 74 11 x'12,
             P'.wirePutOptWithSize 82 11 x'13, P'.wirePutOptWithSize 90 11 x'8, P'.wirePutOptWithSize 98 11 x'1,
             P'.wirePutRepWithSize 106 11 x'10]
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
             98 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{provider_id = P'.mergeAppend (provider_id old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = new'Field}) (P'.wireGet 9)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = new'Field}) (P'.wireGet 14)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{scalar = P'.mergeAppend (scalar old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{ranges = P'.mergeAppend (ranges old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{set = P'.mergeAppend (set old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{role = Prelude'.Just new'Field}) (P'.wireGet 9)
             90 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{allocation_info = P'.mergeAppend (allocation_info old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{reservation = P'.mergeAppend (reservation old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             106 -> Prelude'.fmap (\ !new'Field -> old'Self{reservations = P'.append (reservations old'Self) new'Field})
                     (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{disk = P'.mergeAppend (disk old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{revocable = P'.mergeAppend (revocable old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             82 -> Prelude'.fmap (\ !new'Field -> old'Self{shared = P'.mergeAppend (shared old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> Resource) Resource where
  getVal m' f' = f' m'

instance P'.GPB Resource

instance P'.ReflectDescriptor Resource where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [10, 16])
      (P'.fromDistinctAscList [10, 16, 26, 34, 42, 50, 58, 66, 74, 82, 90, 98, 106])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.Resource\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"Resource\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"Resource.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.provider_id\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"provider_id\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.ResourceProviderID\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ResourceProviderID\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.name\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"name\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.type\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"type'\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Value.Type\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Type\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.scalar\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"scalar\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Value.Scalar\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Scalar\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.ranges\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"ranges\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Value.Ranges\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Ranges\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.set\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"set\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Value.Set\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Value\"], baseName = MName \"Set\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.role\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"role\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"*\", hsDefault = Just (HsDef'ByteString \"*\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.allocation_info\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"allocation_info\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.AllocationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"AllocationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.reservation\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"reservation\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.ReservationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"ReservationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.reservations\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"reservations\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.ReservationInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"ReservationInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.disk\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"disk\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.DiskInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"DiskInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.revocable\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"revocable\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.RevocableInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"RevocableInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.Resource.shared\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"Resource\"], baseName' = FName \"shared\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.Resource.SharedInfo\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"Resource\"], baseName = MName \"SharedInfo\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = False, jsonInstances = True}"

instance P'.TextType Resource where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg Resource where
  textPut msg
   = do
       P'.tellT "provider_id" (provider_id msg)
       P'.tellT "name" (name msg)
       P'.tellT "type" (type' msg)
       P'.tellT "scalar" (scalar msg)
       P'.tellT "ranges" (ranges msg)
       P'.tellT "set" (set msg)
       P'.tellT "role" (role msg)
       P'.tellT "allocation_info" (allocation_info msg)
       P'.tellT "reservation" (reservation msg)
       P'.tellT "reservations" (reservations msg)
       P'.tellT "disk" (disk msg)
       P'.tellT "revocable" (revocable msg)
       P'.tellT "shared" (shared msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'provider_id, parse'name, parse'type', parse'scalar, parse'ranges, parse'set, parse'role,
                   parse'allocation_info, parse'reservation, parse'reservations, parse'disk, parse'revocable, parse'shared])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'provider_id
         = P'.try
            (do
               v <- P'.getT "provider_id"
               Prelude'.return (\ o -> o{provider_id = v}))
        parse'name
         = P'.try
            (do
               v <- P'.getT "name"
               Prelude'.return (\ o -> o{name = v}))
        parse'type'
         = P'.try
            (do
               v <- P'.getT "type"
               Prelude'.return (\ o -> o{type' = v}))
        parse'scalar
         = P'.try
            (do
               v <- P'.getT "scalar"
               Prelude'.return (\ o -> o{scalar = v}))
        parse'ranges
         = P'.try
            (do
               v <- P'.getT "ranges"
               Prelude'.return (\ o -> o{ranges = v}))
        parse'set
         = P'.try
            (do
               v <- P'.getT "set"
               Prelude'.return (\ o -> o{set = v}))
        parse'role
         = P'.try
            (do
               v <- P'.getT "role"
               Prelude'.return (\ o -> o{role = v}))
        parse'allocation_info
         = P'.try
            (do
               v <- P'.getT "allocation_info"
               Prelude'.return (\ o -> o{allocation_info = v}))
        parse'reservation
         = P'.try
            (do
               v <- P'.getT "reservation"
               Prelude'.return (\ o -> o{reservation = v}))
        parse'reservations
         = P'.try
            (do
               v <- P'.getT "reservations"
               Prelude'.return (\ o -> o{reservations = P'.append (reservations o) v}))
        parse'disk
         = P'.try
            (do
               v <- P'.getT "disk"
               Prelude'.return (\ o -> o{disk = v}))
        parse'revocable
         = P'.try
            (do
               v <- P'.getT "revocable"
               Prelude'.return (\ o -> o{revocable = v}))
        parse'shared
         = P'.try
            (do
               v <- P'.getT "shared"
               Prelude'.return (\ o -> o{shared = v}))