#!/bin/bash
source /etc/profile

name=$1
sql=$2

run_spark_sql(){
    spark-sql --driver-memory 6g \
    --executor-memory 8g \
    --executor-cores 4 \
    --conf spark.executor.memoryOverhead=20g \
    --conf spark.driver.memoryOverhead=2g \
    --conf spark.sql.autoBroadcastJionThreshold=500485760 \
    --conf spark.network.timeout=800000 \
    --conf spark.driver.maxResultSize=4g \
    --conf spark.rpc.message.maxSize=500 \
    --conf spark.rpc.askTimeout=600 \
    --conf spark.executor.heartbeatInterval=60000 \
    --conf spark.dynamicAllocation.enabled=true \
    --conf spark.executor.instances=60 \
    --conf spark.shuffle.service.enabled=true \
    --conf spark.dynamicAllocation.minExecutors=1 \
    --conf spark.dynamicAllocation.maxExecutors=100 \
    --conf spark.dynamicAllocation.executorIdleTimeout=100s \
    --conf spark.dynamicAllocation.cachedExecutorIdleTimeout=300s \
    --conf spark.scheduler.mode=FAIR \
    --conf spark.dynamicAllocation.schedulerBacklogTimeout=2s \
    --conf spark.default.parallelism=2048 \
    --conf spark.sql.broadcastTimeout=1800 \
    --conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
    --conf spark.maxRemoteBlockSizeFetchToMem=512m \
    --conf spark.sql.legacy.allowCreatingManagedTableUsingNonemptyLocation=true \
    --name "${1}" \
    -e "${2}"
}

echo "run spark-sql[${name}] : ${sql}"

run_spark_sql  "${name}" "${sql}"
