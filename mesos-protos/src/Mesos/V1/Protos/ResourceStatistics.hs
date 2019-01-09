{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.ResourceStatistics
       (ResourceStatistics(..), timestamp, processes, threads, cpus_user_time_secs, cpus_system_time_secs, cpus_limit,
        cpus_nr_periods, cpus_nr_throttled, cpus_throttled_time_secs, mem_total_bytes, mem_total_memsw_bytes, mem_limit_bytes,
        mem_soft_limit_bytes, mem_file_bytes, mem_anon_bytes, mem_cache_bytes, mem_rss_bytes, mem_mapped_file_bytes, mem_swap_bytes,
        mem_unevictable_bytes, mem_low_pressure_counter, mem_medium_pressure_counter, mem_critical_pressure_counter,
        disk_limit_bytes, disk_used_bytes, disk_statistics, blkio_statistics, perf, net_rx_packets, net_rx_bytes, net_rx_errors,
        net_rx_dropped, net_tx_packets, net_tx_bytes, net_tx_errors, net_tx_dropped, net_tcp_rtt_microsecs_p50,
        net_tcp_rtt_microsecs_p90, net_tcp_rtt_microsecs_p95, net_tcp_rtt_microsecs_p99, net_tcp_active_connections,
        net_tcp_time_wait_connections, net_traffic_control_statistics, net_snmp_statistics)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH
import qualified Mesos.V1.Protos.CgroupInfo.Blkio.Statistics as Protos.CgroupInfo.Blkio (Statistics)
import qualified Mesos.V1.Protos.DiskStatistics as Protos (DiskStatistics)
import qualified Mesos.V1.Protos.PerfStatistics as Protos (PerfStatistics)
import qualified Mesos.V1.Protos.SNMPStatistics as Protos (SNMPStatistics)
import qualified Mesos.V1.Protos.TrafficControlStatistics as Protos (TrafficControlStatistics)

data ResourceStatistics = ResourceStatistics{_timestamp :: !(P'.Double), _processes :: !(P'.Maybe P'.Word32),
                                             _threads :: !(P'.Maybe P'.Word32), _cpus_user_time_secs :: !(P'.Maybe P'.Double),
                                             _cpus_system_time_secs :: !(P'.Maybe P'.Double), _cpus_limit :: !(P'.Maybe P'.Double),
                                             _cpus_nr_periods :: !(P'.Maybe P'.Word32), _cpus_nr_throttled :: !(P'.Maybe P'.Word32),
                                             _cpus_throttled_time_secs :: !(P'.Maybe P'.Double),
                                             _mem_total_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_total_memsw_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_limit_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_soft_limit_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_file_bytes :: !(P'.Maybe P'.Word64), _mem_anon_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_cache_bytes :: !(P'.Maybe P'.Word64), _mem_rss_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_mapped_file_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_swap_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_unevictable_bytes :: !(P'.Maybe P'.Word64),
                                             _mem_low_pressure_counter :: !(P'.Maybe P'.Word64),
                                             _mem_medium_pressure_counter :: !(P'.Maybe P'.Word64),
                                             _mem_critical_pressure_counter :: !(P'.Maybe P'.Word64),
                                             _disk_limit_bytes :: !(P'.Maybe P'.Word64), _disk_used_bytes :: !(P'.Maybe P'.Word64),
                                             _disk_statistics :: !(P'.Seq Protos.DiskStatistics),
                                             _blkio_statistics :: !(P'.Maybe Protos.CgroupInfo.Blkio.Statistics),
                                             _perf :: !(P'.Maybe Protos.PerfStatistics), _net_rx_packets :: !(P'.Maybe P'.Word64),
                                             _net_rx_bytes :: !(P'.Maybe P'.Word64), _net_rx_errors :: !(P'.Maybe P'.Word64),
                                             _net_rx_dropped :: !(P'.Maybe P'.Word64), _net_tx_packets :: !(P'.Maybe P'.Word64),
                                             _net_tx_bytes :: !(P'.Maybe P'.Word64), _net_tx_errors :: !(P'.Maybe P'.Word64),
                                             _net_tx_dropped :: !(P'.Maybe P'.Word64),
                                             _net_tcp_rtt_microsecs_p50 :: !(P'.Maybe P'.Double),
                                             _net_tcp_rtt_microsecs_p90 :: !(P'.Maybe P'.Double),
                                             _net_tcp_rtt_microsecs_p95 :: !(P'.Maybe P'.Double),
                                             _net_tcp_rtt_microsecs_p99 :: !(P'.Maybe P'.Double),
                                             _net_tcp_active_connections :: !(P'.Maybe P'.Double),
                                             _net_tcp_time_wait_connections :: !(P'.Maybe P'.Double),
                                             _net_traffic_control_statistics :: !(P'.Seq Protos.TrafficControlStatistics),
                                             _net_snmp_statistics :: !(P'.Maybe Protos.SNMPStatistics)}
                          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''ResourceStatistics

instance P'.ToJSON ResourceStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("timestamp", P'.toJSON (timestamp msg)), ("processes", P'.toJSON (Prelude'.fmap P'.toJSON (processes msg))),
        ("threads", P'.toJSON (Prelude'.fmap P'.toJSON (threads msg))),
        ("cpus_user_time_secs", P'.toJSON (Prelude'.fmap P'.toJSON (cpus_user_time_secs msg))),
        ("cpus_system_time_secs", P'.toJSON (Prelude'.fmap P'.toJSON (cpus_system_time_secs msg))),
        ("cpus_limit", P'.toJSON (Prelude'.fmap P'.toJSON (cpus_limit msg))),
        ("cpus_nr_periods", P'.toJSON (Prelude'.fmap P'.toJSON (cpus_nr_periods msg))),
        ("cpus_nr_throttled", P'.toJSON (Prelude'.fmap P'.toJSON (cpus_nr_throttled msg))),
        ("cpus_throttled_time_secs", P'.toJSON (Prelude'.fmap P'.toJSON (cpus_throttled_time_secs msg))),
        ("mem_total_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_total_bytes msg))),
        ("mem_total_memsw_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_total_memsw_bytes msg))),
        ("mem_limit_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_limit_bytes msg))),
        ("mem_soft_limit_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_soft_limit_bytes msg))),
        ("mem_file_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_file_bytes msg))),
        ("mem_anon_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_anon_bytes msg))),
        ("mem_cache_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_cache_bytes msg))),
        ("mem_rss_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_rss_bytes msg))),
        ("mem_mapped_file_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_mapped_file_bytes msg))),
        ("mem_swap_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_swap_bytes msg))),
        ("mem_unevictable_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_unevictable_bytes msg))),
        ("mem_low_pressure_counter", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_low_pressure_counter msg))),
        ("mem_medium_pressure_counter", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_medium_pressure_counter msg))),
        ("mem_critical_pressure_counter", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (mem_critical_pressure_counter msg))),
        ("disk_limit_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (disk_limit_bytes msg))),
        ("disk_used_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (disk_used_bytes msg))),
        ("disk_statistics", P'.toJSON (Prelude'.fmap P'.toJSON (disk_statistics msg))),
        ("blkio_statistics", P'.toJSON (Prelude'.fmap P'.toJSON (blkio_statistics msg))),
        ("perf", P'.toJSON (Prelude'.fmap P'.toJSON (perf msg))),
        ("net_rx_packets", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_rx_packets msg))),
        ("net_rx_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_rx_bytes msg))),
        ("net_rx_errors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_rx_errors msg))),
        ("net_rx_dropped", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_rx_dropped msg))),
        ("net_tx_packets", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_tx_packets msg))),
        ("net_tx_bytes", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_tx_bytes msg))),
        ("net_tx_errors", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_tx_errors msg))),
        ("net_tx_dropped", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (net_tx_dropped msg))),
        ("net_tcp_rtt_microsecs_p50", P'.toJSON (Prelude'.fmap P'.toJSON (net_tcp_rtt_microsecs_p50 msg))),
        ("net_tcp_rtt_microsecs_p90", P'.toJSON (Prelude'.fmap P'.toJSON (net_tcp_rtt_microsecs_p90 msg))),
        ("net_tcp_rtt_microsecs_p95", P'.toJSON (Prelude'.fmap P'.toJSON (net_tcp_rtt_microsecs_p95 msg))),
        ("net_tcp_rtt_microsecs_p99", P'.toJSON (Prelude'.fmap P'.toJSON (net_tcp_rtt_microsecs_p99 msg))),
        ("net_tcp_active_connections", P'.toJSON (Prelude'.fmap P'.toJSON (net_tcp_active_connections msg))),
        ("net_tcp_time_wait_connections", P'.toJSON (Prelude'.fmap P'.toJSON (net_tcp_time_wait_connections msg))),
        ("net_traffic_control_statistics", P'.toJSON (Prelude'.fmap P'.toJSON (net_traffic_control_statistics msg))),
        ("net_snmp_statistics", P'.toJSON (Prelude'.fmap P'.toJSON (net_snmp_statistics msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON ResourceStatistics where
  parseJSON
   = P'.withObject "ResourceStatistics"
      (\ o ->
        do
          timestamp <- P'.explicitParseField P'.parseJSON o "timestamp"
          processes <- P'.explicitParseFieldMaybe P'.parseJSON o "processes"
          threads <- P'.explicitParseFieldMaybe P'.parseJSON o "threads"
          cpus_user_time_secs <- P'.explicitParseFieldMaybe P'.parseJSON o "cpus_user_time_secs"
          cpus_system_time_secs <- P'.explicitParseFieldMaybe P'.parseJSON o "cpus_system_time_secs"
          cpus_limit <- P'.explicitParseFieldMaybe P'.parseJSON o "cpus_limit"
          cpus_nr_periods <- P'.explicitParseFieldMaybe P'.parseJSON o "cpus_nr_periods"
          cpus_nr_throttled <- P'.explicitParseFieldMaybe P'.parseJSON o "cpus_nr_throttled"
          cpus_throttled_time_secs <- P'.explicitParseFieldMaybe P'.parseJSON o "cpus_throttled_time_secs"
          mem_total_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_total_bytes"
          mem_total_memsw_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_total_memsw_bytes"
          mem_limit_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_limit_bytes"
          mem_soft_limit_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_soft_limit_bytes"
          mem_file_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_file_bytes"
          mem_anon_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_anon_bytes"
          mem_cache_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_cache_bytes"
          mem_rss_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_rss_bytes"
          mem_mapped_file_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_mapped_file_bytes"
          mem_swap_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_swap_bytes"
          mem_unevictable_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_unevictable_bytes"
          mem_low_pressure_counter <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "mem_low_pressure_counter"
          mem_medium_pressure_counter <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o
                                          "mem_medium_pressure_counter"
          mem_critical_pressure_counter <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o
                                            "mem_critical_pressure_counter"
          disk_limit_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "disk_limit_bytes"
          disk_used_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "disk_used_bytes"
          disk_statistics <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                              (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o "disk_statistics")
          blkio_statistics <- P'.explicitParseFieldMaybe P'.parseJSON o "blkio_statistics"
          perf <- P'.explicitParseFieldMaybe P'.parseJSON o "perf"
          net_rx_packets <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_rx_packets"
          net_rx_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_rx_bytes"
          net_rx_errors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_rx_errors"
          net_rx_dropped <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_rx_dropped"
          net_tx_packets <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_tx_packets"
          net_tx_bytes <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_tx_bytes"
          net_tx_errors <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_tx_errors"
          net_tx_dropped <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "net_tx_dropped"
          net_tcp_rtt_microsecs_p50 <- P'.explicitParseFieldMaybe P'.parseJSON o "net_tcp_rtt_microsecs_p50"
          net_tcp_rtt_microsecs_p90 <- P'.explicitParseFieldMaybe P'.parseJSON o "net_tcp_rtt_microsecs_p90"
          net_tcp_rtt_microsecs_p95 <- P'.explicitParseFieldMaybe P'.parseJSON o "net_tcp_rtt_microsecs_p95"
          net_tcp_rtt_microsecs_p99 <- P'.explicitParseFieldMaybe P'.parseJSON o "net_tcp_rtt_microsecs_p99"
          net_tcp_active_connections <- P'.explicitParseFieldMaybe P'.parseJSON o "net_tcp_active_connections"
          net_tcp_time_wait_connections <- P'.explicitParseFieldMaybe P'.parseJSON o "net_tcp_time_wait_connections"
          net_traffic_control_statistics <- Prelude'.fmap (Prelude'.maybe Prelude'.mempty Prelude'.id)
                                             (P'.explicitParseFieldMaybe (Prelude'.mapM P'.parseJSON P'.<=< P'.parseJSON) o
                                               "net_traffic_control_statistics")
          net_snmp_statistics <- P'.explicitParseFieldMaybe P'.parseJSON o "net_snmp_statistics"
          Prelude'.return
           P'.defaultValue{_timestamp = timestamp, _processes = processes, _threads = threads,
                           _cpus_user_time_secs = cpus_user_time_secs, _cpus_system_time_secs = cpus_system_time_secs,
                           _cpus_limit = cpus_limit, _cpus_nr_periods = cpus_nr_periods, _cpus_nr_throttled = cpus_nr_throttled,
                           _cpus_throttled_time_secs = cpus_throttled_time_secs, _mem_total_bytes = mem_total_bytes,
                           _mem_total_memsw_bytes = mem_total_memsw_bytes, _mem_limit_bytes = mem_limit_bytes,
                           _mem_soft_limit_bytes = mem_soft_limit_bytes, _mem_file_bytes = mem_file_bytes,
                           _mem_anon_bytes = mem_anon_bytes, _mem_cache_bytes = mem_cache_bytes, _mem_rss_bytes = mem_rss_bytes,
                           _mem_mapped_file_bytes = mem_mapped_file_bytes, _mem_swap_bytes = mem_swap_bytes,
                           _mem_unevictable_bytes = mem_unevictable_bytes, _mem_low_pressure_counter = mem_low_pressure_counter,
                           _mem_medium_pressure_counter = mem_medium_pressure_counter,
                           _mem_critical_pressure_counter = mem_critical_pressure_counter, _disk_limit_bytes = disk_limit_bytes,
                           _disk_used_bytes = disk_used_bytes, _disk_statistics = disk_statistics,
                           _blkio_statistics = blkio_statistics, _perf = perf, _net_rx_packets = net_rx_packets,
                           _net_rx_bytes = net_rx_bytes, _net_rx_errors = net_rx_errors, _net_rx_dropped = net_rx_dropped,
                           _net_tx_packets = net_tx_packets, _net_tx_bytes = net_tx_bytes, _net_tx_errors = net_tx_errors,
                           _net_tx_dropped = net_tx_dropped, _net_tcp_rtt_microsecs_p50 = net_tcp_rtt_microsecs_p50,
                           _net_tcp_rtt_microsecs_p90 = net_tcp_rtt_microsecs_p90,
                           _net_tcp_rtt_microsecs_p95 = net_tcp_rtt_microsecs_p95,
                           _net_tcp_rtt_microsecs_p99 = net_tcp_rtt_microsecs_p99,
                           _net_tcp_active_connections = net_tcp_active_connections,
                           _net_tcp_time_wait_connections = net_tcp_time_wait_connections,
                           _net_traffic_control_statistics = net_traffic_control_statistics,
                           _net_snmp_statistics = net_snmp_statistics})

instance P'.Mergeable ResourceStatistics where
  mergeAppend
   (ResourceStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
     x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44)
   (ResourceStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23
     y'24 y'25 y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38 y'39 y'40 y'41 y'42 y'43 y'44)
   = ResourceStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)
      (P'.mergeAppend x'20 y'20)
      (P'.mergeAppend x'21 y'21)
      (P'.mergeAppend x'22 y'22)
      (P'.mergeAppend x'23 y'23)
      (P'.mergeAppend x'24 y'24)
      (P'.mergeAppend x'25 y'25)
      (P'.mergeAppend x'26 y'26)
      (P'.mergeAppend x'27 y'27)
      (P'.mergeAppend x'28 y'28)
      (P'.mergeAppend x'29 y'29)
      (P'.mergeAppend x'30 y'30)
      (P'.mergeAppend x'31 y'31)
      (P'.mergeAppend x'32 y'32)
      (P'.mergeAppend x'33 y'33)
      (P'.mergeAppend x'34 y'34)
      (P'.mergeAppend x'35 y'35)
      (P'.mergeAppend x'36 y'36)
      (P'.mergeAppend x'37 y'37)
      (P'.mergeAppend x'38 y'38)
      (P'.mergeAppend x'39 y'39)
      (P'.mergeAppend x'40 y'40)
      (P'.mergeAppend x'41 y'41)
      (P'.mergeAppend x'42 y'42)
      (P'.mergeAppend x'43 y'43)
      (P'.mergeAppend x'44 y'44)

instance P'.Default ResourceStatistics where
  defaultValue
   = ResourceStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire ResourceStatistics where
  wireSize ft'
   self'@(ResourceStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22
           x'23 x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 1 x'1 + P'.wireSizeOpt 2 13 x'2 + P'.wireSizeOpt 2 13 x'3 + P'.wireSizeOpt 1 1 x'4 +
             P'.wireSizeOpt 1 1 x'5
             + P'.wireSizeOpt 1 1 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 1 x'9
             + P'.wireSizeOpt 2 4 x'10
             + P'.wireSizeOpt 2 4 x'11
             + P'.wireSizeOpt 1 4 x'12
             + P'.wireSizeOpt 2 4 x'13
             + P'.wireSizeOpt 1 4 x'14
             + P'.wireSizeOpt 1 4 x'15
             + P'.wireSizeOpt 2 4 x'16
             + P'.wireSizeOpt 1 4 x'17
             + P'.wireSizeOpt 1 4 x'18
             + P'.wireSizeOpt 2 4 x'19
             + P'.wireSizeOpt 2 4 x'20
             + P'.wireSizeOpt 2 4 x'21
             + P'.wireSizeOpt 2 4 x'22
             + P'.wireSizeOpt 2 4 x'23
             + P'.wireSizeOpt 2 4 x'24
             + P'.wireSizeOpt 2 4 x'25
             + P'.wireSizeRep 2 11 x'26
             + P'.wireSizeOpt 2 11 x'27
             + P'.wireSizeOpt 1 11 x'28
             + P'.wireSizeOpt 1 4 x'29
             + P'.wireSizeOpt 1 4 x'30
             + P'.wireSizeOpt 2 4 x'31
             + P'.wireSizeOpt 2 4 x'32
             + P'.wireSizeOpt 2 4 x'33
             + P'.wireSizeOpt 2 4 x'34
             + P'.wireSizeOpt 2 4 x'35
             + P'.wireSizeOpt 2 4 x'36
             + P'.wireSizeOpt 2 1 x'37
             + P'.wireSizeOpt 2 1 x'38
             + P'.wireSizeOpt 2 1 x'39
             + P'.wireSizeOpt 2 1 x'40
             + P'.wireSizeOpt 2 1 x'41
             + P'.wireSizeOpt 2 1 x'42
             + P'.wireSizeRep 2 11 x'43
             + P'.wireSizeOpt 2 11 x'44)
  wirePutWithSize ft'
   self'@(ResourceStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22
           x'23 x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 9 1 x'1, P'.wirePutOptWithSize 17 1 x'4, P'.wirePutOptWithSize 25 1 x'5,
             P'.wirePutOptWithSize 33 1 x'6, P'.wirePutOptWithSize 40 4 x'17, P'.wirePutOptWithSize 48 4 x'12,
             P'.wirePutOptWithSize 56 13 x'7, P'.wirePutOptWithSize 64 13 x'8, P'.wirePutOptWithSize 73 1 x'9,
             P'.wirePutOptWithSize 80 4 x'14, P'.wirePutOptWithSize 88 4 x'15, P'.wirePutOptWithSize 96 4 x'18,
             P'.wirePutOptWithSize 106 11 x'28, P'.wirePutOptWithSize 112 4 x'29, P'.wirePutOptWithSize 120 4 x'30,
             P'.wirePutOptWithSize 128 4 x'31, P'.wirePutOptWithSize 136 4 x'32, P'.wirePutOptWithSize 144 4 x'33,
             P'.wirePutOptWithSize 152 4 x'34, P'.wirePutOptWithSize 160 4 x'35, P'.wirePutOptWithSize 168 4 x'36,
             P'.wirePutOptWithSize 177 1 x'37, P'.wirePutOptWithSize 185 1 x'38, P'.wirePutOptWithSize 193 1 x'39,
             P'.wirePutOptWithSize 201 1 x'40, P'.wirePutOptWithSize 208 4 x'24, P'.wirePutOptWithSize 216 4 x'25,
             P'.wirePutOptWithSize 225 1 x'41, P'.wirePutOptWithSize 233 1 x'42, P'.wirePutOptWithSize 240 13 x'2,
             P'.wirePutOptWithSize 248 13 x'3, P'.wirePutOptWithSize 256 4 x'21, P'.wirePutOptWithSize 264 4 x'22,
             P'.wirePutOptWithSize 272 4 x'23, P'.wirePutRepWithSize 282 11 x'43, P'.wirePutOptWithSize 288 4 x'10,
             P'.wirePutOptWithSize 296 4 x'11, P'.wirePutOptWithSize 304 4 x'13, P'.wirePutOptWithSize 312 4 x'16,
             P'.wirePutOptWithSize 320 4 x'19, P'.wirePutOptWithSize 328 4 x'20, P'.wirePutOptWithSize 338 11 x'44,
             P'.wirePutRepWithSize 346 11 x'26, P'.wirePutOptWithSize 354 11 x'27]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Size, put'Fields]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown' P'.discardUnknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             9 -> Prelude'.fmap (\ !new'Field -> old'Self{_timestamp = new'Field}) (P'.wireGet 1)
             240 -> Prelude'.fmap (\ !new'Field -> old'Self{_processes = Prelude'.Just new'Field}) (P'.wireGet 13)
             248 -> Prelude'.fmap (\ !new'Field -> old'Self{_threads = Prelude'.Just new'Field}) (P'.wireGet 13)
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpus_user_time_secs = Prelude'.Just new'Field}) (P'.wireGet 1)
             25 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpus_system_time_secs = Prelude'.Just new'Field}) (P'.wireGet 1)
             33 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpus_limit = Prelude'.Just new'Field}) (P'.wireGet 1)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpus_nr_periods = Prelude'.Just new'Field}) (P'.wireGet 13)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpus_nr_throttled = Prelude'.Just new'Field}) (P'.wireGet 13)
             73 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpus_throttled_time_secs = Prelude'.Just new'Field}) (P'.wireGet 1)
             288 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_total_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             296 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_total_memsw_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_limit_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             304 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_soft_limit_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_file_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_anon_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             312 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_cache_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_rss_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_mapped_file_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             320 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_swap_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             328 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_unevictable_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             256 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_low_pressure_counter = Prelude'.Just new'Field}) (P'.wireGet 4)
             264 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_medium_pressure_counter = Prelude'.Just new'Field}) (P'.wireGet 4)
             272 -> Prelude'.fmap (\ !new'Field -> old'Self{_mem_critical_pressure_counter = Prelude'.Just new'Field})
                     (P'.wireGet 4)
             208 -> Prelude'.fmap (\ !new'Field -> old'Self{_disk_limit_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             216 -> Prelude'.fmap (\ !new'Field -> old'Self{_disk_used_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             346 -> Prelude'.fmap (\ !new'Field -> old'Self{_disk_statistics = P'.append (_disk_statistics old'Self) new'Field})
                     (P'.wireGet 11)
             354 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_blkio_statistics = P'.mergeAppend (_blkio_statistics old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             106 -> Prelude'.fmap (\ !new'Field -> old'Self{_perf = P'.mergeAppend (_perf old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_rx_packets = Prelude'.Just new'Field}) (P'.wireGet 4)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_rx_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_rx_errors = Prelude'.Just new'Field}) (P'.wireGet 4)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_rx_dropped = Prelude'.Just new'Field}) (P'.wireGet 4)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tx_packets = Prelude'.Just new'Field}) (P'.wireGet 4)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tx_bytes = Prelude'.Just new'Field}) (P'.wireGet 4)
             160 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tx_errors = Prelude'.Just new'Field}) (P'.wireGet 4)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tx_dropped = Prelude'.Just new'Field}) (P'.wireGet 4)
             177 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tcp_rtt_microsecs_p50 = Prelude'.Just new'Field}) (P'.wireGet 1)
             185 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tcp_rtt_microsecs_p90 = Prelude'.Just new'Field}) (P'.wireGet 1)
             193 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tcp_rtt_microsecs_p95 = Prelude'.Just new'Field}) (P'.wireGet 1)
             201 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tcp_rtt_microsecs_p99 = Prelude'.Just new'Field}) (P'.wireGet 1)
             225 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tcp_active_connections = Prelude'.Just new'Field}) (P'.wireGet 1)
             233 -> Prelude'.fmap (\ !new'Field -> old'Self{_net_tcp_time_wait_connections = Prelude'.Just new'Field})
                     (P'.wireGet 1)
             282 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_net_traffic_control_statistics = P'.append (_net_traffic_control_statistics old'Self) new'Field})
                     (P'.wireGet 11)
             338 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{_net_snmp_statistics = P'.mergeAppend (_net_snmp_statistics old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> ResourceStatistics) ResourceStatistics where
  getVal m' f' = f' m'

instance P'.GPB ResourceStatistics

instance P'.ReflectDescriptor ResourceStatistics where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [9])
      (P'.fromDistinctAscList
        [9, 17, 25, 33, 40, 48, 56, 64, 73, 80, 88, 96, 106, 112, 120, 128, 136, 144, 152, 160, 168, 177, 185, 193, 201, 208, 216,
         225, 233, 240, 248, 256, 264, 272, 282, 288, 296, 304, 312, 320, 328, 338, 346, 354])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.ResourceStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"ResourceStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"ResourceStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.timestamp\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"timestamp\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.processes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"processes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 240}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.threads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"threads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 248}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.cpus_user_time_secs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"cpus_user_time_secs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.cpus_system_time_secs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"cpus_system_time_secs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.cpus_limit\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"cpus_limit\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.cpus_nr_periods\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"cpus_nr_periods\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.cpus_nr_throttled\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"cpus_nr_throttled\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.cpus_throttled_time_secs\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"cpus_throttled_time_secs\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 73}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_total_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_total_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 36}, wireTag = WireTag {getWireTag = 288}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_total_memsw_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_total_memsw_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 37}, wireTag = WireTag {getWireTag = 296}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_limit_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_limit_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_soft_limit_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_soft_limit_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 38}, wireTag = WireTag {getWireTag = 304}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_file_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_file_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_anon_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_anon_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_cache_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_cache_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 39}, wireTag = WireTag {getWireTag = 312}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_rss_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_rss_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_mapped_file_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_mapped_file_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_swap_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_swap_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 40}, wireTag = WireTag {getWireTag = 320}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_unevictable_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_unevictable_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 41}, wireTag = WireTag {getWireTag = 328}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_low_pressure_counter\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_low_pressure_counter\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 256}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_medium_pressure_counter\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_medium_pressure_counter\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 264}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.mem_critical_pressure_counter\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"mem_critical_pressure_counter\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 272}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.disk_limit_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"disk_limit_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 208}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.disk_used_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"disk_used_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 216}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.disk_statistics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"disk_statistics\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 43}, wireTag = WireTag {getWireTag = 346}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.DiskStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"DiskStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.blkio_statistics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"blkio_statistics\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 44}, wireTag = WireTag {getWireTag = 354}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.Statistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"Statistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.perf\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"perf\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.PerfStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"PerfStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_rx_packets\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_rx_packets\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_rx_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_rx_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_rx_errors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_rx_errors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_rx_dropped\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_rx_dropped\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tx_packets\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tx_packets\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tx_bytes\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tx_bytes\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tx_errors\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tx_errors\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 160}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tx_dropped\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tx_dropped\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tcp_rtt_microsecs_p50\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tcp_rtt_microsecs_p50\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 177}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tcp_rtt_microsecs_p90\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tcp_rtt_microsecs_p90\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 185}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tcp_rtt_microsecs_p95\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tcp_rtt_microsecs_p95\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 193}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tcp_rtt_microsecs_p99\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tcp_rtt_microsecs_p99\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 25}, wireTag = WireTag {getWireTag = 201}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tcp_active_connections\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tcp_active_connections\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 28}, wireTag = WireTag {getWireTag = 225}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_tcp_time_wait_connections\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_tcp_time_wait_connections\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 233}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_traffic_control_statistics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_traffic_control_statistics\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 282}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.TrafficControlStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"TrafficControlStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.ResourceStatistics.net_snmp_statistics\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"ResourceStatistics\"], baseName' = FName \"net_snmp_statistics\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 42}, wireTag = WireTag {getWireTag = 338}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".mesos.v1.SNMPStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"SNMPStatistics\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType ResourceStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg ResourceStatistics where
  textPut msg
   = do
       P'.tellT "timestamp" (_timestamp msg)
       P'.tellT "processes" (_processes msg)
       P'.tellT "threads" (_threads msg)
       P'.tellT "cpus_user_time_secs" (_cpus_user_time_secs msg)
       P'.tellT "cpus_system_time_secs" (_cpus_system_time_secs msg)
       P'.tellT "cpus_limit" (_cpus_limit msg)
       P'.tellT "cpus_nr_periods" (_cpus_nr_periods msg)
       P'.tellT "cpus_nr_throttled" (_cpus_nr_throttled msg)
       P'.tellT "cpus_throttled_time_secs" (_cpus_throttled_time_secs msg)
       P'.tellT "mem_total_bytes" (_mem_total_bytes msg)
       P'.tellT "mem_total_memsw_bytes" (_mem_total_memsw_bytes msg)
       P'.tellT "mem_limit_bytes" (_mem_limit_bytes msg)
       P'.tellT "mem_soft_limit_bytes" (_mem_soft_limit_bytes msg)
       P'.tellT "mem_file_bytes" (_mem_file_bytes msg)
       P'.tellT "mem_anon_bytes" (_mem_anon_bytes msg)
       P'.tellT "mem_cache_bytes" (_mem_cache_bytes msg)
       P'.tellT "mem_rss_bytes" (_mem_rss_bytes msg)
       P'.tellT "mem_mapped_file_bytes" (_mem_mapped_file_bytes msg)
       P'.tellT "mem_swap_bytes" (_mem_swap_bytes msg)
       P'.tellT "mem_unevictable_bytes" (_mem_unevictable_bytes msg)
       P'.tellT "mem_low_pressure_counter" (_mem_low_pressure_counter msg)
       P'.tellT "mem_medium_pressure_counter" (_mem_medium_pressure_counter msg)
       P'.tellT "mem_critical_pressure_counter" (_mem_critical_pressure_counter msg)
       P'.tellT "disk_limit_bytes" (_disk_limit_bytes msg)
       P'.tellT "disk_used_bytes" (_disk_used_bytes msg)
       P'.tellT "disk_statistics" (_disk_statistics msg)
       P'.tellT "blkio_statistics" (_blkio_statistics msg)
       P'.tellT "perf" (_perf msg)
       P'.tellT "net_rx_packets" (_net_rx_packets msg)
       P'.tellT "net_rx_bytes" (_net_rx_bytes msg)
       P'.tellT "net_rx_errors" (_net_rx_errors msg)
       P'.tellT "net_rx_dropped" (_net_rx_dropped msg)
       P'.tellT "net_tx_packets" (_net_tx_packets msg)
       P'.tellT "net_tx_bytes" (_net_tx_bytes msg)
       P'.tellT "net_tx_errors" (_net_tx_errors msg)
       P'.tellT "net_tx_dropped" (_net_tx_dropped msg)
       P'.tellT "net_tcp_rtt_microsecs_p50" (_net_tcp_rtt_microsecs_p50 msg)
       P'.tellT "net_tcp_rtt_microsecs_p90" (_net_tcp_rtt_microsecs_p90 msg)
       P'.tellT "net_tcp_rtt_microsecs_p95" (_net_tcp_rtt_microsecs_p95 msg)
       P'.tellT "net_tcp_rtt_microsecs_p99" (_net_tcp_rtt_microsecs_p99 msg)
       P'.tellT "net_tcp_active_connections" (_net_tcp_active_connections msg)
       P'.tellT "net_tcp_time_wait_connections" (_net_tcp_time_wait_connections msg)
       P'.tellT "net_traffic_control_statistics" (_net_traffic_control_statistics msg)
       P'.tellT "net_snmp_statistics" (_net_snmp_statistics msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_timestamp, parse'_processes, parse'_threads, parse'_cpus_user_time_secs, parse'_cpus_system_time_secs,
                   parse'_cpus_limit, parse'_cpus_nr_periods, parse'_cpus_nr_throttled, parse'_cpus_throttled_time_secs,
                   parse'_mem_total_bytes, parse'_mem_total_memsw_bytes, parse'_mem_limit_bytes, parse'_mem_soft_limit_bytes,
                   parse'_mem_file_bytes, parse'_mem_anon_bytes, parse'_mem_cache_bytes, parse'_mem_rss_bytes,
                   parse'_mem_mapped_file_bytes, parse'_mem_swap_bytes, parse'_mem_unevictable_bytes,
                   parse'_mem_low_pressure_counter, parse'_mem_medium_pressure_counter, parse'_mem_critical_pressure_counter,
                   parse'_disk_limit_bytes, parse'_disk_used_bytes, parse'_disk_statistics, parse'_blkio_statistics, parse'_perf,
                   parse'_net_rx_packets, parse'_net_rx_bytes, parse'_net_rx_errors, parse'_net_rx_dropped, parse'_net_tx_packets,
                   parse'_net_tx_bytes, parse'_net_tx_errors, parse'_net_tx_dropped, parse'_net_tcp_rtt_microsecs_p50,
                   parse'_net_tcp_rtt_microsecs_p90, parse'_net_tcp_rtt_microsecs_p95, parse'_net_tcp_rtt_microsecs_p99,
                   parse'_net_tcp_active_connections, parse'_net_tcp_time_wait_connections, parse'_net_traffic_control_statistics,
                   parse'_net_snmp_statistics])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_timestamp
         = P'.try
            (do
               v <- P'.getT "timestamp"
               Prelude'.return (\ o -> o{_timestamp = v}))
        parse'_processes
         = P'.try
            (do
               v <- P'.getT "processes"
               Prelude'.return (\ o -> o{_processes = v}))
        parse'_threads
         = P'.try
            (do
               v <- P'.getT "threads"
               Prelude'.return (\ o -> o{_threads = v}))
        parse'_cpus_user_time_secs
         = P'.try
            (do
               v <- P'.getT "cpus_user_time_secs"
               Prelude'.return (\ o -> o{_cpus_user_time_secs = v}))
        parse'_cpus_system_time_secs
         = P'.try
            (do
               v <- P'.getT "cpus_system_time_secs"
               Prelude'.return (\ o -> o{_cpus_system_time_secs = v}))
        parse'_cpus_limit
         = P'.try
            (do
               v <- P'.getT "cpus_limit"
               Prelude'.return (\ o -> o{_cpus_limit = v}))
        parse'_cpus_nr_periods
         = P'.try
            (do
               v <- P'.getT "cpus_nr_periods"
               Prelude'.return (\ o -> o{_cpus_nr_periods = v}))
        parse'_cpus_nr_throttled
         = P'.try
            (do
               v <- P'.getT "cpus_nr_throttled"
               Prelude'.return (\ o -> o{_cpus_nr_throttled = v}))
        parse'_cpus_throttled_time_secs
         = P'.try
            (do
               v <- P'.getT "cpus_throttled_time_secs"
               Prelude'.return (\ o -> o{_cpus_throttled_time_secs = v}))
        parse'_mem_total_bytes
         = P'.try
            (do
               v <- P'.getT "mem_total_bytes"
               Prelude'.return (\ o -> o{_mem_total_bytes = v}))
        parse'_mem_total_memsw_bytes
         = P'.try
            (do
               v <- P'.getT "mem_total_memsw_bytes"
               Prelude'.return (\ o -> o{_mem_total_memsw_bytes = v}))
        parse'_mem_limit_bytes
         = P'.try
            (do
               v <- P'.getT "mem_limit_bytes"
               Prelude'.return (\ o -> o{_mem_limit_bytes = v}))
        parse'_mem_soft_limit_bytes
         = P'.try
            (do
               v <- P'.getT "mem_soft_limit_bytes"
               Prelude'.return (\ o -> o{_mem_soft_limit_bytes = v}))
        parse'_mem_file_bytes
         = P'.try
            (do
               v <- P'.getT "mem_file_bytes"
               Prelude'.return (\ o -> o{_mem_file_bytes = v}))
        parse'_mem_anon_bytes
         = P'.try
            (do
               v <- P'.getT "mem_anon_bytes"
               Prelude'.return (\ o -> o{_mem_anon_bytes = v}))
        parse'_mem_cache_bytes
         = P'.try
            (do
               v <- P'.getT "mem_cache_bytes"
               Prelude'.return (\ o -> o{_mem_cache_bytes = v}))
        parse'_mem_rss_bytes
         = P'.try
            (do
               v <- P'.getT "mem_rss_bytes"
               Prelude'.return (\ o -> o{_mem_rss_bytes = v}))
        parse'_mem_mapped_file_bytes
         = P'.try
            (do
               v <- P'.getT "mem_mapped_file_bytes"
               Prelude'.return (\ o -> o{_mem_mapped_file_bytes = v}))
        parse'_mem_swap_bytes
         = P'.try
            (do
               v <- P'.getT "mem_swap_bytes"
               Prelude'.return (\ o -> o{_mem_swap_bytes = v}))
        parse'_mem_unevictable_bytes
         = P'.try
            (do
               v <- P'.getT "mem_unevictable_bytes"
               Prelude'.return (\ o -> o{_mem_unevictable_bytes = v}))
        parse'_mem_low_pressure_counter
         = P'.try
            (do
               v <- P'.getT "mem_low_pressure_counter"
               Prelude'.return (\ o -> o{_mem_low_pressure_counter = v}))
        parse'_mem_medium_pressure_counter
         = P'.try
            (do
               v <- P'.getT "mem_medium_pressure_counter"
               Prelude'.return (\ o -> o{_mem_medium_pressure_counter = v}))
        parse'_mem_critical_pressure_counter
         = P'.try
            (do
               v <- P'.getT "mem_critical_pressure_counter"
               Prelude'.return (\ o -> o{_mem_critical_pressure_counter = v}))
        parse'_disk_limit_bytes
         = P'.try
            (do
               v <- P'.getT "disk_limit_bytes"
               Prelude'.return (\ o -> o{_disk_limit_bytes = v}))
        parse'_disk_used_bytes
         = P'.try
            (do
               v <- P'.getT "disk_used_bytes"
               Prelude'.return (\ o -> o{_disk_used_bytes = v}))
        parse'_disk_statistics
         = P'.try
            (do
               v <- P'.getT "disk_statistics"
               Prelude'.return (\ o -> o{_disk_statistics = P'.append (_disk_statistics o) v}))
        parse'_blkio_statistics
         = P'.try
            (do
               v <- P'.getT "blkio_statistics"
               Prelude'.return (\ o -> o{_blkio_statistics = v}))
        parse'_perf
         = P'.try
            (do
               v <- P'.getT "perf"
               Prelude'.return (\ o -> o{_perf = v}))
        parse'_net_rx_packets
         = P'.try
            (do
               v <- P'.getT "net_rx_packets"
               Prelude'.return (\ o -> o{_net_rx_packets = v}))
        parse'_net_rx_bytes
         = P'.try
            (do
               v <- P'.getT "net_rx_bytes"
               Prelude'.return (\ o -> o{_net_rx_bytes = v}))
        parse'_net_rx_errors
         = P'.try
            (do
               v <- P'.getT "net_rx_errors"
               Prelude'.return (\ o -> o{_net_rx_errors = v}))
        parse'_net_rx_dropped
         = P'.try
            (do
               v <- P'.getT "net_rx_dropped"
               Prelude'.return (\ o -> o{_net_rx_dropped = v}))
        parse'_net_tx_packets
         = P'.try
            (do
               v <- P'.getT "net_tx_packets"
               Prelude'.return (\ o -> o{_net_tx_packets = v}))
        parse'_net_tx_bytes
         = P'.try
            (do
               v <- P'.getT "net_tx_bytes"
               Prelude'.return (\ o -> o{_net_tx_bytes = v}))
        parse'_net_tx_errors
         = P'.try
            (do
               v <- P'.getT "net_tx_errors"
               Prelude'.return (\ o -> o{_net_tx_errors = v}))
        parse'_net_tx_dropped
         = P'.try
            (do
               v <- P'.getT "net_tx_dropped"
               Prelude'.return (\ o -> o{_net_tx_dropped = v}))
        parse'_net_tcp_rtt_microsecs_p50
         = P'.try
            (do
               v <- P'.getT "net_tcp_rtt_microsecs_p50"
               Prelude'.return (\ o -> o{_net_tcp_rtt_microsecs_p50 = v}))
        parse'_net_tcp_rtt_microsecs_p90
         = P'.try
            (do
               v <- P'.getT "net_tcp_rtt_microsecs_p90"
               Prelude'.return (\ o -> o{_net_tcp_rtt_microsecs_p90 = v}))
        parse'_net_tcp_rtt_microsecs_p95
         = P'.try
            (do
               v <- P'.getT "net_tcp_rtt_microsecs_p95"
               Prelude'.return (\ o -> o{_net_tcp_rtt_microsecs_p95 = v}))
        parse'_net_tcp_rtt_microsecs_p99
         = P'.try
            (do
               v <- P'.getT "net_tcp_rtt_microsecs_p99"
               Prelude'.return (\ o -> o{_net_tcp_rtt_microsecs_p99 = v}))
        parse'_net_tcp_active_connections
         = P'.try
            (do
               v <- P'.getT "net_tcp_active_connections"
               Prelude'.return (\ o -> o{_net_tcp_active_connections = v}))
        parse'_net_tcp_time_wait_connections
         = P'.try
            (do
               v <- P'.getT "net_tcp_time_wait_connections"
               Prelude'.return (\ o -> o{_net_tcp_time_wait_connections = v}))
        parse'_net_traffic_control_statistics
         = P'.try
            (do
               v <- P'.getT "net_traffic_control_statistics"
               Prelude'.return (\ o -> o{_net_traffic_control_statistics = P'.append (_net_traffic_control_statistics o) v}))
        parse'_net_snmp_statistics
         = P'.try
            (do
               v <- P'.getT "net_snmp_statistics"
               Prelude'.return (\ o -> o{_net_snmp_statistics = v}))