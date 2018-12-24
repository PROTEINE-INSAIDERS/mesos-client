{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.NetworkInfo.Protocol (Protocol(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Protocol = IPv4
              | IPv6
                deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                          Prelude'.Generic)

instance P'.Mergeable Protocol

instance Prelude'.Bounded Protocol where
  minBound = IPv4
  maxBound = IPv6

instance P'.Default Protocol where
  defaultValue = IPv4

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Protocol
toMaybe'Enum 1 = Prelude'.Just IPv4
toMaybe'Enum 2 = Prelude'.Just IPv6
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Protocol where
  fromEnum IPv4 = 1
  fromEnum IPv6 = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.NetworkInfo.Protocol") .
      toMaybe'Enum
  succ IPv4 = IPv6
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.NetworkInfo.Protocol"
  pred IPv6 = IPv4
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.NetworkInfo.Protocol"

instance P'.Wire Protocol where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Protocol

instance P'.MessageAPI msg' (msg' -> Protocol) Protocol where
  getVal m' f' = f' m'

instance P'.ReflectEnum Protocol where
  reflectEnum = [(1, "IPv4", IPv4), (2, "IPv6", IPv6)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.NetworkInfo.Protocol") ["Mesos", "V1"] ["Protos", "NetworkInfo"] "Protocol")
      ["Mesos", "V1", "Protos", "NetworkInfo", "Protocol.hs"]
      [(1, "IPv4"), (2, "IPv6")]
      Prelude'.True

instance P'.TextType Protocol where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Protocol where
  toJSON msg'
   = P'.String
      (case msg' of
         IPv4 -> "IPv4"
         IPv6 -> "IPv6")

instance P'.FromJSON Protocol where
  parseJSON
   = P'.withText "Mesos.V1.Protos.NetworkInfo.Protocol.Protocol"
      (\ msg' ->
        case msg' of
          "IPv4" -> Prelude'.return IPv4
          "IPv6" -> Prelude'.return IPv6
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.NetworkInfo.Protocol.Protocol"))