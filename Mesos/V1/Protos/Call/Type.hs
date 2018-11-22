{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.Call.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | SUBSCRIBE
          | TEARDOWN
          | ACCEPT
          | DECLINE
          | ACCEPT_INVERSE_OFFERS
          | DECLINE_INVERSE_OFFERS
          | REVIVE
          | KILL
          | SHUTDOWN
          | ACKNOWLEDGE
          | ACKNOWLEDGE_OPERATION_STATUS
          | RECONCILE
          | RECONCILE_OPERATIONS
          | MESSAGE
          | REQUEST
          | SUPPRESS
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = SUPPRESS

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just SUBSCRIBE
toMaybe'Enum 2 = Prelude'.Just TEARDOWN
toMaybe'Enum 3 = Prelude'.Just ACCEPT
toMaybe'Enum 4 = Prelude'.Just DECLINE
toMaybe'Enum 13 = Prelude'.Just ACCEPT_INVERSE_OFFERS
toMaybe'Enum 14 = Prelude'.Just DECLINE_INVERSE_OFFERS
toMaybe'Enum 5 = Prelude'.Just REVIVE
toMaybe'Enum 6 = Prelude'.Just KILL
toMaybe'Enum 7 = Prelude'.Just SHUTDOWN
toMaybe'Enum 8 = Prelude'.Just ACKNOWLEDGE
toMaybe'Enum 15 = Prelude'.Just ACKNOWLEDGE_OPERATION_STATUS
toMaybe'Enum 9 = Prelude'.Just RECONCILE
toMaybe'Enum 16 = Prelude'.Just RECONCILE_OPERATIONS
toMaybe'Enum 10 = Prelude'.Just MESSAGE
toMaybe'Enum 11 = Prelude'.Just REQUEST
toMaybe'Enum 12 = Prelude'.Just SUPPRESS
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum SUBSCRIBE = 1
  fromEnum TEARDOWN = 2
  fromEnum ACCEPT = 3
  fromEnum DECLINE = 4
  fromEnum ACCEPT_INVERSE_OFFERS = 13
  fromEnum DECLINE_INVERSE_OFFERS = 14
  fromEnum REVIVE = 5
  fromEnum KILL = 6
  fromEnum SHUTDOWN = 7
  fromEnum ACKNOWLEDGE = 8
  fromEnum ACKNOWLEDGE_OPERATION_STATUS = 15
  fromEnum RECONCILE = 9
  fromEnum RECONCILE_OPERATIONS = 16
  fromEnum MESSAGE = 10
  fromEnum REQUEST = 11
  fromEnum SUPPRESS = 12
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.Call.Type") . toMaybe'Enum
  succ UNKNOWN = SUBSCRIBE
  succ SUBSCRIBE = TEARDOWN
  succ TEARDOWN = ACCEPT
  succ ACCEPT = DECLINE
  succ DECLINE = ACCEPT_INVERSE_OFFERS
  succ ACCEPT_INVERSE_OFFERS = DECLINE_INVERSE_OFFERS
  succ DECLINE_INVERSE_OFFERS = REVIVE
  succ REVIVE = KILL
  succ KILL = SHUTDOWN
  succ SHUTDOWN = ACKNOWLEDGE
  succ ACKNOWLEDGE = ACKNOWLEDGE_OPERATION_STATUS
  succ ACKNOWLEDGE_OPERATION_STATUS = RECONCILE
  succ RECONCILE = RECONCILE_OPERATIONS
  succ RECONCILE_OPERATIONS = MESSAGE
  succ MESSAGE = REQUEST
  succ REQUEST = SUPPRESS
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.Call.Type"
  pred SUBSCRIBE = UNKNOWN
  pred TEARDOWN = SUBSCRIBE
  pred ACCEPT = TEARDOWN
  pred DECLINE = ACCEPT
  pred ACCEPT_INVERSE_OFFERS = DECLINE
  pred DECLINE_INVERSE_OFFERS = ACCEPT_INVERSE_OFFERS
  pred REVIVE = DECLINE_INVERSE_OFFERS
  pred KILL = REVIVE
  pred SHUTDOWN = KILL
  pred ACKNOWLEDGE = SHUTDOWN
  pred ACKNOWLEDGE_OPERATION_STATUS = ACKNOWLEDGE
  pred RECONCILE = ACKNOWLEDGE_OPERATION_STATUS
  pred RECONCILE_OPERATIONS = RECONCILE
  pred MESSAGE = RECONCILE_OPERATIONS
  pred REQUEST = MESSAGE
  pred SUPPRESS = REQUEST
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.Call.Type"

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
  reflectEnum
   = [(0, "UNKNOWN", UNKNOWN), (1, "SUBSCRIBE", SUBSCRIBE), (2, "TEARDOWN", TEARDOWN), (3, "ACCEPT", ACCEPT),
      (4, "DECLINE", DECLINE), (13, "ACCEPT_INVERSE_OFFERS", ACCEPT_INVERSE_OFFERS),
      (14, "DECLINE_INVERSE_OFFERS", DECLINE_INVERSE_OFFERS), (5, "REVIVE", REVIVE), (6, "KILL", KILL), (7, "SHUTDOWN", SHUTDOWN),
      (8, "ACKNOWLEDGE", ACKNOWLEDGE), (15, "ACKNOWLEDGE_OPERATION_STATUS", ACKNOWLEDGE_OPERATION_STATUS),
      (9, "RECONCILE", RECONCILE), (16, "RECONCILE_OPERATIONS", RECONCILE_OPERATIONS), (10, "MESSAGE", MESSAGE),
      (11, "REQUEST", REQUEST), (12, "SUPPRESS", SUPPRESS)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.scheduler.Call.Type") ["Mesos", "V1"] ["Protos", "Call"] "Type")
      ["Mesos", "V1", "Protos", "Call", "Type.hs"]
      [(0, "UNKNOWN"), (1, "SUBSCRIBE"), (2, "TEARDOWN"), (3, "ACCEPT"), (4, "DECLINE"), (13, "ACCEPT_INVERSE_OFFERS"),
       (14, "DECLINE_INVERSE_OFFERS"), (5, "REVIVE"), (6, "KILL"), (7, "SHUTDOWN"), (8, "ACKNOWLEDGE"),
       (15, "ACKNOWLEDGE_OPERATION_STATUS"), (9, "RECONCILE"), (16, "RECONCILE_OPERATIONS"), (10, "MESSAGE"), (11, "REQUEST"),
       (12, "SUPPRESS")]

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead