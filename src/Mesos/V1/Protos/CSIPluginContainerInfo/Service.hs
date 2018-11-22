{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CSIPluginContainerInfo.Service (Service(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Service = UNKNOWN
             | CONTROLLER_SERVICE
             | NODE_SERVICE
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                         Prelude'.Generic)

instance P'.Mergeable Service

instance Prelude'.Bounded Service where
  minBound = UNKNOWN
  maxBound = NODE_SERVICE

instance P'.Default Service where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Service
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just CONTROLLER_SERVICE
toMaybe'Enum 2 = Prelude'.Just NODE_SERVICE
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Service where
  fromEnum UNKNOWN = 0
  fromEnum CONTROLLER_SERVICE = 1
  fromEnum NODE_SERVICE = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.CSIPluginContainerInfo.Service")
      . toMaybe'Enum
  succ UNKNOWN = CONTROLLER_SERVICE
  succ CONTROLLER_SERVICE = NODE_SERVICE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.CSIPluginContainerInfo.Service"
  pred CONTROLLER_SERVICE = UNKNOWN
  pred NODE_SERVICE = CONTROLLER_SERVICE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.CSIPluginContainerInfo.Service"

instance P'.Wire Service where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Service

instance P'.MessageAPI msg' (msg' -> Service) Service where
  getVal m' f' = f' m'

instance P'.ReflectEnum Service where
  reflectEnum = [(0, "UNKNOWN", UNKNOWN), (1, "CONTROLLER_SERVICE", CONTROLLER_SERVICE), (2, "NODE_SERVICE", NODE_SERVICE)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.CSIPluginContainerInfo.Service") ["Mesos", "V1"] ["Protos", "CSIPluginContainerInfo"]
        "Service")
      ["Mesos", "V1", "Protos", "CSIPluginContainerInfo", "Service.hs"]
      [(0, "UNKNOWN"), (1, "CONTROLLER_SERVICE"), (2, "NODE_SERVICE")]

instance P'.TextType Service where
  tellT = P'.tellShow
  getT = P'.getRead