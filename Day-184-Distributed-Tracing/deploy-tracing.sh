#!/bin/bash
echo "[DEPLOY] Provisioning Jaeger Distributed Tracing Core..."
kubectl apply -f 1-jaeger-tracing-core.yaml
sleep 5
kubectl wait --for=condition=available deployment/jaeger-all-in-one --timeout=60s

echo "[DEPLOY] Provisioning OpenTelemetry-Instrumented Microservices..."
kubectl apply -f 2-traced-ai-microservices.yaml
sleep 5
kubectl wait --for=condition=available deployment/ai-backend --timeout=60s
kubectl wait --for=condition=available deployment/ai-frontend-gateway --timeout=60s

echo "Tracing Matrix is ARMED. OTLP gRPC receivers are online and listening."