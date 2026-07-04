#!/bin/bash
echo "Deploying Mission-Critical Target Payload..."
kubectl apply -f 1-target-workload.yaml
kubectl wait --for=condition=available deployment/mission-critical-api --timeout=60s

echo "Establishing Adversary RBAC Authorizations..."
kubectl apply -f 2-adversary-rbac.yaml
kubectl apply -f 3-chaos-script.yaml

echo "Unleashing the Autonomous Adversary..."
kubectl delete job autonomous-adversary-run --ignore-not-found
kubectl apply -f 4-chaos-job.yaml

echo "Adversary is active. The cluster is currently under attack."
sleep 15