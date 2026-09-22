#!/bin/bash
echo "[INIT] Adding KWasm Helm Repository..."
helm repo add kwasm http://kwasm.sh/kwasm-operator/
helm repo update

echo "[DEPLOY] Provisioning KWasm Operator Control Plane..."
helm upgrade --install kwasm-operator kwasm/kwasm-operator \
  --namespace kwasm \
  --create-namespace \
  --wait

echo "[RUNTIME] Injecting WebAssembly Shims into Cluster Nodes..."
kubectl annotate node --all kwasm.sh/kwasm-node=true --overwrite
sleep 5

echo "[WAIT] Awaiting Wasm Node Provisioning Job Completion (30s)..."
kubectl wait --for=condition=complete job -l kwasm.sh/job=true -n kwasm --timeout=120s

echo "[DEPLOY] Provisioning Near-Native WebAssembly Workload..."
kubectl apply -f 1-wasm-workload.yaml
sleep 10
kubectl wait --for=condition=available deployment/wasm-high-performance-api --timeout=60s

echo "WebAssembly Matrix is ARMED. Container OS bloat has been bypassed."