{-# LANGUAGE DataKinds
           , GADTs
           , KindSignatures
           , TemplateHaskell
           , TypeFamilies
#-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Mesos.V1.Client.HTTP.Master.Response
    ( module X
    , module Mesos.V1.Client.HTTP.Master.Response
    )
where

import           Data.Label
import           Data.Singletons.TH
import           Mesos.V1.Client.HTTP.Internal
import           Mesos.V1.Master.Protos.Response
                                               as X
import           Mesos.V1.Master.Protos.Response.Type
                                               as X
import           Mesos.V1.Master.Protos.Response.GetAgents
                                               as X
                                                ( GetAgents )
import           Mesos.V1.Master.Protos.Response.GetExecutors
                                               as X
                                                ( GetExecutors )
import           Mesos.V1.Master.Protos.Response.GetFlags
                                               as X
                                                ( GetFlags )
import           Mesos.V1.Master.Protos.Response.GetFrameworks
                                               as X
                                                ( GetFrameworks )
import           Mesos.V1.Master.Protos.Response.GetHealth
                                               as X
                                                ( GetHealth )
import           Mesos.V1.Master.Protos.Response.GetLoggingLevel
                                               as X
                                                ( GetLoggingLevel )
import           Mesos.V1.Master.Protos.Response.GetMaintenanceSchedule
                                               as X
                                                ( GetMaintenanceSchedule )
import           Mesos.V1.Master.Protos.Response.GetMaintenanceStatus
                                               as X
                                                ( GetMaintenanceStatus )
import           Mesos.V1.Master.Protos.Response.GetMaster
                                               as X
                                                ( GetMaster )
import           Mesos.V1.Master.Protos.Response.GetMetrics
                                               as X
                                                ( GetMetrics )
import           Mesos.V1.Master.Protos.Response.GetOperations
                                               as X
                                                ( GetOperations )
import           Mesos.V1.Master.Protos.Response.GetQuota
                                               as X
                                                ( GetQuota )
import           Mesos.V1.Master.Protos.Response.GetRoles
                                               as X
                                                ( GetRoles )
import           Mesos.V1.Master.Protos.Response.GetState
                                               as X
                                                ( GetState )
import           Mesos.V1.Master.Protos.Response.GetTasks
                                               as X
                                                ( GetTasks )
import           Mesos.V1.Master.Protos.Response.GetVersion
                                               as X
                                                ( GetVersion )
import           Mesos.V1.Master.Protos.Response.GetWeights
                                               as X
                                                ( GetWeights )
import           Mesos.V1.Master.Protos.Response.ListFiles
                                               as X
                                                ( ListFiles )
import           Mesos.V1.Master.Protos.Response.ReadFile
                                               as X
                                                ( ReadFile )

mkLabels [''Response]

genSingletons [''Type]

instance UnionTag Type where
    type Union Type = Response
    lTag = lType'

instance UnionCase 'GET_HEALTH where
    type Case 'GET_HEALTH = GetHealth
    lCase = const lGet_health

instance UnionCase 'GET_FLAGS where
    type Case 'GET_FLAGS = GetFlags
    lCase = const lGet_flags

instance UnionCase 'GET_VERSION where
    type Case 'GET_VERSION = GetVersion
    lCase = const lGet_version

instance UnionCase 'GET_METRICS where
    type Case 'GET_METRICS = GetMetrics
    lCase = const lGet_metrics

instance UnionCase 'GET_LOGGING_LEVEL where
    type Case 'GET_LOGGING_LEVEL = GetLoggingLevel
    lCase = const lGet_logging_level

instance UnionCase 'LIST_FILES where
    type Case 'LIST_FILES = ListFiles
    lCase = const lList_files

instance UnionCase 'READ_FILE where
    type Case 'READ_FILE = ReadFile
    lCase = const lRead_file

instance UnionCase 'GET_STATE where
    type Case 'GET_STATE = GetState
    lCase = const lGet_state

instance UnionCase 'GET_AGENTS where
    type Case 'GET_AGENTS = GetAgents
    lCase = const lGet_agents

instance UnionCase 'GET_FRAMEWORKS where
    type Case 'GET_FRAMEWORKS = GetFrameworks
    lCase = const lGet_frameworks

instance UnionCase 'GET_EXECUTORS where
    type Case 'GET_EXECUTORS = GetExecutors
    lCase = const lGet_executors

instance UnionCase 'GET_OPERATIONS where
    type Case 'GET_OPERATIONS = GetOperations
    lCase = const lGet_operations

instance UnionCase 'GET_TASKS where
    type Case 'GET_TASKS = GetTasks
    lCase = const lGet_tasks

instance UnionCase 'GET_ROLES where
    type Case 'GET_ROLES = GetRoles
    lCase = const lGet_roles

instance UnionCase 'GET_WEIGHTS where
    type Case 'GET_WEIGHTS = GetWeights
    lCase = const lGet_weights

instance UnionCase 'GET_MASTER where
    type Case 'GET_MASTER = GetMaster
    lCase = const lGet_master

instance UnionCase 'GET_MAINTENANCE_STATUS where
    type Case 'GET_MAINTENANCE_STATUS = GetMaintenanceStatus
    lCase = const lGet_maintenance_status

instance UnionCase 'GET_MAINTENANCE_SCHEDULE where
    type Case 'GET_MAINTENANCE_SCHEDULE = GetMaintenanceSchedule
    lCase = const lGet_maintenance_schedule

instance UnionCase 'GET_QUOTA where
    type Case 'GET_QUOTA = GetQuota
    lCase = const lGet_quota
