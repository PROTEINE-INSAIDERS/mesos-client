{-# LANGUAGE TemplateHaskell, BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses,
 OverloadedStrings #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Mesos.V1.Protos.CgroupInfo.Blkio.CFQ (CFQ(..)) where
import Prelude ((+), (/), (++), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Control.Lens.TH

data CFQ = CFQ{}
           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

Control.Lens.TH.makeLenses ''CFQ

instance P'.ToJSON CFQ where
  toJSON msg = P'.objectNoEmpty ([] ++ Prelude'.concat [])

instance P'.FromJSON CFQ where
  parseJSON
   = P'.withObject "CFQ"
      (\ o ->
        do
          Prelude'.return P'.defaultValue)

instance P'.Mergeable CFQ where
  mergeAppend CFQ CFQ = CFQ

instance P'.Default CFQ where
  defaultValue = CFQ

instance P'.Wire CFQ where
  wireSize ft' self'@(CFQ)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = 0
  wirePutWithSize ft' self'@(CFQ)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields = P'.sequencePutWithSize []
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
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> CFQ) CFQ where
  getVal m' f' = f' m'

instance P'.GPB CFQ

instance P'.ReflectDescriptor CFQ where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".mesos.v1.CgroupInfo.Blkio.CFQ\", haskellPrefix = [MName \"Mesos\",MName \"V1\"], parentModule = [MName \"Protos\",MName \"CgroupInfo\",MName \"Blkio\"], baseName = MName \"CFQ\"}, descFilePath = [\"Mesos\",\"V1\",\"Protos\",\"CgroupInfo\",\"Blkio\",\"CFQ.hs\"], isGroup = False, fields = fromList [], descOneofs = fromList [], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False, makeLenses = True, jsonInstances = True}"

instance P'.TextType CFQ where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg CFQ where
  textPut msg = Prelude'.return ()
  textGet = Prelude'.return P'.defaultValue
    where