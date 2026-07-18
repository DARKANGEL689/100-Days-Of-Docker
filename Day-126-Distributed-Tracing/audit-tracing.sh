#!/bin/bash
echo "Auditing Distributed Telemetry Flows..."
echo "--------------------------------------------------------"

echo "[1] Triggering Cross-Microservice Transaction..."
kubectl port-forward svc/order-api-svc 8080:8080 > /dev/null 2>&1 &
API_PID=$!
sleep 3
curl -s http://localhost:8080/checkout
echo -e "\nTransaction complete."
kill $API_PID

echo ""
echo "[2] Establishing Tunnel to Jaeger UI..."
kubectl port-forward svc/jaeger-svc 16686:16686 > /dev/null 2>&1 &
UI_PID=$!
sleep 2

echo "--------------------------------------------------------"
echo "Open your browser to: http://localhost:16686"
echo "1. Select 'Order-Microservice' from the Service dropdown and click 'Find Traces'."
echo "2. Click on the Trace. You will see a Waterfall Graph."
echo "3. Notice how it proves that the Inventory-Microservice is the bottleneck (consuming 400ms of the total time)."
echo "Press CTRL+C to terminate the tunnel when finished."

wait $UI_PID