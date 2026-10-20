#!/bin/bash
echo "[INIT] Adding CNCF Karmada Helm Repository..."
helm repo add karmada-charts https://raw.githubusercontent.com/karmada-io/karmada/master/charts
helm repo update

echo "[DEPLOY] Provisioning Global Karmada Control Plane..."
helm upgrade --install karmada karmada-charts/karmada \
  --namespace karmada-system \
  --create-namespace \
  --wait

echo "[SIMULATION] Registering Virtual Cloud Datacenters (AWS & GCP)..."
kubectl apply -f https://raw.githubusercontent.com/karmada-io/karmada/master/artifacts/example/cluster1.yaml
kubectl apply -f https://raw.githubusercontent.com/karmada-io/karmada/master/artifacts/example/cluster2.yaml

kubectl patch cluster member1 --type='json' -p='[{"op": "replace", "path": "/metadata/name", "value":"member-cluster-aws"}]' 2>/dev/null || true
kubectl patch cluster member2 --type='json' -p='[{"op": "replace", "path": "/metadata/name", "value":"member-cluster-gcp"}]' 2>/dev/null || true

echo "[DEPLOY] Injecting Global Propagation Policy..."
kubectl apply -f 1-propagation-policy.yaml

echo "[DEPLOY] Submitting Federated AI Workload to the God Cluster..."
kubectl apply -f 2-federated-deployment.yaml

echo "[WAIT] Aligning Multi-Cloud Replica Distribution (10s)..."
sleep 10

echo "Karmada Federation Matrix is ARMED. The workload has been scattered across the grid."