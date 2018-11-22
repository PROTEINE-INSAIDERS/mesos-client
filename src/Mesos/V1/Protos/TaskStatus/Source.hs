{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.TaskStatus.Source (Source(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Source = SOURCE_MASTER
            | SOURCE_AGENT
            | SOURCE_EXECUTOR
              deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Source

instance Prelude'.Bounded Source where
  minBound = SOURCE_MASTER
  maxBound = SOURCE_EXECUTOR

instance P'.Default Source where
  defaultValue = SOURCE_MASTER

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Source
toMaybe'Enum 0 = Prelude'.Just SOURCE_MASTER
toMaybe'Enum 1 = Prelude'.Just SOURCE_AGENT
toMaybe'Enum 2 = Prelude'.Just SOURCE_EXECUTOR
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Source where
  fromEnum SOURCE_MASTER = 0
  fromEnum SOURCE_AGENT = 1
  fromEnum SOURCE_EXECUTOR = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.TaskStatus.Source") .
      toMaybe'Enum
  succ SOURCE_MASTER = SOURCE_AGENT
  succ SOURCE_AGENT = SOURCE_EXECUTOR
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.TaskStatus.Source"
  pred SOURCE_AGENT = SOURCE_MASTER
  pred SOURCE_EXECUTOR = SOURCE_AGENT
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.TaskStatus.Source"

instance P'.Wire Source where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Source

instance P'.MessageAPI msg' (msg' -> Source) Source where
  getVal m' f' = f' m'

instance P'.ReflectEnum Source where
  reflectEnum = [(0, "SOURCE_MASTER", SOURCE_MASTER), (1, "SOURCE_AGENT", SOURCE_AGENT), (2, "SOURCE_EXECUTOR", SOURCE_EXECUTOR)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.TaskStatus.Source") ["Mesos", "V1"] ["Protos", "TaskStatus"] "Source")
      ["Mesos", "V1", "Protos", "TaskStatus", "Source.hs"]
      [(0, "SOURCE_MASTER"), (1, "SOURCE_AGENT"), (2, "SOURCE_EXECUTOR")]

instance P'.TextType Source where
  tellT = P'.tellShow
  getT = P'.getRead