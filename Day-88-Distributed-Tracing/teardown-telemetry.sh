#!/bin/bash
echo "Executing clean teardown of Day 88 Architecture..."
kubectl delete -f 4-hotrod-service.yaml --ignore-not-found
kubectl delete -f 3-hotrod-app.yaml --ignore-not-found
kubectl delete -f 2-jaeger-service.yaml --ignore-not-found
kubectl delete -f 1-jaeger-engine.yaml --ignore-not-found
echo "Teardown complete. Telemetry buffers flushed."