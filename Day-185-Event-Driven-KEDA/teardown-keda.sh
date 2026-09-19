#!/bin/bash
echo "Executing clean teardown of Day 185 Architecture..."
kubectl delete -f 2-keda-scaler.yaml --ignore-not-found
kubectl delete -f 1-broker-and-worker.yaml --ignore-not-found
helm uninstall keda -n keda
kubectl delete namespace keda --ignore-not-found
echo "Teardown complete. Event-driven telemetry detached."