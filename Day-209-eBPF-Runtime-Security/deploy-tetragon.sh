#!/bin/bash
echo "[INIT] Adding Cilium Tetragon Helm Repository..."
helm repo add cilium https://helm.cilium.io
helm repo update

echo "[DEPLOY] Provisioning eBPF Runtime Security DaemonSets..."
helm upgrade --install tetragon cilium/tetragon \
  --namespace kube-system \
  --wait

echo "[WAIT] Aligning Kernel Probes and eBPF Hooks (15s)..."
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=tetragon -n kube-system --timeout=120s

echo "[DEPLOY] Provisioning Vulnerable Root-Level Ingress Core..."
kubectl apply -f 1-target-workload.yaml
sleep 5
kubectl wait --for=condition=available deployment/matrix-ingress-core --timeout=60s

echo "[DEPLOY] Injecting eBPF Tracing Policy to Kernel Layer..."
kubectl apply -f 2-ebpf-tracing-policy.yaml
sleep 3

echo "Tetragon Matrix is ARMED. Kernel system calls are strictly filtered."