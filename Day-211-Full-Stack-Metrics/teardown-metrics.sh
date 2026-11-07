#!/bin/bash
echo "Executing clean teardown of Day 211 Architecture..."
kubectl delete -f 2-grafana-dashboard.yaml --ignore-not-found
kubectl delete -f 1-matrix-telemetry-target.yaml --ignore-not-found
helm uninstall prometheus-stack -n monitoring
kubectl delete namespace monitoring --ignore-not-found
echo "Teardown complete. Telemetry scrapers detached."