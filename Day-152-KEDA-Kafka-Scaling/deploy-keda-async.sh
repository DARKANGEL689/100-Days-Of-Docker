#!/bin/bash
echo "[INIT] Installing KEDA (Kubernetes Event-driven Autoscaling) Core..."
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm upgrade --install keda kedacore/keda --namespace keda --create-namespace --wait

echo "[DEPLOY] Provisioning Apache Kafka Event Bus..."
kubectl apply -f 1-kafka-broker.yaml
sleep 20
kubectl wait --for=condition=available deployment/kafka-broker --timeout=120s

echo "[DEPLOY] Provisioning Splintered Worker Matrix (Producers/Consumers)..."
kubectl apply -f 2-inference-workers.yaml

echo "[DEPLOY] Arming KEDA ScaledObject Matrix..."
kubectl apply -f 3-keda-scaler.yaml

echo "Event-Driven Elastic Grid is ARMED."