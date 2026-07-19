#!/bin/bash
echo "Provisioning Virtual Kubernetes Cluster (dev-environment-alpha)..."
vcluster create dev-environment-alpha \
  -n host-namespace-alpha \
  -f 1-vcluster-config.yaml \
  --connect=false

echo "Waiting for the nested API Server to boot (approx. 3 seconds)..."
sleep 5

echo "Establishing secure tunnel to the Virtual Control Plane..."
vcluster connect dev-environment-alpha -n host-namespace-alpha --background

echo "Injecting Experimental Developer Payload into the Virtual Cluster..."
kubectl apply -f 2-developer-payload.yaml

echo "Waiting for virtual pods to schedule..."
sleep 5
kubectl wait --for=condition=available deployment/experimental-feature-api --timeout=60s

echo "Ephemeral Environment is ONLINE. Developer is fully isolated."