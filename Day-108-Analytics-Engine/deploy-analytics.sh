#!/bin/bash
echo "Synthesizing ClickHouse OLAP Cluster..."
kubectl apply -f 1-clickhouse-cluster.yaml

echo "Waiting for columnar storage nodes to provision..."
sleep 5
kubectl wait --for=condition=ready pod -l clickhouse.altinity.com/cluster=real-time-cluster --timeout=300s

echo "Cluster is ONLINE. Injecting Kafka Native Ingestion Schema..."
POD_NAME=$(kubectl get pods -l clickhouse.altinity.com/cluster=real-time-cluster -o jsonpath='{.items[0].metadata.name}')

cat 2-analytics-schema.sql | kubectl exec -i $POD_NAME -- clickhouse-client --multiquery

echo "Schema applied. ClickHouse is now autonomously draining the Kafka topic."