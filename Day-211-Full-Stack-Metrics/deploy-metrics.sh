#!/bin/bash
echo "[INIT] Adding Prometheus Community Helm Repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "[DEPLOY] Provisioning Prometheus Operator & Grafana Core..."
helm upgrade --install prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set grafana.sidecar.dashboards.enabled=true \
  --set grafana.sidecar.dashboards.label=grafana_dashboard \
  --set grafana.sidecar.dashboards.searchNamespace=ALL \
  --wait

echo "[DEPLOY] Injecting AI Workload and ServiceMonitor Metrics Scraper..."
kubectl apply -f 1-matrix-telemetry-target.yaml

echo "[DEPLOY] Injecting Declarative Grafana Dashboard ConfigMap..."
kubectl apply -f 2-grafana-dashboard.yaml

echo "[WAIT] Aligning Time-Series Database and UI Sidecars (20s)..."
sleep 20

echo "Observability Matrix is ARMED. Hardware telemetry is actively streaming."