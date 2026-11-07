#!/bin/bash
echo "[INIT] Adding CNCF Chaos Mesh Helm Repository..."
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

echo "[DEPLOY] Provisioning Chaos Engineering Control Plane..."
helm upgrade --install chaos-mesh chaos-mesh/chaos-mesh \
  --namespace chaos-testing \
  --create-namespace \
  --set chaosDaemon.runtime=containerd \
  --set chaosDaemon.socketPath=/run/containerd/containerd.sock \
  --wait

echo "[DEPLOY] Provisioning Baseline High-Availability Target..."
kubectl apply -f 1-target-matrix.yaml

echo "[WAIT] Aligning Target ReplicaSets (15s)..."
sleep 15
kubectl wait --for=condition=available deployment/resilient-core --timeout=60s

echo "[ATTACK] Injecting PodChaos and NetworkChaos Experiments..."
kubectl apply -f 2-chaos-experiments.yaml

echo "Chaos Matrix is ARMED. Destruction protocols have been initiated."