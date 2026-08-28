#!/bin/bash
echo "[INIT] Adding Cilium Helm Repository..."
helm repo add cilium https://helm.cilium.io
helm repo update

echo "[DEPLOY] Provisioning Cilium Tetragon eBPF DaemonSets..."
helm upgrade --install tetragon cilium/tetragon \
  -n kube-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning Standard Target Workload..."
kubectl apply -f 1-vulnerable-workload.yaml
sleep 5
kubectl wait --for=condition=available deployment/standard-api-backend --timeout=60s

echo "[DEPLOY] Injecting eBPF Kernel TracingPolicy..."
kubectl apply -f 2-tetragon-policy.yaml

echo "Tetragon Kernel Enforcement Matrix is ARMED."