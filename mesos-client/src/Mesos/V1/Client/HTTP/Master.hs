module Mesos.V1.Client.HTTP.Master where

import Mesos.V1.Client.HTTP.Internal
import Mesos.V1.Internal
import Mesos.V1.Master.Call as Call
import Mesos.V1.Master.Event as Event
import Mesos.V1.Master.Response as Response

-- TODO: сделать обёртки для всех call методов с использованием Internal.call. 