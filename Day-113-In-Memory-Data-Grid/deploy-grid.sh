#!/bin/bash
echo "Injecting API Discovery Authorizations (RBAC)..."
kubectl apply -f 1-hazelcast-rbac.yaml

echo "Deploying the In-Memory Data Grid (Hazelcast)..."
kubectl apply -f 2-hazelcast-cluster.yaml

echo "Waiting for Hazelcast nodes to discover each other and form Quorum..."
kubectl wait --for=condition=ready pod -l app=hazelcast-node --timeout=120s

echo "Quorum formed. Injecting Python Client Logic..."
kubectl apply -f 3-grid-client-logic.yaml

echo "Executing High-Velocity Memory Test..."
kubectl delete job grid-latency-test --ignore-not-found
kubectl apply -f 4-grid-client-job.yaml

echo "Waiting for Grid Client execution to complete..."
sleep 5
kubectl wait --for=condition=complete job/grid-latency-test --timeout=60s || true