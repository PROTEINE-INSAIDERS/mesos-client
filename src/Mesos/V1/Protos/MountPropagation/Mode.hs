{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.MountPropagation.Mode (Mode(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Mode = UNKNOWN
          | HOST_TO_CONTAINER
          | BIDIRECTIONAL
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Mode

instance Prelude'.Bounded Mode where
  minBound = UNKNOWN
  maxBound = BIDIRECTIONAL

instance P'.Default Mode where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Mode
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just HOST_TO_CONTAINER
toMaybe'Enum 2 = Prelude'.Just BIDIRECTIONAL
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Mode where
  fromEnum UNKNOWN = 0
  fromEnum HOST_TO_CONTAINER = 1
  fromEnum BIDIRECTIONAL = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.MountPropagation.Mode") .
      toMaybe'Enum
  succ UNKNOWN = HOST_TO_CONTAINER
  succ HOST_TO_CONTAINER = BIDIRECTIONAL
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.MountPropagation.Mode"
  pred HOST_TO_CONTAINER = UNKNOWN
  pred BIDIRECTIONAL = HOST_TO_CONTAINER
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.MountPropagation.Mode"

instance P'.Wire Mode where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Mode

instance P'.MessageAPI msg' (msg' -> Mode) Mode where
  getVal m' f' = f' m'

instance P'.ReflectEnum Mode where
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "HOST_TO_CONTAINER", HOST_TO_CONTAINER), (2, "BIDIRECTIONAL", BIDIRECTIONAL)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.MountPropagation.Mode") ["Mesos", "V1"] ["Protos", "MountPropagation"] "Mode")
      ["Mesos", "V1", "Protos", "MountPropagation", "Mode.hs"]
      [(0, "UNKNOWN"), (1, "HOST_TO_CONTAINER"), (2, "BIDIRECTIONAL")]

instance P'.TextType Mode where
  tellT = P'.tellShow
  getT = P'.getRead