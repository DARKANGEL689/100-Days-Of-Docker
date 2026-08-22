#!/bin/bash
echo "Auditing Cross-Container Distributed Traces..."
echo "--------------------------------------------------------"

kubectl port-forward svc/frontend-svc 8080:8080 > /dev/null 2>&1 &
PF_API_PID=$!
sleep 3

echo ">>> [1/2] Firing cross-service requests to generate telemetry data..."
for i in {1..3}; do
  curl -s http://127.0.0.1:8080/checkout | jq .
  sleep 1
done

echo ""
echo ">>> [2/2] Establishing tunnel to Jaeger Visualization UI..."
echo "Execute this command in a separate terminal to view the trace cascades:"
echo "kubectl port-forward svc/jaeger-collector 16686:16686"
echo ""
echo "Once running, open your browser to: http://localhost:16686"
echo "Select 'frontend-gateway-api' from the Service dropdown and click 'Find Traces'."
echo "--------------------------------------------------------"

kill $PF_API_PID