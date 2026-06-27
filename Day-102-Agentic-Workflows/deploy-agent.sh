#!/bin/bash
echo "Establishing AI Authorization Matrix (RBAC)..."
kubectl apply -f 1-agent-rbac.yaml

echo "Uploading Agent Logic Core to ConfigMap..."
kubectl apply -f 2-agent-logic.yaml

echo "Executing Autonomous Diagnostics Job..."
kubectl delete job autonomous-diagnostics-run --ignore-not-found
kubectl apply -f 3-agent-job.yaml

echo "The AI is booting. Waiting for execution..."
sleep 5
kubectl wait --for=condition=complete job/autonomous-diagnostics-run --timeout=60s || true