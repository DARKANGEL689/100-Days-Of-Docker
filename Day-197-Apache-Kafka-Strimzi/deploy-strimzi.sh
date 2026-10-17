#!/bin/bash
echo "[INIT] Adding CNCF Strimzi Kafka Helm Repository..."
helm repo add strimzi https://strimzi.io/charts/
helm repo update

echo "[DEPLOY] Provisioning Strimzi Operator Control Plane..."
helm upgrade --install strimzi-kafka strimzi/strimzi-kafka-operator \
  --namespace strimzi-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning Apache Kafka Broker & ZooKeeper State Nodes..."
kubectl apply -f 1-kafka-cluster.yaml

echo "[WAIT] Aligning StatefulSets and JBoss Data Storage (This can take 2-3 minutes)..."
kubectl wait kafka/matrix-bus --for=condition=Ready --timeout=300s -n default

echo "[DEPLOY] Engineering 'ai-telemetry-stream' Topic via Entity Operator..."
kubectl apply -f 2-kafka-topic.yaml
sleep 5

echo "Kafka Matrix is ARMED. High-throughput event streaming bus is online."