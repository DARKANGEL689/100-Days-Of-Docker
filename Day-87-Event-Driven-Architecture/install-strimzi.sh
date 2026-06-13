#!/bin/bash
echo "Adding Strimzi Kafka Operator Helm Repository..."
helm repo add strimzi https://strimzi.io/charts/
helm repo update

echo "Deploying the Kafka Infrastructure Operator..."
helm install kafka-operator strimzi/strimzi-kafka-operator \
  --namespace kafka \
  --create-namespace

echo "Waiting for the Strimzi Operator to boot..."
kubectl wait --namespace kafka \
  --for=condition=ready pod \
  --selector=name=strimzi-cluster-operator \
  --timeout=120s

echo "Strimzi is ONLINE. The cluster can now synthesize Event Brokers."