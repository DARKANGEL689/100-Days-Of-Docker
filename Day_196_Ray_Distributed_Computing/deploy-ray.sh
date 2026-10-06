#!/bin/bash
echo "[INIT] Adding KubeRay Operator Helm Repository..."
helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update

echo "[DEPLOY] Provisioning KubeRay Control Plane..."
helm upgrade --install kuberay-operator kuberay/kuberay-operator \
  --namespace kuberay-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Engineering Distributed Ray Cluster (1 Head, 2 Workers)..."
kubectl apply -f 1-ray-cluster.yaml

echo "[WAIT] Aligning Distributed Worker Nodes (45s)..."
sleep 15
kubectl wait --for=condition=ready pod -l ray.io/node-type=head --timeout=120s
kubectl wait --for=condition=ready pod -l ray.io/node-type=worker --timeout=120s

echo "[DEPLOY] Injecting Distributed Python Job..."
kubectl apply -f 2-ray-compute-job.yaml

echo "Ray Matrix is ARMED. Python constraints have been removed."