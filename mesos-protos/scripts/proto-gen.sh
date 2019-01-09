hprotoc --json  --lenses -d ../src -I ../proto -p Mesos.V1 \
-a ../proto/mesos/v1/allocator/allocator.proto=Mesos.V1.Allocator \
-a ../proto/mesos/v1/maintenance/maintenance.proto=Mesos.V1.Maintenance \
-a ../proto/mesos/v1/quota/quota.proto=Mesos.V1.Quota \
-a ../proto/mesos/v1/master/master.proto=Mesos.V1.Master \
-a ../proto/mesos/v1/scheduler/scheduler.proto=Mesos.V1.Scheduler \
-a ../proto/mesos/v1/executor/executor.proto=Mesos.V1.Executor \
../proto/mesos/v1/mesos.proto \
../proto/mesos/v1/allocator/allocator.proto \
../proto/mesos/v1/maintenance/maintenance.proto \
../proto/mesos/v1/quota/quota.proto \
../proto/mesos/v1/master/master.proto \
../proto/mesos/v1/scheduler/scheduler.proto \
../proto/mesos/v1/executor/executor.proto
