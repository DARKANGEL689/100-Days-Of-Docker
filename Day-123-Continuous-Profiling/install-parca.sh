#!/bin/bash
echo "Adding Parca Helm Repository..."
helm repo add parca https://parca-dev.github.io/helm-charts
helm repo update

echo "Deploying the Parca Telemetry Server..."
helm install enterprise-profiler parca/parca \
  --namespace parca-system \
  --create-namespace

echo "Deploying the Parca eBPF Node Agents..."
helm install enterprise-profiler-agent parca/parca-agent \
  --namespace parca-system

echo "Waiting for the Profiling Engine to hook into the Linux kernel..."
kubectl wait --namespace parca-system --for=condition=ready pod -l app.kubernetes.io/name=parca --timeout=120s
kubectl wait --namespace parca-system --for=condition=ready pod -l app.kubernetes.io/name=parca-agent --timeout=120s

echo "Continuous Profiling is ONLINE. The kernel is now mapping CPU frames."