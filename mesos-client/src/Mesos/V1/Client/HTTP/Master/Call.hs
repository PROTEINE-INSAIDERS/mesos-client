{-# LANGUAGE CPP
           , DataKinds
           , GADTs
           , KindSignatures
           , TemplateHaskell
           , TypeFamilies
#-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Mesos.V1.Client.HTTP.Master.Call (module X, module Mesos.V1.Client.HTTP.Master.Call) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Client.HTTP.Internal 
import Mesos.V1.Master.Protos.Call as X
import Mesos.V1.Master.Protos.Call.Type as X
import Mesos.V1.Master.Protos.Call.CreateVolumes as X (CreateVolumes)
import Mesos.V1.Master.Protos.Call.DestroyVolumes as X (DestroyVolumes)
import Mesos.V1.Master.Protos.Call.GetMetrics as X (GetMetrics)
import Mesos.V1.Master.Protos.Call.GrowVolume as X (GrowVolume)
import Mesos.V1.Master.Protos.Call.ListFiles as X (ListFiles)
import Mesos.V1.Master.Protos.Call.MarkAgentGone as X (MarkAgentGone)
import Mesos.V1.Master.Protos.Call.ReadFile as X (ReadFile)
import Mesos.V1.Master.Protos.Call.RemoveQuota as X (RemoveQuota)
import Mesos.V1.Master.Protos.Call.ReserveResources as X (ReserveResources)
import Mesos.V1.Master.Protos.Call.SetLoggingLevel as X (SetLoggingLevel)
import Mesos.V1.Master.Protos.Call.SetQuota as X (SetQuota)
import Mesos.V1.Master.Protos.Call.ShrinkVolume as X (ShrinkVolume)
import Mesos.V1.Master.Protos.Call.StartMaintenance as X (StartMaintenance)
import Mesos.V1.Master.Protos.Call.StopMaintenance as X (StopMaintenance)
import Mesos.V1.Master.Protos.Call.Teardown as X (Teardown)
import Mesos.V1.Master.Protos.Call.UnreserveResources as X (UnreserveResources)
import Mesos.V1.Master.Protos.Call.UpdateMaintenanceSchedule as X (UpdateMaintenanceSchedule)
import Mesos.V1.Master.Protos.Call.UpdateQuota as X (UpdateQuota)
import Mesos.V1.Master.Protos.Call.UpdateWeights as X (UpdateWeights)

mkLabels [''Call]

genSingletons [''Type]

instance UnionTag Type where
    type Union Type = Call
    lTag = lType'

#include "mesos-client.h"

UNIT_CASE(GET_HEALTH)
UNIT_CASE(GET_FLAGS)
UNIT_CASE(GET_VERSION)
UNION_CASE(GET_METRICS, GetMetrics, lGet_metrics)
UNIT_CASE(GET_LOGGING_LEVEL)
UNION_CASE(SET_LOGGING_LEVEL, SetLoggingLevel, lSet_logging_level)
UNION_CASE(LIST_FILES, ListFiles, lList_files)
UNION_CASE(READ_FILE, ReadFile, lRead_file)
UNIT_CASE(GET_STATE)
UNIT_CASE(GET_AGENTS)
UNIT_CASE(GET_FRAMEWORKS)
UNIT_CASE(GET_EXECUTORS)
UNIT_CASE(GET_OPERATIONS)
UNIT_CASE(GET_TASKS)
UNIT_CASE(GET_ROLES)
UNIT_CASE(GET_WEIGHTS)
UNION_CASE(UPDATE_WEIGHTS, UpdateWeights, lUpdate_weights)
UNIT_CASE(GET_MASTER)
UNIT_CASE(SUBSCRIBE)
UNION_CASE(RESERVE_RESOURCES, ReserveResources, lReserve_resources)
UNION_CASE(UNRESERVE_RESOURCES, UnreserveResources, lUnreserve_resources)
UNION_CASE(CREATE_VOLUMES, CreateVolumes, lCreate_volumes)
UNION_CASE(DESTROY_VOLUMES, DestroyVolumes, lDestroy_volumes)
UNION_CASE(GROW_VOLUME, GrowVolume, lGrow_volume)
UNION_CASE(SHRINK_VOLUME, ShrinkVolume, lShrink_volume)
UNIT_CASE(GET_MAINTENANCE_STATUS)
UNIT_CASE(GET_MAINTENANCE_SCHEDULE)
UNION_CASE(UPDATE_MAINTENANCE_SCHEDULE, UpdateMaintenanceSchedule, lUpdate_maintenance_schedule)
UNION_CASE(START_MAINTENANCE, StartMaintenance, lStart_maintenance)
UNION_CASE(STOP_MAINTENANCE, StopMaintenance, lStop_maintenance)
UNIT_CASE(GET_QUOTA)
UNION_CASE(UPDATE_QUOTA, UpdateQuota, lUpdate_quota)
UNION_CASE(SET_QUOTA, SetQuota, lSet_quota)
UNION_CASE(REMOVE_QUOTA, RemoveQuota, lRemove_quota)
UNION_CASE(TEARDOWN, Teardown, lTeardown)
UNION_CASE(MARK_AGENT_GONE, MarkAgentGone, lMark_agent_gone)