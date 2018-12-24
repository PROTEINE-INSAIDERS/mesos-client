{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Value.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = SCALAR
          | RANGES
          | SET
          | TEXT
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = SCALAR
  maxBound = TEXT

instance P'.Default Type where
  defaultValue = SCALAR

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just SCALAR
toMaybe'Enum 1 = Prelude'.Just RANGES
toMaybe'Enum 2 = Prelude'.Just SET
toMaybe'Enum 3 = Prelude'.Just TEXT
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum SCALAR = 0
  fromEnum RANGES = 1
  fromEnum SET = 2
  fromEnum TEXT = 3
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Value.Type") . toMaybe'Enum
  succ SCALAR = RANGES
  succ RANGES = SET
  succ SET = TEXT
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Value.Type"
  pred RANGES = SCALAR
  pred SET = RANGES
  pred TEXT = SET
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Value.Type"

instance P'.Wire Type where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Type

instance P'.MessageAPI msg' (msg' -> Type) Type where
  getVal m' f' = f' m'

instance P'.ReflectEnum Type where
  reflectEnum = [(0, "SCALAR", SCALAR), (1, "RANGES", RANGES), (2, "SET", SET), (3, "TEXT", TEXT)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.Value.Type") ["Mesos", "V1"] ["Protos", "Value"] "Type")
      ["Mesos", "V1", "Protos", "Value", "Type.hs"]
      [(0, "SCALAR"), (1, "RANGES"), (2, "SET"), (3, "TEXT")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         SCALAR -> "SCALAR"
         RANGES -> "RANGES"
         SET -> "SET"
         TEXT -> "TEXT")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.Value.Type.Type"
      (\ msg' ->
        case msg' of
          "SCALAR" -> Prelude'.return SCALAR
          "RANGES" -> Prelude'.return RANGES
          "SET" -> Prelude'.return SET
          "TEXT" -> Prelude'.return TEXT
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Protos.Value.Type.Type"))