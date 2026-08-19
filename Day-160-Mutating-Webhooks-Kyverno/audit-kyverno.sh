#!/bin/bash
echo "Auditing Mutating Admission Webhook Interception..."
echo "--------------------------------------------------------"

echo ">>> [1/3] Applying unconfigured, naked Pod specification..."
kubectl apply -f 2-unsecured-ai-pod.yaml
sleep 5
kubectl wait --for=condition=ready pod/rogue-ai-worker --timeout=60s
echo ""

echo ">>> [2/3] Extracting Pod metadata from API Server..."
echo "Looking for injected 'governance.policy' label:"
kubectl get pod rogue-ai-worker -o jsonpath='{.metadata.labels}' | jq .
echo ""

echo ">>> [3/3] Extracting container environment from API Server..."
echo "Looking for injected 'K8S_GOVERNANCE_LOCK' variable:"
kubectl get pod rogue-ai-worker -o jsonpath='{.spec.containers[0].env}' | jq .
echo ""

echo ">>> [EXECUTION LOGS] Viewing Pod stdout:"
kubectl logs rogue-ai-worker
echo "--------------------------------------------------------"
echo "If the environment variables and labels exist, Kyverno successfully intercepted and mutated the API request mid-flight."