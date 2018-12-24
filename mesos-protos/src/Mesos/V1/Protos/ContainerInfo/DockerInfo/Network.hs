{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ContainerInfo.DockerInfo.Network (Network(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Network = HOST
             | BRIDGE
             | NONE
             | USER
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                         Prelude'.Generic)

instance P'.Mergeable Network

instance Prelude'.Bounded Network where
  minBound = HOST
  maxBound = USER

instance P'.Default Network where
  defaultValue = HOST

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Network
toMaybe'Enum 1 = Prelude'.Just HOST
toMaybe'Enum 2 = Prelude'.Just BRIDGE
toMaybe'Enum 3 = Prelude'.Just NONE
toMaybe'Enum 4 = Prelude'.Just USER
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Network where
  fromEnum HOST = 1
  fromEnum BRIDGE = 2
  fromEnum NONE = 3
  fromEnum USER = 4
  toEnum
   = P'.fromMaybe
      (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.ContainerInfo.DockerInfo.Network")
      . toMaybe'Enum
  succ HOST = BRIDGE
  succ BRIDGE = NONE
  succ NONE = USER
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.ContainerInfo.DockerInfo.Network"
  pred BRIDGE = HOST
  pred NONE = BRIDGE
  pred USER = NONE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.ContainerInfo.DockerInfo.Network"

instance P'.Wire Network where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Network

instance P'.MessageAPI msg' (msg' -> Network) Network where
  getVal m' f' = f' m'

instance P'.ReflectEnum Network where
  reflectEnum = [(1, "HOST", HOST), (2, "BRIDGE", BRIDGE), (3, "NONE", NONE), (4, "USER", USER)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.ContainerInfo.DockerInfo.Network") ["Mesos", "V1"] ["Protos", "ContainerInfo", "DockerInfo"]
        "Network")
      ["Mesos", "V1", "Protos", "ContainerInfo", "DockerInfo", "Network.hs"]
      [(1, "HOST"), (2, "BRIDGE"), (3, "NONE"), (4, "USER")]
      Prelude'.True

instance P'.TextType Network where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Network where
  toJSON msg'
   = P'.String
      (case msg' of
         HOST -> "HOST"
         BRIDGE -> "BRIDGE"
         NONE -> "NONE"
         USER -> "USER")

instance P'.FromJSON Network where
  parseJSON
   = P'.withText "Mesos.V1.Protos.ContainerInfo.DockerInfo.Network.Network"
      (\ msg' ->
        case msg' of
          "HOST" -> Prelude'.return HOST
          "BRIDGE" -> Prelude'.return BRIDGE
          "NONE" -> Prelude'.return NONE
          "USER" -> Prelude'.return USER
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.ContainerInfo.DockerInfo.Network.Network"))