#!/bin/bash
echo "Adding Grafana Helm Repository..."
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

echo "Deploying the Global Operations Center (Grafana)..."
helm install enterprise-visualizer grafana/grafana \
  --namespace default \
  --set env.GF_INSTALL_PLUGINS="grafana-clickhouse-datasource" \
  --set sidecar.datasources.enabled=true \
  --set sidecar.dashboards.enabled=true \
  --set adminPassword="Protocol-300-Admin"

echo "Waiting for the Visualization Engine to boot..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=grafana --timeout=120s

echo "Grafana is ONLINE. The Operations Center is ready."