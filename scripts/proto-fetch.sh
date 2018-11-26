# Shared
curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/mesos.proto \
--create-dirs -o ../proto/mesos/v1/mesos.proto

curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/allocator/allocator.proto \
--create-dirs -o ../proto/mesos/v1/allocator/allocator.proto

curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/maintenance/maintenance.proto \
--create-dirs -o ../proto/mesos/v1/maintenance/maintenance.proto

curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/quota/quota.proto \
--create-dirs -o ../proto/mesos/v1/quota/quota.proto

# Operator HTTP API
curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/master/master.proto \
--create-dirs -o ../proto/mesos/v1/master/master.proto

# Scheduler HTTP API
curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/scheduler/scheduler.proto \
--create-dirs -o ../proto/mesos/v1/scheduler/scheduler.proto

# Executor HTTP API
curl https://raw.githubusercontent.com/apache/mesos/master/include/mesos/v1/executor/executor.proto \
--create-dirs -o ../proto/mesos/v1/executor/executor.proto
