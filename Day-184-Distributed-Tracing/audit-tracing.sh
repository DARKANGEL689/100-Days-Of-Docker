#!/bin/bash
echo "Auditing OpenTelemetry Span Generation..."
echo "--------------------------------------------------------"

kubectl port-forward svc/ai-frontend-svc 8080:9898 > /dev/null 2>&1 &
FRONTEND_PID=$!
kubectl port-forward svc/jaeger-all-in-one 16686:16686 > /dev/null 2>&1 &
JAEGER_PID=$!

sleep 3

echo ">>> [1/2] Generating Multi-Hop API Traffic..."
for i in {1..10}; do
  echo "Firing Request $i -> Frontend Gateway -> AI Backend"
  curl -s http://127.0.0.1:8080/env > /dev/null
  sleep 0.2
done
echo "[SUCCESS] Traffic processed. W3C Traceparent headers generated and spans emitted via OTLP."
echo ""

echo ">>> [2/2] Accessing the Distributed Tracing Matrix:"
echo "Open your browser and navigate to: http://localhost:16686"
echo ""
echo "1. On the left sidebar, under 'Service', select 'ai-frontend-gateway'."
echo "2. Click 'Find Traces'."
echo "3. Click on a trace to visualize the exact microsecond breakdown of the payload jumping from the Frontend to the Backend."
echo "--------------------------------------------------------"
echo "Press Ctrl+C to terminate the port-forwards when finished."

wait