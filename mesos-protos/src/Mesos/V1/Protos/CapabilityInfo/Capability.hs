{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses, OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CapabilityInfo.Capability (Capability(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'

data Capability = UNKNOWN
                | CHOWN
                | DAC_OVERRIDE
                | DAC_READ_SEARCH
                | FOWNER
                | FSETID
                | KILL
                | SETGID
                | SETUID
                | SETPCAP
                | LINUX_IMMUTABLE
                | NET_BIND_SERVICE
                | NET_BROADCAST
                | NET_ADMIN
                | NET_RAW
                | IPC_LOCK
                | IPC_OWNER
                | SYS_MODULE
                | SYS_RAWIO
                | SYS_CHROOT
                | SYS_PTRACE
                | SYS_PACCT
                | SYS_ADMIN
                | SYS_BOOT
                | SYS_NICE
                | SYS_RESOURCE
                | SYS_TIME
                | SYS_TTY_CONFIG
                | MKNOD
                | LEASE
                | AUDIT_WRITE
                | AUDIT_CONTROL
                | SETFCAP
                | MAC_OVERRIDE
                | MAC_ADMIN
                | SYSLOG
                | WAKE_ALARM
                | BLOCK_SUSPEND
                | AUDIT_READ
                  deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data,
                            Prelude'.Generic)

instance P'.Mergeable Capability

instance Prelude'.Bounded Capability where
  minBound = UNKNOWN
  maxBound = AUDIT_READ

instance P'.Default Capability where
  defaultValue = UNKNOWN

toMaybe'Enum :: Prelude'.Int -> P'.Maybe Capability
toMaybe'Enum 0 = Prelude'.Just UNKNOWN
toMaybe'Enum 1000 = Prelude'.Just CHOWN
toMaybe'Enum 1001 = Prelude'.Just DAC_OVERRIDE
toMaybe'Enum 1002 = Prelude'.Just DAC_READ_SEARCH
toMaybe'Enum 1003 = Prelude'.Just FOWNER
toMaybe'Enum 1004 = Prelude'.Just FSETID
toMaybe'Enum 1005 = Prelude'.Just KILL
toMaybe'Enum 1006 = Prelude'.Just SETGID
toMaybe'Enum 1007 = Prelude'.Just SETUID
toMaybe'Enum 1008 = Prelude'.Just SETPCAP
toMaybe'Enum 1009 = Prelude'.Just LINUX_IMMUTABLE
toMaybe'Enum 1010 = Prelude'.Just NET_BIND_SERVICE
toMaybe'Enum 1011 = Prelude'.Just NET_BROADCAST
toMaybe'Enum 1012 = Prelude'.Just NET_ADMIN
toMaybe'Enum 1013 = Prelude'.Just NET_RAW
toMaybe'Enum 1014 = Prelude'.Just IPC_LOCK
toMaybe'Enum 1015 = Prelude'.Just IPC_OWNER
toMaybe'Enum 1016 = Prelude'.Just SYS_MODULE
toMaybe'Enum 1017 = Prelude'.Just SYS_RAWIO
toMaybe'Enum 1018 = Prelude'.Just SYS_CHROOT
toMaybe'Enum 1019 = Prelude'.Just SYS_PTRACE
toMaybe'Enum 1020 = Prelude'.Just SYS_PACCT
toMaybe'Enum 1021 = Prelude'.Just SYS_ADMIN
toMaybe'Enum 1022 = Prelude'.Just SYS_BOOT
toMaybe'Enum 1023 = Prelude'.Just SYS_NICE
toMaybe'Enum 1024 = Prelude'.Just SYS_RESOURCE
toMaybe'Enum 1025 = Prelude'.Just SYS_TIME
toMaybe'Enum 1026 = Prelude'.Just SYS_TTY_CONFIG
toMaybe'Enum 1027 = Prelude'.Just MKNOD
toMaybe'Enum 1028 = Prelude'.Just LEASE
toMaybe'Enum 1029 = Prelude'.Just AUDIT_WRITE
toMaybe'Enum 1030 = Prelude'.Just AUDIT_CONTROL
toMaybe'Enum 1031 = Prelude'.Just SETFCAP
toMaybe'Enum 1032 = Prelude'.Just MAC_OVERRIDE
toMaybe'Enum 1033 = Prelude'.Just MAC_ADMIN
toMaybe'Enum 1034 = Prelude'.Just SYSLOG
toMaybe'Enum 1035 = Prelude'.Just WAKE_ALARM
toMaybe'Enum 1036 = Prelude'.Just BLOCK_SUSPEND
toMaybe'Enum 1037 = Prelude'.Just AUDIT_READ
toMaybe'Enum _ = Prelude'.Nothing

instance Prelude'.Enum Capability where
  fromEnum UNKNOWN = 0
  fromEnum CHOWN = 1000
  fromEnum DAC_OVERRIDE = 1001
  fromEnum DAC_READ_SEARCH = 1002
  fromEnum FOWNER = 1003
  fromEnum FSETID = 1004
  fromEnum KILL = 1005
  fromEnum SETGID = 1006
  fromEnum SETUID = 1007
  fromEnum SETPCAP = 1008
  fromEnum LINUX_IMMUTABLE = 1009
  fromEnum NET_BIND_SERVICE = 1010
  fromEnum NET_BROADCAST = 1011
  fromEnum NET_ADMIN = 1012
  fromEnum NET_RAW = 1013
  fromEnum IPC_LOCK = 1014
  fromEnum IPC_OWNER = 1015
  fromEnum SYS_MODULE = 1016
  fromEnum SYS_RAWIO = 1017
  fromEnum SYS_CHROOT = 1018
  fromEnum SYS_PTRACE = 1019
  fromEnum SYS_PACCT = 1020
  fromEnum SYS_ADMIN = 1021
  fromEnum SYS_BOOT = 1022
  fromEnum SYS_NICE = 1023
  fromEnum SYS_RESOURCE = 1024
  fromEnum SYS_TIME = 1025
  fromEnum SYS_TTY_CONFIG = 1026
  fromEnum MKNOD = 1027
  fromEnum LEASE = 1028
  fromEnum AUDIT_WRITE = 1029
  fromEnum AUDIT_CONTROL = 1030
  fromEnum SETFCAP = 1031
  fromEnum MAC_OVERRIDE = 1032
  fromEnum MAC_ADMIN = 1033
  fromEnum SYSLOG = 1034
  fromEnum WAKE_ALARM = 1035
  fromEnum BLOCK_SUSPEND = 1036
  fromEnum AUDIT_READ = 1037
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Mesos.V1.Protos.CapabilityInfo.Capability") .
      toMaybe'Enum
  succ UNKNOWN = CHOWN
  succ CHOWN = DAC_OVERRIDE
  succ DAC_OVERRIDE = DAC_READ_SEARCH
  succ DAC_READ_SEARCH = FOWNER
  succ FOWNER = FSETID
  succ FSETID = KILL
  succ KILL = SETGID
  succ SETGID = SETUID
  succ SETUID = SETPCAP
  succ SETPCAP = LINUX_IMMUTABLE
  succ LINUX_IMMUTABLE = NET_BIND_SERVICE
  succ NET_BIND_SERVICE = NET_BROADCAST
  succ NET_BROADCAST = NET_ADMIN
  succ NET_ADMIN = NET_RAW
  succ NET_RAW = IPC_LOCK
  succ IPC_LOCK = IPC_OWNER
  succ IPC_OWNER = SYS_MODULE
  succ SYS_MODULE = SYS_RAWIO
  succ SYS_RAWIO = SYS_CHROOT
  succ SYS_CHROOT = SYS_PTRACE
  succ SYS_PTRACE = SYS_PACCT
  succ SYS_PACCT = SYS_ADMIN
  succ SYS_ADMIN = SYS_BOOT
  succ SYS_BOOT = SYS_NICE
  succ SYS_NICE = SYS_RESOURCE
  succ SYS_RESOURCE = SYS_TIME
  succ SYS_TIME = SYS_TTY_CONFIG
  succ SYS_TTY_CONFIG = MKNOD
  succ MKNOD = LEASE
  succ LEASE = AUDIT_WRITE
  succ AUDIT_WRITE = AUDIT_CONTROL
  succ AUDIT_CONTROL = SETFCAP
  succ SETFCAP = MAC_OVERRIDE
  succ MAC_OVERRIDE = MAC_ADMIN
  succ MAC_ADMIN = SYSLOG
  succ SYSLOG = WAKE_ALARM
  succ WAKE_ALARM = BLOCK_SUSPEND
  succ BLOCK_SUSPEND = AUDIT_READ
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Mesos.V1.Protos.CapabilityInfo.Capability"
  pred CHOWN = UNKNOWN
  pred DAC_OVERRIDE = CHOWN
  pred DAC_READ_SEARCH = DAC_OVERRIDE
  pred FOWNER = DAC_READ_SEARCH
  pred FSETID = FOWNER
  pred KILL = FSETID
  pred SETGID = KILL
  pred SETUID = SETGID
  pred SETPCAP = SETUID
  pred LINUX_IMMUTABLE = SETPCAP
  pred NET_BIND_SERVICE = LINUX_IMMUTABLE
  pred NET_BROADCAST = NET_BIND_SERVICE
  pred NET_ADMIN = NET_BROADCAST
  pred NET_RAW = NET_ADMIN
  pred IPC_LOCK = NET_RAW
  pred IPC_OWNER = IPC_LOCK
  pred SYS_MODULE = IPC_OWNER
  pred SYS_RAWIO = SYS_MODULE
  pred SYS_CHROOT = SYS_RAWIO
  pred SYS_PTRACE = SYS_CHROOT
  pred SYS_PACCT = SYS_PTRACE
  pred SYS_ADMIN = SYS_PACCT
  pred SYS_BOOT = SYS_ADMIN
  pred SYS_NICE = SYS_BOOT
  pred SYS_RESOURCE = SYS_NICE
  pred SYS_TIME = SYS_RESOURCE
  pred SYS_TTY_CONFIG = SYS_TIME
  pred MKNOD = SYS_TTY_CONFIG
  pred LEASE = MKNOD
  pred AUDIT_WRITE = LEASE
  pred AUDIT_CONTROL = AUDIT_WRITE
  pred SETFCAP = AUDIT_CONTROL
  pred MAC_OVERRIDE = SETFCAP
  pred MAC_ADMIN = MAC_OVERRIDE
  pred SYSLOG = MAC_ADMIN
  pred WAKE_ALARM = SYSLOG
  pred BLOCK_SUSPEND = WAKE_ALARM
  pred AUDIT_READ = BLOCK_SUSPEND
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Mesos.V1.Protos.CapabilityInfo.Capability"

instance P'.Wire Capability where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'

instance P'.GPB Capability

instance P'.MessageAPI msg' (msg' -> Capability) Capability where
  getVal m' f' = f' m'

instance P'.ReflectEnum Capability where
  reflectEnum
   = [(0, "UNKNOWN", UNKNOWN), (1000, "CHOWN", CHOWN), (1001, "DAC_OVERRIDE", DAC_OVERRIDE),
      (1002, "DAC_READ_SEARCH", DAC_READ_SEARCH), (1003, "FOWNER", FOWNER), (1004, "FSETID", FSETID), (1005, "KILL", KILL),
      (1006, "SETGID", SETGID), (1007, "SETUID", SETUID), (1008, "SETPCAP", SETPCAP), (1009, "LINUX_IMMUTABLE", LINUX_IMMUTABLE),
      (1010, "NET_BIND_SERVICE", NET_BIND_SERVICE), (1011, "NET_BROADCAST", NET_BROADCAST), (1012, "NET_ADMIN", NET_ADMIN),
      (1013, "NET_RAW", NET_RAW), (1014, "IPC_LOCK", IPC_LOCK), (1015, "IPC_OWNER", IPC_OWNER), (1016, "SYS_MODULE", SYS_MODULE),
      (1017, "SYS_RAWIO", SYS_RAWIO), (1018, "SYS_CHROOT", SYS_CHROOT), (1019, "SYS_PTRACE", SYS_PTRACE),
      (1020, "SYS_PACCT", SYS_PACCT), (1021, "SYS_ADMIN", SYS_ADMIN), (1022, "SYS_BOOT", SYS_BOOT), (1023, "SYS_NICE", SYS_NICE),
      (1024, "SYS_RESOURCE", SYS_RESOURCE), (1025, "SYS_TIME", SYS_TIME), (1026, "SYS_TTY_CONFIG", SYS_TTY_CONFIG),
      (1027, "MKNOD", MKNOD), (1028, "LEASE", LEASE), (1029, "AUDIT_WRITE", AUDIT_WRITE), (1030, "AUDIT_CONTROL", AUDIT_CONTROL),
      (1031, "SETFCAP", SETFCAP), (1032, "MAC_OVERRIDE", MAC_OVERRIDE), (1033, "MAC_ADMIN", MAC_ADMIN), (1034, "SYSLOG", SYSLOG),
      (1035, "WAKE_ALARM", WAKE_ALARM), (1036, "BLOCK_SUSPEND", BLOCK_SUSPEND), (1037, "AUDIT_READ", AUDIT_READ)]
  reflectEnumInfo _
   = P'.EnumInfo
      (P'.makePNF (P'.pack ".mesos.v1.CapabilityInfo.Capability") ["Mesos", "V1"] ["Protos", "CapabilityInfo"] "Capability")
      ["Mesos", "V1", "Protos", "CapabilityInfo", "Capability.hs"]
      [(0, "UNKNOWN"), (1000, "CHOWN"), (1001, "DAC_OVERRIDE"), (1002, "DAC_READ_SEARCH"), (1003, "FOWNER"), (1004, "FSETID"),
       (1005, "KILL"), (1006, "SETGID"), (1007, "SETUID"), (1008, "SETPCAP"), (1009, "LINUX_IMMUTABLE"), (1010, "NET_BIND_SERVICE"),
       (1011, "NET_BROADCAST"), (1012, "NET_ADMIN"), (1013, "NET_RAW"), (1014, "IPC_LOCK"), (1015, "IPC_OWNER"),
       (1016, "SYS_MODULE"), (1017, "SYS_RAWIO"), (1018, "SYS_CHROOT"), (1019, "SYS_PTRACE"), (1020, "SYS_PACCT"),
       (1021, "SYS_ADMIN"), (1022, "SYS_BOOT"), (1023, "SYS_NICE"), (1024, "SYS_RESOURCE"), (1025, "SYS_TIME"),
       (1026, "SYS_TTY_CONFIG"), (1027, "MKNOD"), (1028, "LEASE"), (1029, "AUDIT_WRITE"), (1030, "AUDIT_CONTROL"),
       (1031, "SETFCAP"), (1032, "MAC_OVERRIDE"), (1033, "MAC_ADMIN"), (1034, "SYSLOG"), (1035, "WAKE_ALARM"),
       (1036, "BLOCK_SUSPEND"), (1037, "AUDIT_READ")]
      Prelude'.True

instance P'.TextType Capability where
  tellT = P'.tellShow
  getT = P'.getRead

instance P'.ToJSON Capability where
  toJSON msg'
   = P'.String
      (case msg' of
         UNKNOWN -> "UNKNOWN"
         CHOWN -> "CHOWN"
         DAC_OVERRIDE -> "DAC_OVERRIDE"
         DAC_READ_SEARCH -> "DAC_READ_SEARCH"
         FOWNER -> "FOWNER"
         FSETID -> "FSETID"
         KILL -> "KILL"
         SETGID -> "SETGID"
         SETUID -> "SETUID"
         SETPCAP -> "SETPCAP"
         LINUX_IMMUTABLE -> "LINUX_IMMUTABLE"
         NET_BIND_SERVICE -> "NET_BIND_SERVICE"
         NET_BROADCAST -> "NET_BROADCAST"
         NET_ADMIN -> "NET_ADMIN"
         NET_RAW -> "NET_RAW"
         IPC_LOCK -> "IPC_LOCK"
         IPC_OWNER -> "IPC_OWNER"
         SYS_MODULE -> "SYS_MODULE"
         SYS_RAWIO -> "SYS_RAWIO"
         SYS_CHROOT -> "SYS_CHROOT"
         SYS_PTRACE -> "SYS_PTRACE"
         SYS_PACCT -> "SYS_PACCT"
         SYS_ADMIN -> "SYS_ADMIN"
         SYS_BOOT -> "SYS_BOOT"
         SYS_NICE -> "SYS_NICE"
         SYS_RESOURCE -> "SYS_RESOURCE"
         SYS_TIME -> "SYS_TIME"
         SYS_TTY_CONFIG -> "SYS_TTY_CONFIG"
         MKNOD -> "MKNOD"
         LEASE -> "LEASE"
         AUDIT_WRITE -> "AUDIT_WRITE"
         AUDIT_CONTROL -> "AUDIT_CONTROL"
         SETFCAP -> "SETFCAP"
         MAC_OVERRIDE -> "MAC_OVERRIDE"
         MAC_ADMIN -> "MAC_ADMIN"
         SYSLOG -> "SYSLOG"
         WAKE_ALARM -> "WAKE_ALARM"
         BLOCK_SUSPEND -> "BLOCK_SUSPEND"
         AUDIT_READ -> "AUDIT_READ")

instance P'.FromJSON Capability where
  parseJSON
   = P'.withText "Mesos.V1.Protos.CapabilityInfo.Capability.Capability"
      (\ msg' ->
        case msg' of
          "UNKNOWN" -> Prelude'.return UNKNOWN
          "CHOWN" -> Prelude'.return CHOWN
          "DAC_OVERRIDE" -> Prelude'.return DAC_OVERRIDE
          "DAC_READ_SEARCH" -> Prelude'.return DAC_READ_SEARCH
          "FOWNER" -> Prelude'.return FOWNER
          "FSETID" -> Prelude'.return FSETID
          "KILL" -> Prelude'.return KILL
          "SETGID" -> Prelude'.return SETGID
          "SETUID" -> Prelude'.return SETUID
          "SETPCAP" -> Prelude'.return SETPCAP
          "LINUX_IMMUTABLE" -> Prelude'.return LINUX_IMMUTABLE
          "NET_BIND_SERVICE" -> Prelude'.return NET_BIND_SERVICE
          "NET_BROADCAST" -> Prelude'.return NET_BROADCAST
          "NET_ADMIN" -> Prelude'.return NET_ADMIN
          "NET_RAW" -> Prelude'.return NET_RAW
          "IPC_LOCK" -> Prelude'.return IPC_LOCK
          "IPC_OWNER" -> Prelude'.return IPC_OWNER
          "SYS_MODULE" -> Prelude'.return SYS_MODULE
          "SYS_RAWIO" -> Prelude'.return SYS_RAWIO
          "SYS_CHROOT" -> Prelude'.return SYS_CHROOT
          "SYS_PTRACE" -> Prelude'.return SYS_PTRACE
          "SYS_PACCT" -> Prelude'.return SYS_PACCT
          "SYS_ADMIN" -> Prelude'.return SYS_ADMIN
          "SYS_BOOT" -> Prelude'.return SYS_BOOT
          "SYS_NICE" -> Prelude'.return SYS_NICE
          "SYS_RESOURCE" -> Prelude'.return SYS_RESOURCE
          "SYS_TIME" -> Prelude'.return SYS_TIME
          "SYS_TTY_CONFIG" -> Prelude'.return SYS_TTY_CONFIG
          "MKNOD" -> Prelude'.return MKNOD
          "LEASE" -> Prelude'.return LEASE
          "AUDIT_WRITE" -> Prelude'.return AUDIT_WRITE
          "AUDIT_CONTROL" -> Prelude'.return AUDIT_CONTROL
          "SETFCAP" -> Prelude'.return SETFCAP
          "MAC_OVERRIDE" -> Prelude'.return MAC_OVERRIDE
          "MAC_ADMIN" -> Prelude'.return MAC_ADMIN
          "SYSLOG" -> Prelude'.return SYSLOG
          "WAKE_ALARM" -> Prelude'.return WAKE_ALARM
          "BLOCK_SUSPEND" -> Prelude'.return BLOCK_SUSPEND
          "AUDIT_READ" -> Prelude'.return AUDIT_READ
          _ -> Prelude'.fail
                ("Invalid value " Prelude'.++ Prelude'.show msg' Prelude'.++
                  " for enum Mesos.V1.Protos.CapabilityInfo.Capability.Capability"))