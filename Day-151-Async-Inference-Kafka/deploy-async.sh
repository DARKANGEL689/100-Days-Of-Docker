#!/bin/bash
echo "[DEPLOY] Provisioning Apache Kafka (KRaft Mode)..."
kubectl apply -f 1-kafka-broker.yaml

echo "[WAIT] Allowing Event Bus to establish quorum..."
sleep 20
kubectl wait --for=condition=available deployment/kafka-broker --timeout=120s

echo "[DEPLOY] Injecting Asynchronous Python Logic (Producers & Consumers)..."
kubectl apply -f 2-async-workers.yaml
sleep 10
kubectl wait --for=condition=available deployment/inference-system --timeout=120s

echo "Event-Driven Inference Matrix is ARMED."