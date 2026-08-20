#!/bin/bash
echo "[INIT] Adding Parca CNCF Helm Repository..."
helm repo add parca https://parca-dev.github.io/helm-charts
helm repo update

echo "[DEPLOY] Provisioning Parca Server and eBPF Kernel Agents..."
helm upgrade --install parca parca/parca \
  --namespace parca \
  --create-namespace \
  -f 2-parca-values.yaml \
  --wait

echo "[DEPLOY] Injecting C++ Algorithmic Workload..."
kubectl apply -f 1-cpp-algorithmic-burner.yaml

echo "[WAIT] Aligning kernel probes and compiling binary..."
sleep 15
kubectl wait --for=condition=available deployment/cpp-algo-burner --timeout=120s

echo "Continuous Profiling Matrix is ARMED. eBPF is currently mapping the kernel."