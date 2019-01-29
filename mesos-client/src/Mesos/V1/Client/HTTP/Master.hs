{-# LANGUAGE TypeFamilies
           , DataKinds 
           , GADTs  
#-}

module Mesos.V1.Client.HTTP.Master
    ( -- TODO: move shared "internal" functions to separate module ( possibly Mesos.V1.Client.HTTP ) and reexport it here.
      I.newEndpoint
    , I.jsonCodec
    , I.protobufCodec
    , module Mesos.V1.Client.HTTP.Master
    )
where

import           Conduit
import           Data.Proxy
import           Mesos.V1.Client.HTTP.Internal as I
import qualified Mesos.V1.Client.HTTP.Master.Call
                                               as Call
import qualified Mesos.V1.Client.HTTP.Master.Event
                                               as Event
import qualified Mesos.V1.Client.HTTP.Master.Response
                                               as Response

data instance CallTag :: Call.Type -> Response.Type -> * where
    GET_HEALTH :: CallTag Call.GET_HEALTH Response.GET_HEALTH
    GET_FLAGS :: CallTag Call.GET_FLAGS Response.GET_FLAGS
    GET_VERSION :: CallTag Call.GET_VERSION Response.GET_VERSION
    GET_METRICS :: CallTag Call.GET_METRICS Response.GET_METRICS
    GET_LOGGING_LEVEL :: CallTag Call.GET_LOGGING_LEVEL Response.GET_LOGGING_LEVEL
    -- SET_LOGGING_LEVEL :: CallTag Call.SET_LOGGING_LEVEL Response.SET_LOGGING_LEVEL
    LIST_FILES :: CallTag Call.LIST_FILES Response.LIST_FILES
    READ_FILE :: CallTag Call.READ_FILE Response.READ_FILE
    GET_STATE :: CallTag Call.GET_STATE Response.GET_STATE
    GET_AGENTS :: CallTag Call.GET_AGENTS Response.GET_AGENTS
    GET_FRAMEWORKS :: CallTag Call.GET_FRAMEWORKS Response.GET_FRAMEWORKS
    GET_EXECUTORS :: CallTag Call.GET_EXECUTORS Response.GET_EXECUTORS
    GET_OPERATIONS :: CallTag Call.GET_OPERATIONS Response.GET_OPERATIONS
    GET_TASKS :: CallTag Call.GET_TASKS Response.GET_TASKS
    GET_ROLES :: CallTag Call.GET_ROLES Response.GET_ROLES
    GET_WEIGHTS :: CallTag Call.GET_WEIGHTS Response.GET_WEIGHTS
    -- UPDATE_WEIGHTS :: CallTag Call.UPDATE_WEIGHTS Response.UPDATE_WEIGHTS
    GET_MASTER ::CallTag Call.GET_MASTER Response.GET_MASTER
    -- SUBSCRIBE :: CallTag Call.SUBSCRIBE Response.SUBSCRIBE
    -- RESERVE_RESOURCES :: CallTag Call.RESERVE_RESOURCES Response.RESERVE_RESOURCES
    -- UNRESERVE_RESOURCES :: CallTag Call.UNRESERVE_RESOURCES Response.UNRESERVE_RESOURCES
    -- CREATE_VOLUMES :: CallTag Call.CREATE_VOLUMES Response.CREATE_VOLUMES
    -- DESTROY_VOLUMES :: CallTag Call.DESTROY_VOLUMES Response.DESTROY_VOLUMES
    -- GROW_VOLUME :: CallTag Call.GROW_VOLUME Response.GROW_VOLUME
    -- SHRINK_VOLUME :: CallTag Call.SHRINK_VOLUME Response.SHRINK_VOLUME
    GET_MAINTENANCE_STATUS :: CallTag Call.GET_MAINTENANCE_STATUS Response.GET_MAINTENANCE_STATUS
    GET_MAINTENANCE_SCHEDULE :: CallTag Call.GET_MAINTENANCE_SCHEDULE Response.GET_MAINTENANCE_SCHEDULE
    -- UPDATE_MAINTENANCE_SCHEDULE :: CallTag Call.UPDATE_MAINTENANCE_SCHEDULE Response.UPDATE_MAINTENANCE_SCHEDULE
    -- START_MAINTENANCE :: CallTag Call.START_MAINTENANCE Response.START_MAINTENANCE
    -- STOP_MAINTENANCE :: CallTag Call.STOP_MAINTENANCE Response.STOP_MAINTENANCE
    GET_QUOTA :: CallTag Call.GET_QUOTA Response.GET_QUOTA
    -- UPDATE_QUOTA :: CallTag Call.UPDATE_QUOTA Response.UPDATE_QUOTA
    -- SET_QUOTA :: CallTag Call.SET_QUOTA Response.SET_QUOTA
    -- REMOVE_QUOTA :: CallTag Call.REMOVE_QUOTA Response.REMOVE_QUOTA
    -- TEARDOWN :: CallTag Call.TEARDOWN Response.TEARDOWN
    -- MARK_AGENT_GONE :: CallTag Call.MARK_AGENT_GONE Response.MARK_AGENT_GONE

getHealth
    :: (MonadUnliftIO m)
    => Endpoint
    -> Codec Call.Call Response.Response
    -> m Response.GetHealth
getHealth = flip (call GET_HEALTH) ()

getFlags
    :: (MonadUnliftIO m)
    => Endpoint
    -> Codec Call.Call Response.Response
    -> m Response.GetFlags
getFlags = flip (call GET_FLAGS) ()
