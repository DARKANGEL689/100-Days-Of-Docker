#!/bin/bash
echo "Executing clean teardown of Day 184 Architecture..."
kubectl delete -f 2-traced-ai-microservices.yaml --ignore-not-found
kubectl delete -f 1-jaeger-tracing-core.yaml --ignore-not-found
echo "Teardown complete. Telemetry pipelines flushed."