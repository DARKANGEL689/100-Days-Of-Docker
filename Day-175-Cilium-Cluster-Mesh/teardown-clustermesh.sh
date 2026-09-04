#!/bin/bash
echo "Executing clean teardown of Day 175 Architecture..."
kubectl delete -f 1-global-backend.yaml --ignore-not-found

echo "Disabling Cluster Mesh API Server..."
helm upgrade --install cilium cilium/cilium \
  --namespace kube-system \
  --set cluster.name=default \
  --set cluster.id=0 \
  --set clustermesh.useAPIServer=false \
  --wait

echo "Teardown complete. Global routing mesh collapsed back to single-cluster topology."