#!/bin/bash
echo "[INIT] Installing CNCF KubeRay Operator via Helm..."
helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update
helm upgrade --install kuberay-operator kuberay/kuberay-operator \
  --namespace kuberay-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning Distributed Ray Supercluster..."
kubectl apply -f 1-ray-cluster.yaml

echo "[WAIT] Aligning Head and Worker Node Topology (30s)..."
sleep 30
kubectl wait --for=condition=ready pod -l ray.io/node-type=head --timeout=120s
kubectl wait --for=condition=ready pod -l ray.io/node-type=worker --timeout=120s

echo "[EXECUTE] Submitting Distributed Python Workload..."
kubectl apply -f 2-distributed-job.yaml

echo "KubeRay Matrix is ARMED. Tasks are currently executing across the nodes."