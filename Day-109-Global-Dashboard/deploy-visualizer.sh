#!/bin/bash
echo "Injecting Declarative DataSource (ClickHouse)..."
kubectl apply -f 1-clickhouse-datasource.yaml

echo "Injecting Real-Time Fraud Operations Dashboard..."
kubectl apply -f 2-fraud-dashboard.yaml

echo "Grafana sidecars are hot-reloading the configurations..."
sleep 5
echo "Visualizer bindings established."