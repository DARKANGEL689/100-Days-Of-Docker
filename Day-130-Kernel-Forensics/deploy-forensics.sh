#!/bin/bash
echo "Injecting Lethal Execution Policies into the Linux Kernel..."
kubectl apply -f 1-block-shells-policy.yaml

echo "Deploying Public Facing API (Target Payload)..."
kubectl apply -f 2-vulnerable-api.yaml

echo "Waiting for the API to schedule..."
sleep 5
kubectl wait --for=condition=available deployment/public-facing-api --timeout=60s

echo "Forensics mesh is ACTIVE. The kernel is armed."