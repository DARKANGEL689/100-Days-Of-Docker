#!/bin/bash
echo "Executing clean teardown of Day 163 Architecture..."
kubectl delete -f 2-instrumented-services.yaml --ignore-not-found
kubectl delete -f 1-jaeger-backend.yaml --ignore-not-found
echo "Teardown complete. Telemetry traces flushed from memory."