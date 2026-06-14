#!/bin/bash
echo "Interrogating Jaeger API for live trace telemetry..."
kubectl port-forward svc/jaeger-svc 16686:16686 &
PID=$!
sleep 3

echo "--------------------------------------------------------"
echo "Extracting the raw JSON trace tree from the 'frontend' microservice:"
curl -s "http://localhost:16686/api/traces?service=frontend&limit=1" | grep -o '"traceID":"[^"]*"' | head -n 1
echo ""
echo "If you see a traceID hash above, the Omniscient Eye is successfully recording the network."
echo "--------------------------------------------------------"

kill $PID