# mesos-client

[![Build Status](https://travis-ci.org/PROTEINE-INSAIDERS/mesos-client.svg?branch=master)](https://travis-ci.org/PROTEINE-INSAIDERS/mesos-client)


Namespace layout:
- Mesos.V1.\<Component\> - Version specific stuff which is not client specific.
  - Mesos.V1.Protos - Version specific Protobuf stuff shared across components.
  - Mesos.V1.\<Component\>.Protos - Version specific component specific Protobuf stuff.
- Mesos.HTTP.Client - HTTP-Client-only stuff not specific to particular version.
  - Mesos.HTTP.Client.V1 - Version specific HTTP-Client-only stuff shared across components.
  - Mesos.HTTP.Client.V1.\<Component\> - Version specific HTTP-Client-only component specific stuff.
- \*.Internal - Anything considered to be too low-level or implementation-dependent to be exposed directly.