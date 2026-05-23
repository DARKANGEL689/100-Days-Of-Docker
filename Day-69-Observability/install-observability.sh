#!/bin/bash
echo "Adding Prometheus Community Helm Repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "Deploying the Kube-Prometheus-Stack (This installs Prometheus, Grafana, and AlertManager)..."
helm install enterprise-metrics prometheus-community/kube-prometheus-stack \
  --namespace observability \
  --create-namespace \
  --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false

echo "Waiting for Grafana to boot..."
kubectl wait --namespace observability \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/name=grafana \
  --timeout=300s

echo "Observability Stack is ONLINE."