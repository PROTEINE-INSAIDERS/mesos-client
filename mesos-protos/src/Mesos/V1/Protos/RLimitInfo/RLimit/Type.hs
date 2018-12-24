{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.RLimitInfo.RLimit.Type (Type(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Type = UNKNOWN
          | RLMT_AS
          | RLMT_CORE
          | RLMT_CPU
          | RLMT_DATA
          | RLMT_FSIZE
          | RLMT_LOCKS
          | RLMT_MEMLOCK
          | RLMT_MSGQUEUE
          | RLMT_NICE
          | RLMT_NOFILE
          | RLMT_NPROC
          | RLMT_RSS
          | RLMT_RTPRIO
          | RLMT_RTTIME
          | RLMT_SIGPENDING
          | RLMT_STACK
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.Mergeable Type

instance Prelude'.Bounded Type where
  minBound = UNKNOWN
  maxBound = RLMT_STACK

instance P'.Default Type where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Type
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1 = Prelude'.Just RLMT_AS
toMaybe'Enum 2 = Prelude'.Just RLMT_CORE
toMaybe'Enum 3 = Prelude'.Just RLMT_CPU
toMaybe'Enum 4 = Prelude'.Just RLMT_DATA
toMaybe'Enum 5 = Prelude'.Just RLMT_FSIZE
toMaybe'Enum 6 = Prelude'.Just RLMT_LOCKS
toMaybe'Enum 7 = Prelude'.Just RLMT_MEMLOCK
toMaybe'Enum 8 = Prelude'.Just RLMT_MSGQUEUE
toMaybe'Enum 9 = Prelude'.Just RLMT_NICE
toMaybe'Enum 10 = Prelude'.Just RLMT_NOFILE
toMaybe'Enum 11 = Prelude'.Just RLMT_NPROC
toMaybe'Enum 12 = Prelude'.Just RLMT_RSS
toMaybe'Enum 13 = Prelude'.Just RLMT_RTPRIO
toMaybe'Enum 14 = Prelude'.Just RLMT_RTTIME
toMaybe'Enum 15 = Prelude'.Just RLMT_SIGPENDING
toMaybe'Enum 16 = Prelude'.Just RLMT_STACK
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Type where
  fromEnum UNKNOWN = 0
  fromEnum RLMT_AS = 1
  fromEnum RLMT_CORE = 2
  fromEnum RLMT_CPU = 3
  fromEnum RLMT_DATA = 4
  fromEnum RLMT_FSIZE = 5
  fromEnum RLMT_LOCKS = 6
  fromEnum RLMT_MEMLOCK = 7
  fromEnum RLMT_MSGQUEUE = 8
  fromEnum RLMT_NICE = 9
  fromEnum RLMT_NOFILE = 10
  fromEnum RLMT_NPROC = 11
  fromEnum RLMT_RSS = 12
  fromEnum RLMT_RTPRIO = 13
  fromEnum RLMT_RTTIME = 14
  fromEnum RLMT_SIGPENDING = 15
  fromEnum RLMT_STACK = 16
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.RLimitInfo.RLimit.Type") .
      toMaybe'Enum
  succ UNKNOWN = RLMT_AS
  succ RLMT_AS = RLMT_CORE
  succ RLMT_CORE = RLMT_CPU
  succ RLMT_CPU = RLMT_DATA
  succ RLMT_DATA = RLMT_FSIZE
  succ RLMT_FSIZE = RLMT_LOCKS
  succ RLMT_LOCKS = RLMT_MEMLOCK
  succ RLMT_MEMLOCK = RLMT_MSGQUEUE
  succ RLMT_MSGQUEUE = RLMT_NICE
  succ RLMT_NICE = RLMT_NOFILE
  succ RLMT_NOFILE = RLMT_NPROC
  succ RLMT_NPROC = RLMT_RSS
  succ RLMT_RSS = RLMT_RTPRIO
  succ RLMT_RTPRIO = RLMT_RTTIME
  succ RLMT_RTTIME = RLMT_SIGPENDING
  succ RLMT_SIGPENDING = RLMT_STACK
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.RLimitInfo.RLimit.Type"
  pred RLMT_AS = UNKNOWN
  pred RLMT_CORE = RLMT_AS
  pred RLMT_CPU = RLMT_CORE
  pred RLMT_DATA = RLMT_CPU
  pred RLMT_FSIZE = RLMT_DATA
  pred RLMT_LOCKS = RLMT_FSIZE
  pred RLMT_MEMLOCK = RLMT_LOCKS
  pred RLMT_MSGQUEUE = RLMT_MEMLOCK
  pred RLMT_NICE = RLMT_MSGQUEUE
  pred RLMT_NOFILE = RLMT_NICE
  pred RLMT_NPROC = RLMT_NOFILE
  pred RLMT_RSS = RLMT_NPROC
  pred RLMT_RTPRIO = RLMT_RSS
  pred RLMT_RTTIME = RLMT_RTPRIO
  pred RLMT_SIGPENDING = RLMT_RTTIME
  pred RLMT_STACK = RLMT_SIGPENDING
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.RLimitInfo.RLimit.Type"

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
   = [(0, "UNKNOWN", UNKNOWN), (1, "RLMT_AS", RLMT_AS), (2, "RLMT_CORE", RLMT_CORE), (3, "RLMT_CPU", RLMT_CPU),
      (4, "RLMT_DATA", RLMT_DATA), (5, "RLMT_FSIZE", RLMT_FSIZE), (6, "RLMT_LOCKS", RLMT_LOCKS), (7, "RLMT_MEMLOCK", RLMT_MEMLOCK),
      (8, "RLMT_MSGQUEUE", RLMT_MSGQUEUE), (9, "RLMT_NICE", RLMT_NICE), (10, "RLMT_NOFILE", RLMT_NOFILE),
      (11, "RLMT_NPROC", RLMT_NPROC), (12, "RLMT_RSS", RLMT_RSS), (13, "RLMT_RTPRIO", RLMT_RTPRIO),
      (14, "RLMT_RTTIME", RLMT_RTTIME), (15, "RLMT_SIGPENDING", RLMT_SIGPENDING), (16, "RLMT_STACK", RLMT_STACK)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".mesos.v1.RLimitInfo.RLimit.Type") ["Mesos", "V1"] ["Protos", "RLimitInfo", "RLimit"] "Type")
      ["Mesos", "V1", "Protos", "RLimitInfo", "RLimit", "Type.hs"]
      [(0, "UNKNOWN"), (1, "RLMT_AS"), (2, "RLMT_CORE"), (3, "RLMT_CPU"), (4, "RLMT_DATA"), (5, "RLMT_FSIZE"), (6, "RLMT_LOCKS"),
       (7, "RLMT_MEMLOCK"), (8, "RLMT_MSGQUEUE"), (9, "RLMT_NICE"), (10, "RLMT_NOFILE"), (11, "RLMT_NPROC"), (12, "RLMT_RSS"),
       (13, "RLMT_RTPRIO"), (14, "RLMT_RTTIME"), (15, "RLMT_SIGPENDING"), (16, "RLMT_STACK")]
      Prelude'.True

instance P'.TextType Type where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Type where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         RLMT_AS -> "RLMT_AS"
         RLMT_CORE -> "RLMT_CORE"
         RLMT_CPU -> "RLMT_CPU"
         RLMT_DATA -> "RLMT_DATA"
         RLMT_FSIZE -> "RLMT_FSIZE"
         RLMT_LOCKS -> "RLMT_LOCKS"
         RLMT_MEMLOCK -> "RLMT_MEMLOCK"
         RLMT_MSGQUEUE -> "RLMT_MSGQUEUE"
         RLMT_NICE -> "RLMT_NICE"
         RLMT_NOFILE -> "RLMT_NOFILE"
         RLMT_NPROC -> "RLMT_NPROC"
         RLMT_RSS -> "RLMT_RSS"
         RLMT_RTPRIO -> "RLMT_RTPRIO"
         RLMT_RTTIME -> "RLMT_RTTIME"
         RLMT_SIGPENDING -> "RLMT_SIGPENDING"
         RLMT_STACK -> "RLMT_STACK")

instance P'.FromJSON Type where
  parseJSON
   = P'.withText "Mesos.V1.Protos.RLimitInfo.RLimit.Type.Type"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "RLMT_AS" -> Prelude'.return RLMT_AS
          "RLMT_CORE" -> Prelude'.return RLMT_CORE
          "RLMT_CPU" -> Prelude'.return RLMT_CPU
          "RLMT_DATA" -> Prelude'.return RLMT_DATA
          "RLMT_FSIZE" -> Prelude'.return RLMT_FSIZE
          "RLMT_LOCKS" -> Prelude'.return RLMT_LOCKS
          "RLMT_MEMLOCK" -> Prelude'.return RLMT_MEMLOCK
          "RLMT_MSGQUEUE" -> Prelude'.return RLMT_MSGQUEUE
          "RLMT_NICE" -> Prelude'.return RLMT_NICE
          "RLMT_NOFILE" -> Prelude'.return RLMT_NOFILE
          "RLMT_NPROC" -> Prelude'.return RLMT_NPROC
          "RLMT_RSS" -> Prelude'.return RLMT_RSS
          "RLMT_RTPRIO" -> Prelude'.return RLMT_RTPRIO
          "RLMT_RTTIME" -> Prelude'.return RLMT_RTTIME
          "RLMT_SIGPENDING" -> Prelude'.return RLMT_SIGPENDING
          "RLMT_STACK" -> Prelude'.return RLMT_STACK
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.RLimitInfo.RLimit.Type.Type"))