#!/bin/bash
echo "Deploying the Target Enterprise API (4 Replicas)..."
kubectl apply -f 1-target-workload.yaml

echo "Waiting for the deployment baseline to stabilize..."
sleep 5
kubectl wait --for=condition=available deployment/enterprise-ledger-api --timeout=60s

echo "Injecting Continuous Automated Failure (PodChaos CRD)..."
kubectl apply -f 2-destruction-protocol.yaml

echo "Destruction Protocol ARMED. Chaos Mesh is currently assassinating production pods."