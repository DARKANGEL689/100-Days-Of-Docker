#!/bin/bash
echo "[DEPLOY] Provisioning Jaeger Distributed Tracing Backend..."
kubectl apply -f 1-jaeger-backend.yaml

echo "[WAIT] Aligning OTLP Receivers and UI Dashboards (15s)..."
sleep 15
kubectl wait --for=condition=available deployment/jaeger-tracing-core --timeout=60s

echo "[DEPLOY] Launching OpenTelemetry-Instrumented Agent..."
kubectl apply -f 2-instrumented-agent.yaml

echo "[WAIT] Awaiting AI Execution and Telemetry Flush..."
sleep 10
kubectl wait --for=condition=complete job/otel-agent-job --timeout=120s > /dev/null 2>&1 || true

echo "Tracing Matrix is ARMED. Agent span trees are stored in memory."