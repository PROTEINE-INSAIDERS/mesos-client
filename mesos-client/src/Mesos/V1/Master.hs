{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds  #-}

module Mesos.V1.Master where

import           Mesos.V1.Internal
import           Mesos.V1.Master.Call as Call
import           Mesos.V1.Master.Event as Event
import           Mesos.V1.Master.Response as Response 

type instance EventOf Call.Call = Event.Event

type instance ResponseTo Call.Call =  Response.Response

type instance ResponseTag Call.GET_HEALTH = Response.GET_HEALTH