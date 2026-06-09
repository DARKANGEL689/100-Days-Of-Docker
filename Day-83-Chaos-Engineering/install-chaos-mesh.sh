#!/bin/bash
echo "Adding Chaos Mesh Helm Repository..."
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

echo "Deploying the Chaos Engine..."
helm install chaos-mesh chaos-mesh/chaos-mesh \
  --namespace chaos-mesh \
  --create-namespace \
  --set chaosDaemon.runtime=containerd \
  --set chaosDaemon.socketPath=/run/containerd/containerd.sock

echo "Waiting for the Chaos Controllers to boot..."
kubectl wait --namespace chaos-mesh \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller-manager \
  --timeout=120s

echo "Chaos Mesh is ONLINE. The cluster is now susceptible to injected faults."