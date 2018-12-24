{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.MachineInfo.Mode (Mode(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Mode = UP
          | DRAINING
          | DOWN
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Mode

instance Prelude'.Bounded Mode where
  minBound = UP
  maxBound = DOWN

instance P'.Default Mode where
  defaultValue = UP

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Mode
toMaybe'Enum 1 = Prelude'.Just UP
toMaybe'Enum 2 = Prelude'.Just DRAINING
toMaybe'Enum 3 = Prelude'.Just DOWN
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Mode where
  fromEnum UP = 1
  fromEnum DRAINING = 2
  fromEnum DOWN = 3
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.MachineInfo.Mode") . toMaybe'Enum
  succ UP = DRAINING
  succ DRAINING = DOWN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.MachineInfo.Mode"
  pred DRAINING = UP
  pred DOWN = DRAINING
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.MachineInfo.Mode"

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
  reflectEnum = [(1, "UP", UP), (2, "DRAINING", DRAINING), (3, "DOWN", DOWN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.MachineInfo.Mode") ["Mesos", "V1"] ["Protos", "MachineInfo"] "Mode")
      ["Mesos", "V1", "Protos", "MachineInfo", "Mode.hs"]
      [(1, "UP"), (2, "DRAINING"), (3, "DOWN")]
      Prelude'.True

instance P'.TextType Mode where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Mode where
  toJSON msg'
   = P'.String
      (case msg' of
         UP -> "UP"
         DRAINING -> "DRAINING"
         DOWN -> "DOWN")

instance P'.FromJSON Mode where
  parseJSON
   = P'.withText "Mesos.V1.Protos.MachineInfo.Mode.Mode"
      (\ msg' ->
        case msg' of
          "UP" -> Prelude'.return UP
          "DRAINING" -> Prelude'.return DRAINING
          "DOWN" -> Prelude'.return DOWN
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Protos.MachineInfo.Mode.Mode"))