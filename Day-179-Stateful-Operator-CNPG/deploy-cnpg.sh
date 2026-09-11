#!/bin/bash
echo "[INIT] Adding CloudNativePG CNCF Helm Repository..."
helm repo add cnpg https://cloudnative-pg.github.io/charts
helm repo update

echo "[DEPLOY] Provisioning Autonomous Database Operator..."
helm upgrade --install cnpg cnpg/cloudnative-pg \
  --namespace cnpg-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Injecting 3-Node PostgreSQL Cluster Definition..."
kubectl apply -f 1-postgres-cluster.yaml

echo "[WAIT] Allowing Operator to provision storage, bootstrap Primary, and sync Replicas (can take 60s)..."
sleep 15
kubectl wait --for=condition=Ready cluster/ml-database-matrix --timeout=120s

echo "Stateful Operator Matrix is ARMED. High-Availability Database quorum achieved."