#!/bin/bash
echo "Executing clean teardown of Day 126 Architecture..."
kubectl delete -f 3-microservice-chain.yaml --ignore-not-found
kubectl delete -f 2-otel-collector.yaml --ignore-not-found
kubectl delete -f 1-jaeger-backend.yaml --ignore-not-found
echo "Teardown complete. Telemetry mesh deactivated."