#!/bin/bash
echo "Port-forwarding raw Prometheus Database..."
echo "Open your browser to: http://localhost:9090"
echo "Go to Status -> Targets to verify it is scraping the telemetry-api!"
kubectl port-forward -n observability svc/enterprise-metrics-kube-prome-prometheus 9090:9090