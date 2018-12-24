{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Scheduler.Protos.Event.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | SUBSCRIBED
          | OFFERS
          | INVERSE_OFFERS
          | RESCIND
          | RESCIND_INVERSE_OFFER
          | UPDATE
          | UPDATE_OPERATION_STATUS
          | MESSAGE
          | FAILURE
          | ERROR
          | HEARTBEAT
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = HEARTBEAT

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just SUBSCRIBED
toMaybe'Enum 2 = Prelude'.Just OFFERS
toMaybe'Enum 9 = Prelude'.Just INVERSE_OFFERS
toMaybe'Enum 3 = Prelude'.Just RESCIND
toMaybe'Enum 10 = Prelude'.Just RESCIND_INVERSE_OFFER
toMaybe'Enum 4 = Prelude'.Just UPDATE
toMaybe'Enum 11 = Prelude'.Just UPDATE_OPERATION_STATUS
toMaybe'Enum 5 = Prelude'.Just MESSAGE
toMaybe'Enum 6 = Prelude'.Just FAILURE
toMaybe'Enum 7 = Prelude'.Just ERROR
toMaybe'Enum 8 = Prelude'.Just HEARTBEAT
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum SUBSCRIBED = 1
  fromEnum OFFERS = 2
  fromEnum INVERSE_OFFERS = 9
  fromEnum RESCIND = 3
  fromEnum RESCIND_INVERSE_OFFER = 10
  fromEnum UPDATE = 4
  fromEnum UPDATE_OPERATION_STATUS = 11
  fromEnum MESSAGE = 5
  fromEnum FAILURE = 6
  fromEnum ERROR = 7
  fromEnum HEARTBEAT = 8
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Scheduler.Protos.Event.Type") .
      toMaybe'Enum
  succ UNKNOWN = SUBSCRIBED
  succ SUBSCRIBED = OFFERS
  succ OFFERS = INVERSE_OFFERS
  succ INVERSE_OFFERS = RESCIND
  succ RESCIND = RESCIND_INVERSE_OFFER
  succ RESCIND_INVERSE_OFFER = UPDATE
  succ UPDATE = UPDATE_OPERATION_STATUS
  succ UPDATE_OPERATION_STATUS = MESSAGE
  succ MESSAGE = FAILURE
  succ FAILURE = ERROR
  succ ERROR = HEARTBEAT
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Scheduler.Protos.Event.Type"
  pred SUBSCRIBED = UNKNOWN
  pred OFFERS = SUBSCRIBED
  pred INVERSE_OFFERS = OFFERS
  pred RESCIND = INVERSE_OFFERS
  pred RESCIND_INVERSE_OFFER = RESCIND
  pred UPDATE = RESCIND_INVERSE_OFFER
  pred UPDATE_OPERATION_STATUS = UPDATE
  pred MESSAGE = UPDATE_OPERATION_STATUS
  pred FAILURE = MESSAGE
  pred ERROR = FAILURE
  pred HEARTBEAT = ERROR
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Scheduler.Protos.Event.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "SUBSCRIBED", SUBSCRIBED), (2, "OFFERS", OFFERS), (9, "INVERSE_OFFERS", INVERSE_OFFERS),
      (3, "RESCIND", RESCIND), (10, "RESCIND_INVERSE_OFFER", RESCIND_INVERSE_OFFER), (4, "UPDATE", UPDATE),
      (11, "UPDATE_OPERATION_STATUS", UPDATE_OPERATION_STATUS), (5, "MESSAGE", MESSAGE), (6, "FAILURE", FAILURE),
      (7, "ERROR", ERROR), (8, "HEARTBEAT", HEARTBEAT)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.scheduler.Event.Type") ["Mesos", "V1", "Scheduler"] ["Protos", "Event"] "Type")
      ["Mesos", "V1", "Scheduler", "Protos", "Event", "Type.hs"]
      [(0, "UNKNOWN"), (1, "SUBSCRIBED"), (2, "OFFERS"), (9, "INVERSE_OFFERS"), (3, "RESCIND"), (10, "RESCIND_INVERSE_OFFER"),
       (4, "UPDATE"), (11, "UPDATE_OPERATION_STATUS"), (5, "MESSAGE"), (6, "FAILURE"), (7, "ERROR"), (8, "HEARTBEAT")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         SUBSCRIBED -> "SUBSCRIBED"
         OFFERS -> "OFFERS"
         INVERSE_OFFERS -> "INVERSE_OFFERS"
         RESCIND -> "RESCIND"
         RESCIND_INVERSE_OFFER -> "RESCIND_INVERSE_OFFER"
         UPDATE -> "UPDATE"
         UPDATE_OPERATION_STATUS -> "UPDATE_OPERATION_STATUS"
         MESSAGE -> "MESSAGE"
         FAILURE -> "FAILURE"
         ERROR -> "ERROR"
         HEARTBEAT -> "HEARTBEAT")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Scheduler.Protos.Event.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "SUBSCRIBED" -> Prelude'.return SUBSCRIBED
          "OFFERS" -> Prelude'.return OFFERS
          "INVERSE_OFFERS" -> Prelude'.return INVERSE_OFFERS
          "RESCIND" -> Prelude'.return RESCIND
          "RESCIND_INVERSE_OFFER" -> Prelude'.return RESCIND_INVERSE_OFFER
          "UPDATE" -> Prelude'.return UPDATE
          "UPDATE_OPERATION_STATUS" -> Prelude'.return UPDATE_OPERATION_STATUS
          "MESSAGE" -> Prelude'.return MESSAGE
          "FAILURE" -> Prelude'.return FAILURE
          "ERROR" -> Prelude'.return ERROR
          "HEARTBEAT" -> Prelude'.return HEARTBEAT
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++ " for enum Mesos.V1.Scheduler.Protos.Event.Type.Type"))