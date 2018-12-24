{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ExecutorInfo.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | DEFAULT
          | CUSTOM
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = CUSTOM

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just DEFAULT
toMaybe'Enum 2 = Prelude'.Just CUSTOM
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum DEFAULT = 1
  fromEnum CUSTOM = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.ExecutorInfo.Type") .
      toMaybe'Enum
  succ UNKNOWN = DEFAULT
  succ DEFAULT = CUSTOM
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.ExecutorInfo.Type"
  pred DEFAULT = UNKNOWN
  pred CUSTOM = DEFAULT
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.ExecutorInfo.Type"

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
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "DEFAULT", DEFAULT), (2, "CUSTOM", CUSTOM)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.ExecutorInfo.Type") ["Mesos", "V1"] ["Protos", "ExecutorInfo"] "Type")
      ["Mesos", "V1", "Protos", "ExecutorInfo", "Type.hs"]
      [(0, "UNKNOWN"), (1, "DEFAULT"), (2, "CUSTOM")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         DEFAULT -> "DEFAULT"
         CUSTOM -> "CUSTOM")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.ExecutorInfo.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "DEFAULT" -> Prelude'.return DEFAULT
          "CUSTOM" -> Prelude'.return CUSTOM
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Protos.ExecutorInfo.Type.Type"))