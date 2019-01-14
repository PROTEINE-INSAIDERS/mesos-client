{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module Mesos.V1.Master.Response (module X, module Mesos.V1.Master.Response) where

import Data.Label 
import Data.Singletons.TH
import Mesos.V1.Master.Protos.Response as X
import Mesos.V1.Master.Protos.Response.Type as X
import Mesos.V1.Master.Protos.Response.GetAgents as X (GetAgents)
import Mesos.V1.Master.Protos.Response.GetExecutors as X (GetExecutors)
import Mesos.V1.Master.Protos.Response.GetFlags as X (GetFlags)
import Mesos.V1.Master.Protos.Response.GetFrameworks as X (GetFrameworks)
import Mesos.V1.Master.Protos.Response.GetHealth as X (GetHealth)
import Mesos.V1.Master.Protos.Response.GetLoggingLevel as X (GetLoggingLevel)
import Mesos.V1.Master.Protos.Response.GetMaintenanceSchedule as X (GetMaintenanceSchedule)
import Mesos.V1.Master.Protos.Response.GetMaintenanceStatus as X (GetMaintenanceStatus)
import Mesos.V1.Master.Protos.Response.GetMaster as X (GetMaster)
import Mesos.V1.Master.Protos.Response.GetMetrics as X (GetMetrics)
import Mesos.V1.Master.Protos.Response.GetOperations as X (GetOperations)
import Mesos.V1.Master.Protos.Response.GetQuota as X (GetQuota)
import Mesos.V1.Master.Protos.Response.GetRoles as X (GetRoles)
import Mesos.V1.Master.Protos.Response.GetState as X (GetState)
import Mesos.V1.Master.Protos.Response.GetTasks as X (GetTasks)
import Mesos.V1.Master.Protos.Response.GetVersion as X (GetVersion)
import Mesos.V1.Master.Protos.Response.GetWeights as X (GetWeights)
import Mesos.V1.Master.Protos.Response.ListFiles as X (ListFiles)
import Mesos.V1.Master.Protos.Response.ReadFile as X (ReadFile)

mkLabels [''Response]

genSingletons [''Type]