#!/bin/bash
echo "[INIT] Adding CNCF Chaos Mesh Helm Repository..."
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

echo "[DEPLOY] Provisioning Chaos Controllers and DaemonSets..."
helm upgrade --install chaos-mesh chaos-mesh/chaos-mesh \
  --namespace chaos-testing \
  --create-namespace \
  --set chaosDaemon.runtime=containerd \
  --set chaosDaemon.socketPath=/run/containerd/containerd.sock \
  --wait

echo "[DEPLOY] Provisioning Target High-Availability API..."
kubectl apply -f 1-target-api.yaml
sleep 5
kubectl wait --for=condition=available deployment/resilient-api --timeout=60s

echo "[EXECUTE] Injecting PodChaos CRD. The attack begins now."
kubectl apply -f 2-pod-kill-chaos.yaml

echo "Chaos Engineering Matrix is ARMED. Pods are currently under attack."