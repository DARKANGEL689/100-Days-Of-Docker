#!/bin/bash
echo "[DEPLOY] Provisioning Jaeger Distributed Tracing Collector..."
kubectl apply -f 1-jaeger-backend.yaml

echo "[WAIT] Allowing UI and gRPC endpoints to initialize..."
sleep 10
kubectl wait --for=condition=available deployment/jaeger --timeout=120s

echo "[DEPLOY] Injecting Frontend and Backend Microservices..."
echo "[SYSTEM] Auto-instrumenting OpenTelemetry hooks into Python binaries..."
kubectl apply -f 2-instrumented-services.yaml

echo "[WAIT] Aligning network topology..."
sleep 15
kubectl wait --for=condition=available deployment/backend-api --timeout=120s
kubectl wait --for=condition=available deployment/frontend-api --timeout=120s

echo "Distributed Tracing Matrix is ARMED."