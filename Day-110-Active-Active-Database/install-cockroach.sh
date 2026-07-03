#!/bin/bash
echo "Adding CockroachDB Helm Repository..."
helm repo add cockroachdb https://charts.cockroachdb.com/
helm repo update

echo "Deploying 3-Node Active-Active Distributed SQL Cluster..."
helm install global-ledger cockroachdb/cockroachdb \
  --namespace default \
  --set statefulset.replicas=3 \
  --set conf.single-node=false

echo "Waiting for the Distributed Database to establish Quorum..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=cockroachdb --timeout=300s

echo "CockroachDB is ONLINE. Quorum established."