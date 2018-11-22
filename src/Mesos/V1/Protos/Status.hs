{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Status (Status(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Status = DRIVER_NOT_STARTED
            | DRIVER_RUNNING
            | DRIVER_ABORTED
            | DRIVER_STOPPED
              deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Status

instance Prelude'.Bounded Status where
  minBound = DRIVER_NOT_STARTED
  maxBound = DRIVER_STOPPED

instance P'.Default Status where
  defaultValue = DRIVER_NOT_STARTED

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Status
toMaybe'Enum 1 = Prelude'.Just DRIVER_NOT_STARTED
toMaybe'Enum 2 = Prelude'.Just DRIVER_RUNNING
toMaybe'Enum 3 = Prelude'.Just DRIVER_ABORTED
toMaybe'Enum 4 = Prelude'.Just DRIVER_STOPPED
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Status where
  fromEnum DRIVER_NOT_STARTED = 1
  fromEnum DRIVER_RUNNING = 2
  fromEnum DRIVER_ABORTED = 3
  fromEnum DRIVER_STOPPED = 4
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Status") . toMaybe'Enum
  succ DRIVER_NOT_STARTED = DRIVER_RUNNING
  succ DRIVER_RUNNING = DRIVER_ABORTED
  succ DRIVER_ABORTED = DRIVER_STOPPED
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Status"
  pred DRIVER_RUNNING = DRIVER_NOT_STARTED
  pred DRIVER_ABORTED = DRIVER_RUNNING
  pred DRIVER_STOPPED = DRIVER_ABORTED
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Status"

instance P'.Wire Status where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Status

instance P'.MessageAPI msg' (msg' -> Status) Status where
  getVal m' f' = f' m'

instance P'.ReflectEnum Status where
  reflectEnum
   = [(1, "DRIVER_NOT_STARTED", DRIVER_NOT_STARTED), (2, "DRIVER_RUNNING", DRIVER_RUNNING), (3, "DRIVER_ABORTED", DRIVER_ABORTED),
      (4, "DRIVER_STOPPED", DRIVER_STOPPED)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.Status") ["Mesos", "V1"] ["Protos"] "Status")
      ["Mesos", "V1", "Protos", "Status.hs"]
      [(1, "DRIVER_NOT_STARTED"), (2, "DRIVER_RUNNING"), (3, "DRIVER_ABORTED"), (4, "DRIVER_STOPPED")]

instance P'.TextType Status where
  tellT = P'.tellShow
  getT = P'.getRead