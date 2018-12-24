{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CgroupInfo.Blkio.Operation (Operation(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Operation = UNKNOWN
               | TOTAL
               | READ
               | WRITE
               | SYNC
               | ASYNC
               | DISCARD
                 deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                           Prelude'.Generic)

instance P'.Mergeable Operation

instance Prelude'.Bounded Operation where
  minBound = UNKNOWN
  maxBound = DISCARD

instance P'.Default Operation where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Operation
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just TOTAL
toMaybe'Enum 2 = Prelude'.Just READ
toMaybe'Enum 3 = Prelude'.Just WRITE
toMaybe'Enum 4 = Prelude'.Just SYNC
toMaybe'Enum 5 = Prelude'.Just ASYNC
toMaybe'Enum 6 = Prelude'.Just DISCARD
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Operation where
  fromEnum UNKNOWN = 0
  fromEnum TOTAL = 1
  fromEnum READ = 2
  fromEnum WRITE = 3
  fromEnum SYNC = 4
  fromEnum ASYNC = 5
  fromEnum DISCARD = 6
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.CgroupInfo.Blkio.Operation") .
      toMaybe'Enum
  succ UNKNOWN = TOTAL
  succ TOTAL = READ
  succ READ = WRITE
  succ WRITE = SYNC
  succ SYNC = ASYNC
  succ ASYNC = DISCARD
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.CgroupInfo.Blkio.Operation"
  pred TOTAL = UNKNOWN
  pred READ = TOTAL
  pred WRITE = READ
  pred SYNC = WRITE
  pred ASYNC = SYNC
  pred DISCARD = ASYNC
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.CgroupInfo.Blkio.Operation"

instance P'.Wire Operation where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Operation

instance P'.MessageAPI msg' (msg' -> Operation) Operation where
  getVal m' f' = f' m'

instance P'.ReflectEnum Operation where
  reflectEnum
   = [(0, "UNKNOWN", UNKNOWN), (1, "TOTAL", TOTAL), (2, "READ", READ), (3, "WRITE", WRITE), (4, "SYNC", SYNC), (5, "ASYNC", ASYNC),
      (6, "DISCARD", DISCARD)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.CgroupInfo.Blkio.Operation") ["Mesos", "V1"] ["Protos", "CgroupInfo", "Blkio"] "Operation")
      ["Mesos", "V1", "Protos", "CgroupInfo", "Blkio", "Operation.hs"]
      [(0, "UNKNOWN"), (1, "TOTAL"), (2, "READ"), (3, "WRITE"), (4, "SYNC"), (5, "ASYNC"), (6, "DISCARD")]
      Prelude'.True

instance P'.TextType Operation where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Operation where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         TOTAL -> "TOTAL"
         READ -> "READ"
         WRITE -> "WRITE"
         SYNC -> "SYNC"
         ASYNC -> "ASYNC"
         DISCARD -> "DISCARD")

instance P'.FromJSON Operation where
  parseJSON
   = P'.withText "Mesos.V1.Protos.CgroupInfo.Blkio.Operation.Operation"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "TOTAL" -> Prelude'.return TOTAL
          "READ" -> Prelude'.return READ
          "WRITE" -> Prelude'.return WRITE
          "SYNC" -> Prelude'.return SYNC
          "ASYNC" -> Prelude'.return ASYNC
          "DISCARD" -> Prelude'.return DISCARD
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.CgroupInfo.Blkio.Operation.Operation"))