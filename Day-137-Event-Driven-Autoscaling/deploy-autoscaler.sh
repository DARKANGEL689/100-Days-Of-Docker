#!/bin/bash
echo "Deploying External Message Broker (Redis)..."
kubectl apply -f 1-redis-broker.yaml
sleep 3
kubectl wait --for=condition=available deployment/redis-message-broker --timeout=60s

echo "Injecting KEDA ScaledObject and Scale-to-Zero Workers..."
kubectl apply -f 2-keda-worker-architecture.yaml

echo "Waiting for KEDA to map the metrics endpoint..."
sleep 5

echo "Event-Driven Architecture is ARMED."
echo "Worker count is currently: 0."