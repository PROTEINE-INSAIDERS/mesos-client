module Mesos.V1.Client.HTTP.Master 
    ( I.newEndpoint
    , module Mesos.V1.Master
    , module Mesos.V1.Client.HTTP.Master
    ) where

import Conduit
import Data.Proxy
import Mesos.V1.Client.HTTP.Internal as I
import Mesos.V1.Internal
import Mesos.V1.Internal.TaggedUnion
import Mesos.V1.Master
import qualified Mesos.V1.Master.Call as Call
import qualified Mesos.V1.Master.Event as Event
import qualified Mesos.V1.Master.Response as Response

getHealth :: (MonadUnliftIO m) => Endpoint -> Codec Call.Call Response.Response -> m Response.GetHealth
getHealth endpoint codec = call' endpoint codec GET_HEALTH ()
