{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Volume.Mode (Mode(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Mode = RW
          | RO
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Mode

instance Prelude'.Bounded Mode where
  minBound = RW
  maxBound = RO

instance P'.Default Mode where
  defaultValue = RW

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Mode
toMaybe'Enum 1 = Prelude'.Just RW
toMaybe'Enum 2 = Prelude'.Just RO
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Mode where
  fromEnum RW = 1
  fromEnum RO = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Volume.Mode") . toMaybe'Enum
  succ RW = RO
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Volume.Mode"
  pred RO = RW
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Volume.Mode"

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
  reflectEnum = [(1, "RW", RW), (2, "RO", RO)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.Volume.Mode") ["Mesos", "V1"] ["Protos", "Volume"] "Mode")
      ["Mesos", "V1", "Protos", "Volume", "Mode.hs"]
      [(1, "RW"), (2, "RO")]

instance P'.TextType Mode where
  tellT = P'.tellShow
  getT = P'.getRead