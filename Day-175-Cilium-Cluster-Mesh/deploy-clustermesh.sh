#!/bin/bash
echo "[INIT] Upgrading Cilium CNI to initialize Cluster Mesh Control Plane..."
helm repo add cilium https://helm.cilium.io
helm repo update

helm upgrade --install cilium cilium/cilium \
  --namespace kube-system \
  --set cluster.name=datacenter-alpha \
  --set cluster.id=1 \
  --set clustermesh.useAPIServer=true \
  --set clustermesh.apiserver.tls.auto.method=cronJob \
  --wait

echo "[WAIT] Provisioning eBPF Mesh Gateway and Cryptographic Certificates (30s)..."
sleep 30
kubectl wait --for=condition=ready pod -l k8s-app=clustermesh-apiserver -n kube-system --timeout=120s

echo "[DEPLOY] Injecting Global AI Backend Service..."
kubectl apply -f 1-global-backend.yaml
sleep 5
kubectl wait --for=condition=available deployment/global-ai-backend --timeout=60s

echo "Multi-Cluster Mesh API is ARMED. Local cluster is ready to peer with remote datacenters."