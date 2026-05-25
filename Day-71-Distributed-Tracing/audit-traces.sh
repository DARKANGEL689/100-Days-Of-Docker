#!/bin/bash
echo "Auditing Raw Jaeger Span Database..."
echo "------------------------------------"
kubectl port-forward svc/jaeger-collector 16686:16686 &
API_PID=$!
sleep 3

echo "Querying traces for the 'frontend' microservice:"
curl -s "http://localhost:16686/api/traces?service=frontend&limit=1" | grep -o '"traceID":"[^"]*"' | head -n 1 && echo "SUCCESS: Valid Trace IDs detected in raw JSON output." || echo "FAILURE: No traces found."

kill $API_PID
echo "------------------------------------"