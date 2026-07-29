#!/bin/bash
echo "Adding Chaos Mesh Helm Repository..."
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

echo "Deploying the Chaos Engineering Control Plane..."
helm install chaos-mesh chaos-mesh/chaos-mesh \
  --namespace chaos-mesh \
  --create-namespace \
  --set chaosDaemon.runtime=containerd \
  --set chaosDaemon.socketPath=/run/containerd/containerd.sock

echo "Waiting for the Chaos DaemonSets to arm across all worker nodes..."
kubectl wait --namespace chaos-mesh --for=condition=ready pod -l app.kubernetes.io/component=chaos-daemon --timeout=120s
kubectl wait --namespace chaos-mesh --for=condition=ready pod -l app.kubernetes.io/component=chaos-controller-manager --timeout=120s

echo "Chaos Mesh is ONLINE. The cluster is now capable of weaponized self-sabotage."