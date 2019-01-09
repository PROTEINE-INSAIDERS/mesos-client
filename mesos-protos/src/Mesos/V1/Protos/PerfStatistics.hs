{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.PerfStatistics
       (PerfStatistics(..), timestamp, duration, cycles, stalled_cycles_frontend, stalled_cycles_backend, instructions,
        cache_references, cache_misses, branches, branch_misses, bus_cycles, ref_cycles, cpu_clock, task_clock, page_faults,
        minor_faults, major_faults, context_switches, cpu_migrations, alignment_faults, emulation_faults, l1_dcache_loads,
        l1_dcache_load_misses, l1_dcache_stores, l1_dcache_store_misses, l1_dcache_prefetches, l1_dcache_prefetch_misses,
        l1_icache_loads, l1_icache_load_misses, l1_icache_prefetches, l1_icache_prefetch_misses, llc_loads, llc_load_misses,
        llc_stores, llc_store_misses, llc_prefetches, llc_prefetch_misses, dtlb_loads, dtlb_load_misses, dtlb_stores,
        dtlb_store_misses, dtlb_prefetches, dtlb_prefetch_misses, itlb_loads, itlb_load_misses, branch_loads, branch_load_misses,
        node_loads, node_load_misses, node_stores, node_store_misses, node_prefetches, node_prefetch_misses)
       where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data PerfStatistics = PerfStatistics{_timestamp :: !(P'.Double), _duration :: !(P'.Double), _cycles :: !(P'.Maybe P'.Word64),
                                     _stalled_cycles_frontend :: !(P'.Maybe P'.Word64),
                                     _stalled_cycles_backend :: !(P'.Maybe P'.Word64), _instructions :: !(P'.Maybe P'.Word64),
                                     _cache_references :: !(P'.Maybe P'.Word64), _cache_misses :: !(P'.Maybe P'.Word64),
                                     _branches :: !(P'.Maybe P'.Word64), _branch_misses :: !(P'.Maybe P'.Word64),
                                     _bus_cycles :: !(P'.Maybe P'.Word64), _ref_cycles :: !(P'.Maybe P'.Word64),
                                     _cpu_clock :: !(P'.Maybe P'.Double), _task_clock :: !(P'.Maybe P'.Double),
                                     _page_faults :: !(P'.Maybe P'.Word64), _minor_faults :: !(P'.Maybe P'.Word64),
                                     _major_faults :: !(P'.Maybe P'.Word64), _context_switches :: !(P'.Maybe P'.Word64),
                                     _cpu_migrations :: !(P'.Maybe P'.Word64), _alignment_faults :: !(P'.Maybe P'.Word64),
                                     _emulation_faults :: !(P'.Maybe P'.Word64), _l1_dcache_loads :: !(P'.Maybe P'.Word64),
                                     _l1_dcache_load_misses :: !(P'.Maybe P'.Word64), _l1_dcache_stores :: !(P'.Maybe P'.Word64),
                                     _l1_dcache_store_misses :: !(P'.Maybe P'.Word64),
                                     _l1_dcache_prefetches :: !(P'.Maybe P'.Word64),
                                     _l1_dcache_prefetch_misses :: !(P'.Maybe P'.Word64), _l1_icache_loads :: !(P'.Maybe P'.Word64),
                                     _l1_icache_load_misses :: !(P'.Maybe P'.Word64),
                                     _l1_icache_prefetches :: !(P'.Maybe P'.Word64),
                                     _l1_icache_prefetch_misses :: !(P'.Maybe P'.Word64), _llc_loads :: !(P'.Maybe P'.Word64),
                                     _llc_load_misses :: !(P'.Maybe P'.Word64), _llc_stores :: !(P'.Maybe P'.Word64),
                                     _llc_store_misses :: !(P'.Maybe P'.Word64), _llc_prefetches :: !(P'.Maybe P'.Word64),
                                     _llc_prefetch_misses :: !(P'.Maybe P'.Word64), _dtlb_loads :: !(P'.Maybe P'.Word64),
                                     _dtlb_load_misses :: !(P'.Maybe P'.Word64), _dtlb_stores :: !(P'.Maybe P'.Word64),
                                     _dtlb_store_misses :: !(P'.Maybe P'.Word64), _dtlb_prefetches :: !(P'.Maybe P'.Word64),
                                     _dtlb_prefetch_misses :: !(P'.Maybe P'.Word64), _itlb_loads :: !(P'.Maybe P'.Word64),
                                     _itlb_load_misses :: !(P'.Maybe P'.Word64), _branch_loads :: !(P'.Maybe P'.Word64),
                                     _branch_load_misses :: !(P'.Maybe P'.Word64), _node_loads :: !(P'.Maybe P'.Word64),
                                     _node_load_misses :: !(P'.Maybe P'.Word64), _node_stores :: !(P'.Maybe P'.Word64),
                                     _node_store_misses :: !(P'.Maybe P'.Word64), _node_prefetches :: !(P'.Maybe P'.Word64),
                                     _node_prefetch_misses :: !(P'.Maybe P'.Word64)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''PerfStatistics

instance P'.ToJSON PerfStatistics where
  toJSON msg
   = P'.objectNoEmpty
      ([("timestamp", P'.toJSON (timestamp msg)), ("duration", P'.toJSON (duration msg)),
        ("cycles", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (cycles msg))),
        ("stalled_cycles_frontend", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (stalled_cycles_frontend msg))),
        ("stalled_cycles_backend", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (stalled_cycles_backend msg))),
        ("instructions", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (instructions msg))),
        ("cache_references", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (cache_references msg))),
        ("cache_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (cache_misses msg))),
        ("branches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (branches msg))),
        ("branch_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (branch_misses msg))),
        ("bus_cycles", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (bus_cycles msg))),
        ("ref_cycles", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (ref_cycles msg))),
        ("cpu_clock", P'.toJSON (Prelude'.fmap P'.toJSON (cpu_clock msg))),
        ("task_clock", P'.toJSON (Prelude'.fmap P'.toJSON (task_clock msg))),
        ("page_faults", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (page_faults msg))),
        ("minor_faults", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (minor_faults msg))),
        ("major_faults", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (major_faults msg))),
        ("context_switches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (context_switches msg))),
        ("cpu_migrations", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (cpu_migrations msg))),
        ("alignment_faults", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (alignment_faults msg))),
        ("emulation_faults", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (emulation_faults msg))),
        ("l1_dcache_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_dcache_loads msg))),
        ("l1_dcache_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_dcache_load_misses msg))),
        ("l1_dcache_stores", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_dcache_stores msg))),
        ("l1_dcache_store_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_dcache_store_misses msg))),
        ("l1_dcache_prefetches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_dcache_prefetches msg))),
        ("l1_dcache_prefetch_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_dcache_prefetch_misses msg))),
        ("l1_icache_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_icache_loads msg))),
        ("l1_icache_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_icache_load_misses msg))),
        ("l1_icache_prefetches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_icache_prefetches msg))),
        ("l1_icache_prefetch_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (l1_icache_prefetch_misses msg))),
        ("llc_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (llc_loads msg))),
        ("llc_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (llc_load_misses msg))),
        ("llc_stores", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (llc_stores msg))),
        ("llc_store_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (llc_store_misses msg))),
        ("llc_prefetches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (llc_prefetches msg))),
        ("llc_prefetch_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (llc_prefetch_misses msg))),
        ("dtlb_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (dtlb_loads msg))),
        ("dtlb_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (dtlb_load_misses msg))),
        ("dtlb_stores", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (dtlb_stores msg))),
        ("dtlb_store_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (dtlb_store_misses msg))),
        ("dtlb_prefetches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (dtlb_prefetches msg))),
        ("dtlb_prefetch_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (dtlb_prefetch_misses msg))),
        ("itlb_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (itlb_loads msg))),
        ("itlb_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (itlb_load_misses msg))),
        ("branch_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (branch_loads msg))),
        ("branch_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (branch_load_misses msg))),
        ("node_loads", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (node_loads msg))),
        ("node_load_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (node_load_misses msg))),
        ("node_stores", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (node_stores msg))),
        ("node_store_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (node_store_misses msg))),
        ("node_prefetches", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (node_prefetches msg))),
        ("node_prefetch_misses", P'.toJSON (Prelude'.fmap P'.toJSONShowWithPayload (node_prefetch_misses msg)))]
        ++ Prelude'.concat [])

instance P'.FromJSON PerfStatistics where
  parseJSON
   = P'.withObject "PerfStatistics"
      (\ o ->
        do
          timestamp <- P'.explicitParseField P'.parseJSON o "timestamp"
          duration <- P'.explicitParseField P'.parseJSON o "duration"
          cycles <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "cycles"
          stalled_cycles_frontend <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "stalled_cycles_frontend"
          stalled_cycles_backend <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "stalled_cycles_backend"
          instructions <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "instructions"
          cache_references <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "cache_references"
          cache_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "cache_misses"
          branches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "branches"
          branch_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "branch_misses"
          bus_cycles <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "bus_cycles"
          ref_cycles <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "ref_cycles"
          cpu_clock <- P'.explicitParseFieldMaybe P'.parseJSON o "cpu_clock"
          task_clock <- P'.explicitParseFieldMaybe P'.parseJSON o "task_clock"
          page_faults <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "page_faults"
          minor_faults <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "minor_faults"
          major_faults <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "major_faults"
          context_switches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "context_switches"
          cpu_migrations <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "cpu_migrations"
          alignment_faults <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "alignment_faults"
          emulation_faults <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "emulation_faults"
          l1_dcache_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_dcache_loads"
          l1_dcache_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_dcache_load_misses"
          l1_dcache_stores <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_dcache_stores"
          l1_dcache_store_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_dcache_store_misses"
          l1_dcache_prefetches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_dcache_prefetches"
          l1_dcache_prefetch_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o
                                        "l1_dcache_prefetch_misses"
          l1_icache_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_icache_loads"
          l1_icache_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_icache_load_misses"
          l1_icache_prefetches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "l1_icache_prefetches"
          l1_icache_prefetch_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o
                                        "l1_icache_prefetch_misses"
          llc_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "llc_loads"
          llc_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "llc_load_misses"
          llc_stores <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "llc_stores"
          llc_store_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "llc_store_misses"
          llc_prefetches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "llc_prefetches"
          llc_prefetch_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "llc_prefetch_misses"
          dtlb_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "dtlb_loads"
          dtlb_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "dtlb_load_misses"
          dtlb_stores <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "dtlb_stores"
          dtlb_store_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "dtlb_store_misses"
          dtlb_prefetches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "dtlb_prefetches"
          dtlb_prefetch_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "dtlb_prefetch_misses"
          itlb_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "itlb_loads"
          itlb_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "itlb_load_misses"
          branch_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "branch_loads"
          branch_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "branch_load_misses"
          node_loads <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "node_loads"
          node_load_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "node_load_misses"
          node_stores <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "node_stores"
          node_store_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "node_store_misses"
          node_prefetches <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "node_prefetches"
          node_prefetch_misses <- P'.explicitParseFieldMaybe (P'.parseJSONReadWithPayload "uint64") o "node_prefetch_misses"
          Prelude'.return
           P'.defaultValue{_timestamp = timestamp, _duration = duration, _cycles = cycles,
                           _stalled_cycles_frontend = stalled_cycles_frontend, _stalled_cycles_backend = stalled_cycles_backend,
                           _instructions = instructions, _cache_references = cache_references, _cache_misses = cache_misses,
                           _branches = branches, _branch_misses = branch_misses, _bus_cycles = bus_cycles, _ref_cycles = ref_cycles,
                           _cpu_clock = cpu_clock, _task_clock = task_clock, _page_faults = page_faults,
                           _minor_faults = minor_faults, _major_faults = major_faults, _context_switches = context_switches,
                           _cpu_migrations = cpu_migrations, _alignment_faults = alignment_faults,
                           _emulation_faults = emulation_faults, _l1_dcache_loads = l1_dcache_loads,
                           _l1_dcache_load_misses = l1_dcache_load_misses, _l1_dcache_stores = l1_dcache_stores,
                           _l1_dcache_store_misses = l1_dcache_store_misses, _l1_dcache_prefetches = l1_dcache_prefetches,
                           _l1_dcache_prefetch_misses = l1_dcache_prefetch_misses, _l1_icache_loads = l1_icache_loads,
                           _l1_icache_load_misses = l1_icache_load_misses, _l1_icache_prefetches = l1_icache_prefetches,
                           _l1_icache_prefetch_misses = l1_icache_prefetch_misses, _llc_loads = llc_loads,
                           _llc_load_misses = llc_load_misses, _llc_stores = llc_stores, _llc_store_misses = llc_store_misses,
                           _llc_prefetches = llc_prefetches, _llc_prefetch_misses = llc_prefetch_misses, _dtlb_loads = dtlb_loads,
                           _dtlb_load_misses = dtlb_load_misses, _dtlb_stores = dtlb_stores, _dtlb_store_misses = dtlb_store_misses,
                           _dtlb_prefetches = dtlb_prefetches, _dtlb_prefetch_misses = dtlb_prefetch_misses,
                           _itlb_loads = itlb_loads, _itlb_load_misses = itlb_load_misses, _branch_loads = branch_loads,
                           _branch_load_misses = branch_load_misses, _node_loads = node_loads, _node_load_misses = node_load_misses,
                           _node_stores = node_stores, _node_store_misses = node_store_misses, _node_prefetches = node_prefetches,
                           _node_prefetch_misses = node_prefetch_misses})

instance P'.Mergeable PerfStatistics where
  mergeAppend
   (PerfStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
     x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44 x'45 x'46 x'47 x'48 x'49
     x'50 x'51 x'52 x'53)
   (PerfStatistics y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24
     y'25 y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38 y'39 y'40 y'41 y'42 y'43 y'44 y'45 y'46 y'47 y'48 y'49
     y'50 y'51 y'52 y'53)
   = PerfStatistics (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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
      (P'.mergeAppend x'45 y'45)
      (P'.mergeAppend x'46 y'46)
      (P'.mergeAppend x'47 y'47)
      (P'.mergeAppend x'48 y'48)
      (P'.mergeAppend x'49 y'49)
      (P'.mergeAppend x'50 y'50)
      (P'.mergeAppend x'51 y'51)
      (P'.mergeAppend x'52 y'52)
      (P'.mergeAppend x'53 y'53)

instance P'.Default PerfStatistics where
  defaultValue
   = PerfStatistics P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
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
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue

instance P'.Wire PerfStatistics where
  wireSize ft'
   self'@(PerfStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44 x'45 x'46 x'47
           x'48 x'49 x'50 x'51 x'52 x'53)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 1 x'1 + P'.wireSizeReq 1 1 x'2 + P'.wireSizeOpt 1 4 x'3 + P'.wireSizeOpt 1 4 x'4 +
             P'.wireSizeOpt 1 4 x'5
             + P'.wireSizeOpt 1 4 x'6
             + P'.wireSizeOpt 1 4 x'7
             + P'.wireSizeOpt 1 4 x'8
             + P'.wireSizeOpt 1 4 x'9
             + P'.wireSizeOpt 1 4 x'10
             + P'.wireSizeOpt 1 4 x'11
             + P'.wireSizeOpt 1 4 x'12
             + P'.wireSizeOpt 1 1 x'13
             + P'.wireSizeOpt 1 1 x'14
             + P'.wireSizeOpt 1 4 x'15
             + P'.wireSizeOpt 2 4 x'16
             + P'.wireSizeOpt 2 4 x'17
             + P'.wireSizeOpt 2 4 x'18
             + P'.wireSizeOpt 2 4 x'19
             + P'.wireSizeOpt 2 4 x'20
             + P'.wireSizeOpt 2 4 x'21
             + P'.wireSizeOpt 2 4 x'22
             + P'.wireSizeOpt 2 4 x'23
             + P'.wireSizeOpt 2 4 x'24
             + P'.wireSizeOpt 2 4 x'25
             + P'.wireSizeOpt 2 4 x'26
             + P'.wireSizeOpt 2 4 x'27
             + P'.wireSizeOpt 2 4 x'28
             + P'.wireSizeOpt 2 4 x'29
             + P'.wireSizeOpt 2 4 x'30
             + P'.wireSizeOpt 2 4 x'31
             + P'.wireSizeOpt 2 4 x'32
             + P'.wireSizeOpt 2 4 x'33
             + P'.wireSizeOpt 2 4 x'34
             + P'.wireSizeOpt 2 4 x'35
             + P'.wireSizeOpt 2 4 x'36
             + P'.wireSizeOpt 2 4 x'37
             + P'.wireSizeOpt 2 4 x'38
             + P'.wireSizeOpt 2 4 x'39
             + P'.wireSizeOpt 2 4 x'40
             + P'.wireSizeOpt 2 4 x'41
             + P'.wireSizeOpt 2 4 x'42
             + P'.wireSizeOpt 2 4 x'43
             + P'.wireSizeOpt 2 4 x'44
             + P'.wireSizeOpt 2 4 x'45
             + P'.wireSizeOpt 2 4 x'46
             + P'.wireSizeOpt 2 4 x'47
             + P'.wireSizeOpt 2 4 x'48
             + P'.wireSizeOpt 2 4 x'49
             + P'.wireSizeOpt 2 4 x'50
             + P'.wireSizeOpt 2 4 x'51
             + P'.wireSizeOpt 2 4 x'52
             + P'.wireSizeOpt 2 4 x'53)
  wirePutWithSize ft'
   self'@(PerfStatistics x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44 x'45 x'46 x'47
           x'48 x'49 x'50 x'51 x'52 x'53)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutReqWithSize 9 1 x'1, P'.wirePutReqWithSize 17 1 x'2, P'.wirePutOptWithSize 24 4 x'3,
             P'.wirePutOptWithSize 32 4 x'4, P'.wirePutOptWithSize 40 4 x'5, P'.wirePutOptWithSize 48 4 x'6,
             P'.wirePutOptWithSize 56 4 x'7, P'.wirePutOptWithSize 64 4 x'8, P'.wirePutOptWithSize 72 4 x'9,
             P'.wirePutOptWithSize 80 4 x'10, P'.wirePutOptWithSize 88 4 x'11, P'.wirePutOptWithSize 96 4 x'12,
             P'.wirePutOptWithSize 105 1 x'13, P'.wirePutOptWithSize 113 1 x'14, P'.wirePutOptWithSize 120 4 x'15,
             P'.wirePutOptWithSize 128 4 x'16, P'.wirePutOptWithSize 136 4 x'17, P'.wirePutOptWithSize 144 4 x'18,
             P'.wirePutOptWithSize 152 4 x'19, P'.wirePutOptWithSize 160 4 x'20, P'.wirePutOptWithSize 168 4 x'21,
             P'.wirePutOptWithSize 176 4 x'22, P'.wirePutOptWithSize 184 4 x'23, P'.wirePutOptWithSize 192 4 x'24,
             P'.wirePutOptWithSize 200 4 x'25, P'.wirePutOptWithSize 208 4 x'26, P'.wirePutOptWithSize 216 4 x'27,
             P'.wirePutOptWithSize 224 4 x'28, P'.wirePutOptWithSize 232 4 x'29, P'.wirePutOptWithSize 240 4 x'30,
             P'.wirePutOptWithSize 248 4 x'31, P'.wirePutOptWithSize 256 4 x'32, P'.wirePutOptWithSize 264 4 x'33,
             P'.wirePutOptWithSize 272 4 x'34, P'.wirePutOptWithSize 280 4 x'35, P'.wirePutOptWithSize 288 4 x'36,
             P'.wirePutOptWithSize 296 4 x'37, P'.wirePutOptWithSize 304 4 x'38, P'.wirePutOptWithSize 312 4 x'39,
             P'.wirePutOptWithSize 320 4 x'40, P'.wirePutOptWithSize 328 4 x'41, P'.wirePutOptWithSize 336 4 x'42,
             P'.wirePutOptWithSize 344 4 x'43, P'.wirePutOptWithSize 352 4 x'44, P'.wirePutOptWithSize 360 4 x'45,
             P'.wirePutOptWithSize 368 4 x'46, P'.wirePutOptWithSize 376 4 x'47, P'.wirePutOptWithSize 384 4 x'48,
             P'.wirePutOptWithSize 392 4 x'49, P'.wirePutOptWithSize 400 4 x'50, P'.wirePutOptWithSize 408 4 x'51,
             P'.wirePutOptWithSize 416 4 x'52, P'.wirePutOptWithSize 424 4 x'53]
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
             17 -> Prelude'.fmap (\ !new'Field -> old'Self{_duration = new'Field}) (P'.wireGet 1)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{_cycles = Prelude'.Just new'Field}) (P'.wireGet 4)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{_stalled_cycles_frontend = Prelude'.Just new'Field}) (P'.wireGet 4)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{_stalled_cycles_backend = Prelude'.Just new'Field}) (P'.wireGet 4)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{_instructions = Prelude'.Just new'Field}) (P'.wireGet 4)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{_cache_references = Prelude'.Just new'Field}) (P'.wireGet 4)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{_cache_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{_branches = Prelude'.Just new'Field}) (P'.wireGet 4)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{_branch_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{_bus_cycles = Prelude'.Just new'Field}) (P'.wireGet 4)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{_ref_cycles = Prelude'.Just new'Field}) (P'.wireGet 4)
             105 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpu_clock = Prelude'.Just new'Field}) (P'.wireGet 1)
             113 -> Prelude'.fmap (\ !new'Field -> old'Self{_task_clock = Prelude'.Just new'Field}) (P'.wireGet 1)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{_page_faults = Prelude'.Just new'Field}) (P'.wireGet 4)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{_minor_faults = Prelude'.Just new'Field}) (P'.wireGet 4)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{_major_faults = Prelude'.Just new'Field}) (P'.wireGet 4)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{_context_switches = Prelude'.Just new'Field}) (P'.wireGet 4)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{_cpu_migrations = Prelude'.Just new'Field}) (P'.wireGet 4)
             160 -> Prelude'.fmap (\ !new'Field -> old'Self{_alignment_faults = Prelude'.Just new'Field}) (P'.wireGet 4)
             168 -> Prelude'.fmap (\ !new'Field -> old'Self{_emulation_faults = Prelude'.Just new'Field}) (P'.wireGet 4)
             176 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_dcache_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             184 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_dcache_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             192 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_dcache_stores = Prelude'.Just new'Field}) (P'.wireGet 4)
             200 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_dcache_store_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             208 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_dcache_prefetches = Prelude'.Just new'Field}) (P'.wireGet 4)
             216 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_dcache_prefetch_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             224 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_icache_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             232 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_icache_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             240 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_icache_prefetches = Prelude'.Just new'Field}) (P'.wireGet 4)
             248 -> Prelude'.fmap (\ !new'Field -> old'Self{_l1_icache_prefetch_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             256 -> Prelude'.fmap (\ !new'Field -> old'Self{_llc_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             264 -> Prelude'.fmap (\ !new'Field -> old'Self{_llc_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             272 -> Prelude'.fmap (\ !new'Field -> old'Self{_llc_stores = Prelude'.Just new'Field}) (P'.wireGet 4)
             280 -> Prelude'.fmap (\ !new'Field -> old'Self{_llc_store_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             288 -> Prelude'.fmap (\ !new'Field -> old'Self{_llc_prefetches = Prelude'.Just new'Field}) (P'.wireGet 4)
             296 -> Prelude'.fmap (\ !new'Field -> old'Self{_llc_prefetch_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             304 -> Prelude'.fmap (\ !new'Field -> old'Self{_dtlb_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             312 -> Prelude'.fmap (\ !new'Field -> old'Self{_dtlb_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             320 -> Prelude'.fmap (\ !new'Field -> old'Self{_dtlb_stores = Prelude'.Just new'Field}) (P'.wireGet 4)
             328 -> Prelude'.fmap (\ !new'Field -> old'Self{_dtlb_store_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             336 -> Prelude'.fmap (\ !new'Field -> old'Self{_dtlb_prefetches = Prelude'.Just new'Field}) (P'.wireGet 4)
             344 -> Prelude'.fmap (\ !new'Field -> old'Self{_dtlb_prefetch_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             352 -> Prelude'.fmap (\ !new'Field -> old'Self{_itlb_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             360 -> Prelude'.fmap (\ !new'Field -> old'Self{_itlb_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             368 -> Prelude'.fmap (\ !new'Field -> old'Self{_branch_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             376 -> Prelude'.fmap (\ !new'Field -> old'Self{_branch_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             384 -> Prelude'.fmap (\ !new'Field -> old'Self{_node_loads = Prelude'.Just new'Field}) (P'.wireGet 4)
             392 -> Prelude'.fmap (\ !new'Field -> old'Self{_node_load_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             400 -> Prelude'.fmap (\ !new'Field -> old'Self{_node_stores = Prelude'.Just new'Field}) (P'.wireGet 4)
             408 -> Prelude'.fmap (\ !new'Field -> old'Self{_node_store_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             416 -> Prelude'.fmap (\ !new'Field -> old'Self{_node_prefetches = Prelude'.Just new'Field}) (P'.wireGet 4)
             424 -> Prelude'.fmap (\ !new'Field -> old'Self{_node_prefetch_misses = Prelude'.Just new'Field}) (P'.wireGet 4)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> PerfStatistics) PerfStatistics where
  getVal m' f' = f' m'

instance P'.GPB PerfStatistics

instance P'.ReflectDescriptor PerfStatistics where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [9, 17])
      (P'.fromDistinctAscList
        [9, 17, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 105, 113, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216,
         224, 232, 240, 248, 256, 264, 272, 280, 288, 296, 304, 312, 320, 328, 336, 344, 352, 360, 368, 376, 384, 392, 400, 408,
         416, 424])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.PerfStatistics\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\"], baseName = MName \"PerfStatistics\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"PerfStatistics.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.timestamp\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"timestamp\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.duration\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"duration\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.cycles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"cycles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.stalled_cycles_frontend\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"stalled_cycles_frontend\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.stalled_cycles_backend\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"stalled_cycles_backend\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.instructions\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"instructions\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.cache_references\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"cache_references\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.cache_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"cache_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.branches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"branches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.branch_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"branch_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.bus_cycles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"bus_cycles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.ref_cycles\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"ref_cycles\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.cpu_clock\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"cpu_clock\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 105}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.task_clock\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"task_clock\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 113}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.page_faults\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"page_faults\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.minor_faults\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"minor_faults\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.major_faults\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"major_faults\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.context_switches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"context_switches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.cpu_migrations\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"cpu_migrations\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.alignment_faults\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"alignment_faults\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 160}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.emulation_faults\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"emulation_faults\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 168}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_dcache_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_dcache_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 176}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_dcache_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_dcache_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 184}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_dcache_stores\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_dcache_stores\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 192}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_dcache_store_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_dcache_store_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 25}, wireTag = WireTag {getWireTag = 200}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_dcache_prefetches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_dcache_prefetches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 208}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_dcache_prefetch_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_dcache_prefetch_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 216}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_icache_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_icache_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 28}, wireTag = WireTag {getWireTag = 224}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_icache_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_icache_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 232}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_icache_prefetches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_icache_prefetches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 240}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.l1_icache_prefetch_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"l1_icache_prefetch_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 248}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.llc_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"llc_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 256}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.llc_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"llc_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 264}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.llc_stores\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"llc_stores\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 272}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.llc_store_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"llc_store_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 280}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.llc_prefetches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"llc_prefetches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 36}, wireTag = WireTag {getWireTag = 288}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.llc_prefetch_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"llc_prefetch_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 37}, wireTag = WireTag {getWireTag = 296}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.dtlb_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"dtlb_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 38}, wireTag = WireTag {getWireTag = 304}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.dtlb_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"dtlb_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 39}, wireTag = WireTag {getWireTag = 312}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.dtlb_stores\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"dtlb_stores\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 40}, wireTag = WireTag {getWireTag = 320}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.dtlb_store_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"dtlb_store_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 41}, wireTag = WireTag {getWireTag = 328}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.dtlb_prefetches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"dtlb_prefetches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 42}, wireTag = WireTag {getWireTag = 336}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.dtlb_prefetch_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"dtlb_prefetch_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 43}, wireTag = WireTag {getWireTag = 344}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.itlb_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"itlb_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 44}, wireTag = WireTag {getWireTag = 352}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.itlb_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"itlb_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 45}, wireTag = WireTag {getWireTag = 360}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.branch_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"branch_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 46}, wireTag = WireTag {getWireTag = 368}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.branch_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"branch_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 47}, wireTag = WireTag {getWireTag = 376}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.node_loads\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"node_loads\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 48}, wireTag = WireTag {getWireTag = 384}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.node_load_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"node_load_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 49}, wireTag = WireTag {getWireTag = 392}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.node_stores\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"node_stores\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 50}, wireTag = WireTag {getWireTag = 400}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.node_store_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"node_store_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 51}, wireTag = WireTag {getWireTag = 408}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.node_prefetches\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"node_prefetches\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 52}, wireTag = WireTag {getWireTag = 416}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".mesos.v1.PerfStatistics.node_prefetch_misses\", haskellPrefix' = [MName \"Mesos\",MName \"V1\"], parentModule' = [MName \"Protos\",MName \"PerfStatistics\"], baseName' = FName \"node_prefetch_misses\", baseNamePrefix' = \"_\"}, fieldNumber = FieldId {getFieldId = 53}, wireTag = WireTag {getWireTag = 424}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType PerfStatistics where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg PerfStatistics where
  textPut msg
   = do
       P'.tellT "timestamp" (_timestamp msg)
       P'.tellT "duration" (_duration msg)
       P'.tellT "cycles" (_cycles msg)
       P'.tellT "stalled_cycles_frontend" (_stalled_cycles_frontend msg)
       P'.tellT "stalled_cycles_backend" (_stalled_cycles_backend msg)
       P'.tellT "instructions" (_instructions msg)
       P'.tellT "cache_references" (_cache_references msg)
       P'.tellT "cache_misses" (_cache_misses msg)
       P'.tellT "branches" (_branches msg)
       P'.tellT "branch_misses" (_branch_misses msg)
       P'.tellT "bus_cycles" (_bus_cycles msg)
       P'.tellT "ref_cycles" (_ref_cycles msg)
       P'.tellT "cpu_clock" (_cpu_clock msg)
       P'.tellT "task_clock" (_task_clock msg)
       P'.tellT "page_faults" (_page_faults msg)
       P'.tellT "minor_faults" (_minor_faults msg)
       P'.tellT "major_faults" (_major_faults msg)
       P'.tellT "context_switches" (_context_switches msg)
       P'.tellT "cpu_migrations" (_cpu_migrations msg)
       P'.tellT "alignment_faults" (_alignment_faults msg)
       P'.tellT "emulation_faults" (_emulation_faults msg)
       P'.tellT "l1_dcache_loads" (_l1_dcache_loads msg)
       P'.tellT "l1_dcache_load_misses" (_l1_dcache_load_misses msg)
       P'.tellT "l1_dcache_stores" (_l1_dcache_stores msg)
       P'.tellT "l1_dcache_store_misses" (_l1_dcache_store_misses msg)
       P'.tellT "l1_dcache_prefetches" (_l1_dcache_prefetches msg)
       P'.tellT "l1_dcache_prefetch_misses" (_l1_dcache_prefetch_misses msg)
       P'.tellT "l1_icache_loads" (_l1_icache_loads msg)
       P'.tellT "l1_icache_load_misses" (_l1_icache_load_misses msg)
       P'.tellT "l1_icache_prefetches" (_l1_icache_prefetches msg)
       P'.tellT "l1_icache_prefetch_misses" (_l1_icache_prefetch_misses msg)
       P'.tellT "llc_loads" (_llc_loads msg)
       P'.tellT "llc_load_misses" (_llc_load_misses msg)
       P'.tellT "llc_stores" (_llc_stores msg)
       P'.tellT "llc_store_misses" (_llc_store_misses msg)
       P'.tellT "llc_prefetches" (_llc_prefetches msg)
       P'.tellT "llc_prefetch_misses" (_llc_prefetch_misses msg)
       P'.tellT "dtlb_loads" (_dtlb_loads msg)
       P'.tellT "dtlb_load_misses" (_dtlb_load_misses msg)
       P'.tellT "dtlb_stores" (_dtlb_stores msg)
       P'.tellT "dtlb_store_misses" (_dtlb_store_misses msg)
       P'.tellT "dtlb_prefetches" (_dtlb_prefetches msg)
       P'.tellT "dtlb_prefetch_misses" (_dtlb_prefetch_misses msg)
       P'.tellT "itlb_loads" (_itlb_loads msg)
       P'.tellT "itlb_load_misses" (_itlb_load_misses msg)
       P'.tellT "branch_loads" (_branch_loads msg)
       P'.tellT "branch_load_misses" (_branch_load_misses msg)
       P'.tellT "node_loads" (_node_loads msg)
       P'.tellT "node_load_misses" (_node_load_misses msg)
       P'.tellT "node_stores" (_node_stores msg)
       P'.tellT "node_store_misses" (_node_store_misses msg)
       P'.tellT "node_prefetches" (_node_prefetches msg)
       P'.tellT "node_prefetch_misses" (_node_prefetch_misses msg)
  textGet
   = do
       mods <- P'.sepEndBy
                (P'.choice
                  [parse'_timestamp, parse'_duration, parse'_cycles, parse'_stalled_cycles_frontend, parse'_stalled_cycles_backend,
                   parse'_instructions, parse'_cache_references, parse'_cache_misses, parse'_branches, parse'_branch_misses,
                   parse'_bus_cycles, parse'_ref_cycles, parse'_cpu_clock, parse'_task_clock, parse'_page_faults,
                   parse'_minor_faults, parse'_major_faults, parse'_context_switches, parse'_cpu_migrations,
                   parse'_alignment_faults, parse'_emulation_faults, parse'_l1_dcache_loads, parse'_l1_dcache_load_misses,
                   parse'_l1_dcache_stores, parse'_l1_dcache_store_misses, parse'_l1_dcache_prefetches,
                   parse'_l1_dcache_prefetch_misses, parse'_l1_icache_loads, parse'_l1_icache_load_misses,
                   parse'_l1_icache_prefetches, parse'_l1_icache_prefetch_misses, parse'_llc_loads, parse'_llc_load_misses,
                   parse'_llc_stores, parse'_llc_store_misses, parse'_llc_prefetches, parse'_llc_prefetch_misses, parse'_dtlb_loads,
                   parse'_dtlb_load_misses, parse'_dtlb_stores, parse'_dtlb_store_misses, parse'_dtlb_prefetches,
                   parse'_dtlb_prefetch_misses, parse'_itlb_loads, parse'_itlb_load_misses, parse'_branch_loads,
                   parse'_branch_load_misses, parse'_node_loads, parse'_node_load_misses, parse'_node_stores,
                   parse'_node_store_misses, parse'_node_prefetches, parse'_node_prefetch_misses])
                P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'_timestamp
         = P'.try
            (do
               v <- P'.getT "timestamp"
               Prelude'.return (\ o -> o{_timestamp = v}))
        parse'_duration
         = P'.try
            (do
               v <- P'.getT "duration"
               Prelude'.return (\ o -> o{_duration = v}))
        parse'_cycles
         = P'.try
            (do
               v <- P'.getT "cycles"
               Prelude'.return (\ o -> o{_cycles = v}))
        parse'_stalled_cycles_frontend
         = P'.try
            (do
               v <- P'.getT "stalled_cycles_frontend"
               Prelude'.return (\ o -> o{_stalled_cycles_frontend = v}))
        parse'_stalled_cycles_backend
         = P'.try
            (do
               v <- P'.getT "stalled_cycles_backend"
               Prelude'.return (\ o -> o{_stalled_cycles_backend = v}))
        parse'_instructions
         = P'.try
            (do
               v <- P'.getT "instructions"
               Prelude'.return (\ o -> o{_instructions = v}))
        parse'_cache_references
         = P'.try
            (do
               v <- P'.getT "cache_references"
               Prelude'.return (\ o -> o{_cache_references = v}))
        parse'_cache_misses
         = P'.try
            (do
               v <- P'.getT "cache_misses"
               Prelude'.return (\ o -> o{_cache_misses = v}))
        parse'_branches
         = P'.try
            (do
               v <- P'.getT "branches"
               Prelude'.return (\ o -> o{_branches = v}))
        parse'_branch_misses
         = P'.try
            (do
               v <- P'.getT "branch_misses"
               Prelude'.return (\ o -> o{_branch_misses = v}))
        parse'_bus_cycles
         = P'.try
            (do
               v <- P'.getT "bus_cycles"
               Prelude'.return (\ o -> o{_bus_cycles = v}))
        parse'_ref_cycles
         = P'.try
            (do
               v <- P'.getT "ref_cycles"
               Prelude'.return (\ o -> o{_ref_cycles = v}))
        parse'_cpu_clock
         = P'.try
            (do
               v <- P'.getT "cpu_clock"
               Prelude'.return (\ o -> o{_cpu_clock = v}))
        parse'_task_clock
         = P'.try
            (do
               v <- P'.getT "task_clock"
               Prelude'.return (\ o -> o{_task_clock = v}))
        parse'_page_faults
         = P'.try
            (do
               v <- P'.getT "page_faults"
               Prelude'.return (\ o -> o{_page_faults = v}))
        parse'_minor_faults
         = P'.try
            (do
               v <- P'.getT "minor_faults"
               Prelude'.return (\ o -> o{_minor_faults = v}))
        parse'_major_faults
         = P'.try
            (do
               v <- P'.getT "major_faults"
               Prelude'.return (\ o -> o{_major_faults = v}))
        parse'_context_switches
         = P'.try
            (do
               v <- P'.getT "context_switches"
               Prelude'.return (\ o -> o{_context_switches = v}))
        parse'_cpu_migrations
         = P'.try
            (do
               v <- P'.getT "cpu_migrations"
               Prelude'.return (\ o -> o{_cpu_migrations = v}))
        parse'_alignment_faults
         = P'.try
            (do
               v <- P'.getT "alignment_faults"
               Prelude'.return (\ o -> o{_alignment_faults = v}))
        parse'_emulation_faults
         = P'.try
            (do
               v <- P'.getT "emulation_faults"
               Prelude'.return (\ o -> o{_emulation_faults = v}))
        parse'_l1_dcache_loads
         = P'.try
            (do
               v <- P'.getT "l1_dcache_loads"
               Prelude'.return (\ o -> o{_l1_dcache_loads = v}))
        parse'_l1_dcache_load_misses
         = P'.try
            (do
               v <- P'.getT "l1_dcache_load_misses"
               Prelude'.return (\ o -> o{_l1_dcache_load_misses = v}))
        parse'_l1_dcache_stores
         = P'.try
            (do
               v <- P'.getT "l1_dcache_stores"
               Prelude'.return (\ o -> o{_l1_dcache_stores = v}))
        parse'_l1_dcache_store_misses
         = P'.try
            (do
               v <- P'.getT "l1_dcache_store_misses"
               Prelude'.return (\ o -> o{_l1_dcache_store_misses = v}))
        parse'_l1_dcache_prefetches
         = P'.try
            (do
               v <- P'.getT "l1_dcache_prefetches"
               Prelude'.return (\ o -> o{_l1_dcache_prefetches = v}))
        parse'_l1_dcache_prefetch_misses
         = P'.try
            (do
               v <- P'.getT "l1_dcache_prefetch_misses"
               Prelude'.return (\ o -> o{_l1_dcache_prefetch_misses = v}))
        parse'_l1_icache_loads
         = P'.try
            (do
               v <- P'.getT "l1_icache_loads"
               Prelude'.return (\ o -> o{_l1_icache_loads = v}))
        parse'_l1_icache_load_misses
         = P'.try
            (do
               v <- P'.getT "l1_icache_load_misses"
               Prelude'.return (\ o -> o{_l1_icache_load_misses = v}))
        parse'_l1_icache_prefetches
         = P'.try
            (do
               v <- P'.getT "l1_icache_prefetches"
               Prelude'.return (\ o -> o{_l1_icache_prefetches = v}))
        parse'_l1_icache_prefetch_misses
         = P'.try
            (do
               v <- P'.getT "l1_icache_prefetch_misses"
               Prelude'.return (\ o -> o{_l1_icache_prefetch_misses = v}))
        parse'_llc_loads
         = P'.try
            (do
               v <- P'.getT "llc_loads"
               Prelude'.return (\ o -> o{_llc_loads = v}))
        parse'_llc_load_misses
         = P'.try
            (do
               v <- P'.getT "llc_load_misses"
               Prelude'.return (\ o -> o{_llc_load_misses = v}))
        parse'_llc_stores
         = P'.try
            (do
               v <- P'.getT "llc_stores"
               Prelude'.return (\ o -> o{_llc_stores = v}))
        parse'_llc_store_misses
         = P'.try
            (do
               v <- P'.getT "llc_store_misses"
               Prelude'.return (\ o -> o{_llc_store_misses = v}))
        parse'_llc_prefetches
         = P'.try
            (do
               v <- P'.getT "llc_prefetches"
               Prelude'.return (\ o -> o{_llc_prefetches = v}))
        parse'_llc_prefetch_misses
         = P'.try
            (do
               v <- P'.getT "llc_prefetch_misses"
               Prelude'.return (\ o -> o{_llc_prefetch_misses = v}))
        parse'_dtlb_loads
         = P'.try
            (do
               v <- P'.getT "dtlb_loads"
               Prelude'.return (\ o -> o{_dtlb_loads = v}))
        parse'_dtlb_load_misses
         = P'.try
            (do
               v <- P'.getT "dtlb_load_misses"
               Prelude'.return (\ o -> o{_dtlb_load_misses = v}))
        parse'_dtlb_stores
         = P'.try
            (do
               v <- P'.getT "dtlb_stores"
               Prelude'.return (\ o -> o{_dtlb_stores = v}))
        parse'_dtlb_store_misses
         = P'.try
            (do
               v <- P'.getT "dtlb_store_misses"
               Prelude'.return (\ o -> o{_dtlb_store_misses = v}))
        parse'_dtlb_prefetches
         = P'.try
            (do
               v <- P'.getT "dtlb_prefetches"
               Prelude'.return (\ o -> o{_dtlb_prefetches = v}))
        parse'_dtlb_prefetch_misses
         = P'.try
            (do
               v <- P'.getT "dtlb_prefetch_misses"
               Prelude'.return (\ o -> o{_dtlb_prefetch_misses = v}))
        parse'_itlb_loads
         = P'.try
            (do
               v <- P'.getT "itlb_loads"
               Prelude'.return (\ o -> o{_itlb_loads = v}))
        parse'_itlb_load_misses
         = P'.try
            (do
               v <- P'.getT "itlb_load_misses"
               Prelude'.return (\ o -> o{_itlb_load_misses = v}))
        parse'_branch_loads
         = P'.try
            (do
               v <- P'.getT "branch_loads"
               Prelude'.return (\ o -> o{_branch_loads = v}))
        parse'_branch_load_misses
         = P'.try
            (do
               v <- P'.getT "branch_load_misses"
               Prelude'.return (\ o -> o{_branch_load_misses = v}))
        parse'_node_loads
         = P'.try
            (do
               v <- P'.getT "node_loads"
               Prelude'.return (\ o -> o{_node_loads = v}))
        parse'_node_load_misses
         = P'.try
            (do
               v <- P'.getT "node_load_misses"
               Prelude'.return (\ o -> o{_node_load_misses = v}))
        parse'_node_stores
         = P'.try
            (do
               v <- P'.getT "node_stores"
               Prelude'.return (\ o -> o{_node_stores = v}))
        parse'_node_store_misses
         = P'.try
            (do
               v <- P'.getT "node_store_misses"
               Prelude'.return (\ o -> o{_node_store_misses = v}))
        parse'_node_prefetches
         = P'.try
            (do
               v <- P'.getT "node_prefetches"
               Prelude'.return (\ o -> o{_node_prefetches = v}))
        parse'_node_prefetch_misses
         = P'.try
            (do
               v <- P'.getT "node_prefetch_misses"
               Prelude'.return (\ o -> o{_node_prefetch_misses = v}))