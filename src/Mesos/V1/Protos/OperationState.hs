{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.OperationState (OperationState(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data OperationState = OPERATION_UNSUPPORTED
                    | OPERATION_PENDING
                    | OPERATION_FINISHED
                    | OPERATION_FAILED
                    | OPERATION_ERROR
                    | OPERATION_DROPPED
                    | OPERATION_UNREACHABLE
                    | OPERATION_GONE_BY_OPERATOR
                    | OPERATION_RECOVERING
                    | OPERATION_UNKNOWN
                      deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                                Prelude'.Generic)

instance P'.Mergeable OperationState

instance Prelude'.Bounded OperationState where
  minBound = OPERATION_UNSUPPORTED
  maxBound = OPERATION_UNKNOWN

instance P'.Default OperationState where
  defaultValue = OPERATION_UNSUPPORTED

toMaybe'Enum :: Prelude'.Int -> P'.Maybe OperationState
toMaybe'Enum 0 = Prelude'.Just OPERATION_UNSUPPORTED
toMaybe'Enum 1 = Prelude'.Just OPERATION_PENDING
toMaybe'Enum 2 = Prelude'.Just OPERATION_FINISHED
toMaybe'Enum 3 = Prelude'.Just OPERATION_FAILED
toMaybe'Enum 4 = Prelude'.Just OPERATION_ERROR
toMaybe'Enum 5 = Prelude'.Just OPERATION_DROPPED
toMaybe'Enum 6 = Prelude'.Just OPERATION_UNREACHABLE
toMaybe'Enum 7 = Prelude'.Just OPERATION_GONE_BY_OPERATOR
toMaybe'Enum 8 = Prelude'.Just OPERATION_RECOVERING
toMaybe'Enum 9 = Prelude'.Just OPERATION_UNKNOWN
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum OperationState where
  fromEnum OPERATION_UNSUPPORTED = 0
  fromEnum OPERATION_PENDING = 1
  fromEnum OPERATION_FINISHED = 2
  fromEnum OPERATION_FAILED = 3
  fromEnum OPERATION_ERROR = 4
  fromEnum OPERATION_DROPPED = 5
  fromEnum OPERATION_UNREACHABLE = 6
  fromEnum OPERATION_GONE_BY_OPERATOR = 7
  fromEnum OPERATION_RECOVERING = 8
  fromEnum OPERATION_UNKNOWN = 9
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.OperationState") . toMaybe'Enum
  succ OPERATION_UNSUPPORTED = OPERATION_PENDING
  succ OPERATION_PENDING = OPERATION_FINISHED
  succ OPERATION_FINISHED = OPERATION_FAILED
  succ OPERATION_FAILED = OPERATION_ERROR
  succ OPERATION_ERROR = OPERATION_DROPPED
  succ OPERATION_DROPPED = OPERATION_UNREACHABLE
  succ OPERATION_UNREACHABLE = OPERATION_GONE_BY_OPERATOR
  succ OPERATION_GONE_BY_OPERATOR = OPERATION_RECOVERING
  succ OPERATION_RECOVERING = OPERATION_UNKNOWN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.OperationState"
  pred OPERATION_PENDING = OPERATION_UNSUPPORTED
  pred OPERATION_FINISHED = OPERATION_PENDING
  pred OPERATION_FAILED = OPERATION_FINISHED
  pred OPERATION_ERROR = OPERATION_FAILED
  pred OPERATION_DROPPED = OPERATION_ERROR
  pred OPERATION_UNREACHABLE = OPERATION_DROPPED
  pred OPERATION_GONE_BY_OPERATOR = OPERATION_UNREACHABLE
  pred OPERATION_RECOVERING = OPERATION_GONE_BY_OPERATOR
  pred OPERATION_UNKNOWN = OPERATION_RECOVERING
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.OperationState"

instance P'.Wire OperationState where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB OperationState

instance P'.MessageAPI msg' (msg' -> OperationState) OperationState where
  getVal m' f' = f' m'

instance P'.ReflectEnum OperationState where
  reflectEnum
   = [(0, "OPERATION_UNSUPPORTED", OPERATION_UNSUPPORTED), (1, "OPERATION_PENDING", OPERATION_PENDING),
      (2, "OPERATION_FINISHED", OPERATION_FINISHED), (3, "OPERATION_FAILED", OPERATION_FAILED),
      (4, "OPERATION_ERROR", OPERATION_ERROR), (5, "OPERATION_DROPPED", OPERATION_DROPPED),
      (6, "OPERATION_UNREACHABLE", OPERATION_UNREACHABLE), (7, "OPERATION_GONE_BY_OPERATOR", OPERATION_GONE_BY_OPERATOR),
      (8, "OPERATION_RECOVERING", OPERATION_RECOVERING), (9, "OPERATION_UNKNOWN", OPERATION_UNKNOWN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.OperationState") ["Mesos", "V1"] ["Protos"] "OperationState")
      ["Mesos", "V1", "Protos", "OperationState.hs"]
      [(0, "OPERATION_UNSUPPORTED"), (1, "OPERATION_PENDING"), (2, "OPERATION_FINISHED"), (3, "OPERATION_FAILED"),
       (4, "OPERATION_ERROR"), (5, "OPERATION_DROPPED"), (6, "OPERATION_UNREACHABLE"), (7, "OPERATION_GONE_BY_OPERATOR"),
       (8, "OPERATION_RECOVERING"), (9, "OPERATION_UNKNOWN")]

instance P'.TextType OperationState where
  tellT = P'.tellShow
  getT = P'.getRead