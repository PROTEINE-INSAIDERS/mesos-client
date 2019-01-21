{-# LANGUAGE DataKinds
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

instance UnionCase 'GET_HEALTH where
    type Case 'GET_HEALTH = ()
    lCase = const lUnitCase
    
instance UnionCase 'GET_FLAGS where
    type Case 'GET_FLAGS = ()
    lCase = const lUnitCase

instance UnionCase 'GET_VERSION where
    type Case 'GET_VERSION = ()  
    lCase = const lUnitCase

instance UnionCase 'GET_METRICS where
    type Case 'GET_METRICS = GetMetrics
    lCase = const lGet_metrics

instance UnionCase 'GET_LOGGING_LEVEL where
    type Case 'GET_LOGGING_LEVEL = ()  
    lCase = const lUnitCase

instance UnionCase 'SET_LOGGING_LEVEL where
    type Case 'SET_LOGGING_LEVEL = SetLoggingLevel
    lCase = const lSet_logging_level

instance UnionCase 'LIST_FILES where
    type Case 'LIST_FILES = ListFiles
    lCase = const lList_files

instance UnionCase 'READ_FILE where
    type Case 'READ_FILE = ReadFile
    lCase = const lRead_file

instance UnionCase 'GET_STATE where
    type Case 'GET_STATE = ()
    lCase = const lUnitCase

instance UnionCase 'GET_AGENTS where
    type Case 'GET_AGENTS = ()
    lCase = const lUnitCase

instance UnionCase 'GET_FRAMEWORKS where
    type Case 'GET_FRAMEWORKS = ()
    lCase = const lUnitCase

instance UnionCase 'GET_EXECUTORS where
    type Case 'GET_EXECUTORS = ()
    lCase = const lUnitCase

instance UnionCase 'GET_OPERATIONS where
    type Case 'GET_OPERATIONS = ()
    lCase = const lUnitCase

instance UnionCase 'GET_TASKS where
    type Case 'GET_TASKS = ()
    lCase = const lUnitCase

instance UnionCase 'GET_ROLES where
    type Case 'GET_ROLES = ()
    lCase = const lUnitCase

instance UnionCase 'GET_WEIGHTS where
    type Case 'GET_WEIGHTS = ()
    lCase = const lUnitCase

instance UnionCase 'UPDATE_WEIGHTS where
    type Case 'UPDATE_WEIGHTS = UpdateWeights
    lCase = const lUpdate_weights

instance UnionCase 'GET_MASTER where
    type Case 'GET_MASTER = ()
    lCase = const lUnitCase

-- probably should not be here.
instance UnionCase 'SUBSCRIBE where
    type Case 'SUBSCRIBE = ()
    lCase = const lUnitCase

instance UnionCase 'RESERVE_RESOURCES where
    type Case 'RESERVE_RESOURCES = ReserveResources
    lCase = const lReserve_resources

instance UnionCase 'UNRESERVE_RESOURCES where
    type Case 'UNRESERVE_RESOURCES = UnreserveResources
    lCase = const lUnreserve_resources

instance UnionCase 'CREATE_VOLUMES where
    type Case 'CREATE_VOLUMES = CreateVolumes
    lCase = const lCreate_volumes

instance UnionCase 'DESTROY_VOLUMES where
    type Case 'DESTROY_VOLUMES = DestroyVolumes
    lCase = const lDestroy_volumes

instance UnionCase 'GROW_VOLUME where
    type Case 'GROW_VOLUME = GrowVolume
    lCase = const lGrow_volume

instance UnionCase 'SHRINK_VOLUME where
    type Case 'SHRINK_VOLUME = ShrinkVolume
    lCase = const lShrink_volume

instance UnionCase 'GET_MAINTENANCE_STATUS where
    type Case 'GET_MAINTENANCE_STATUS = ()  
    lCase = const lUnitCase

instance UnionCase 'GET_MAINTENANCE_SCHEDULE where
    type Case 'GET_MAINTENANCE_SCHEDULE = ()  
    lCase = const lUnitCase

instance UnionCase 'UPDATE_MAINTENANCE_SCHEDULE where
    type Case 'UPDATE_MAINTENANCE_SCHEDULE = UpdateMaintenanceSchedule
    lCase = const lUpdate_maintenance_schedule

instance UnionCase 'START_MAINTENANCE where
    type Case 'START_MAINTENANCE = StartMaintenance
    lCase = const lStart_maintenance

instance UnionCase 'STOP_MAINTENANCE where
    type Case 'STOP_MAINTENANCE = StopMaintenance
    lCase = const lStop_maintenance

instance UnionCase 'GET_QUOTA where
    type Case 'GET_QUOTA = ()
    lCase = const lUnitCase

instance UnionCase 'UPDATE_QUOTA where
    type Case 'UPDATE_QUOTA = UpdateQuota
    lCase = const lUpdate_quota

instance UnionCase 'SET_QUOTA where
    type Case 'SET_QUOTA = SetQuota
    lCase = const lSet_quota

instance UnionCase 'REMOVE_QUOTA where
    type Case 'REMOVE_QUOTA = RemoveQuota
    lCase = const lRemove_quota

instance UnionCase 'TEARDOWN where
    type Case 'TEARDOWN = Teardown
    lCase = const lTeardown

instance UnionCase 'MARK_AGENT_GONE where
    type Case 'MARK_AGENT_GONE = MarkAgentGone
    lCase = const lMark_agent_gone
