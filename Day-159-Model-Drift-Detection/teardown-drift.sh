#!/bin/bash
echo "Executing clean teardown of Day 159 Architecture..."
kubectl delete -f 3-drift-analyzer.yaml --ignore-not-found
kubectl delete -f 2-inference-logger.yaml --ignore-not-found
kubectl delete -f 1-telemetry-cache.yaml --ignore-not-found
echo "Teardown complete. Telemetry grids flushed."