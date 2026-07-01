#!/bin/bash
echo "Deploying the Altinity ClickHouse Kubernetes Operator..."
kubectl apply -f https://raw.githubusercontent.com/Altinity/clickhouse-operator/master/deploy/operator/clickhouse-operator-install-bundle.yaml

echo "Waiting for the Analytics Control Plane to boot..."
kubectl wait --namespace kube-system --for=condition=ready pod -l app=clickhouse-operator --timeout=120s

echo "ClickHouse Operator is ONLINE. The cluster is ready to build columnar storage."