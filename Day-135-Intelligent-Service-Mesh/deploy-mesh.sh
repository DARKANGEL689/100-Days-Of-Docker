#!/bin/bash
export PATH=$PATH:$HOME/.linkerd2/bin

echo "Deploying Auto-Injected Microservices (V1 & V2)..."
kubectl apply -f 1-meshed-backends.yaml

echo "Waiting for Rust proxy sidecars to boot and establish mTLS identities..."
sleep 5
kubectl wait --for=condition=available deployment/billing-api-v1 --timeout=60s
kubectl wait --for=condition=available deployment/billing-api-v2 --timeout=60s

echo "Applying L7 Traffic Split Constraints (90/10 Rule)..."
kubectl apply -f 2-traffic-split.yaml

echo "Service Mesh is ACTIVE. All traffic is now cryptographically secured and dynamically routed."