#!/bin/bash
echo "Auditing Full-Stack Cluster Metrics..."
echo "--------------------------------------------------------"

echo ">>> [1/2] GENERATING ARTIFICIAL CPU LOAD:"
echo "Blasting AI Inference Engine with background requests to generate time-series telemetry..."
kubectl port-forward svc/ai-inference-svc 9898:9898 -n default > /dev/null 2>&1 &
LOAD_PID=$!
sleep 2

(while true; do curl -s http://127.0.0.1:9898 > /dev/null; sleep 0.1; done) &
TRAFFIC_PID=$!

echo ">>> [2/2] VISUALIZING HARDWARE TELEMETRY:"
echo "Open your browser and navigate to: http://localhost:8080"
echo "Credentials:"
echo "  Username: admin"
echo "  Password: prom-operator"
echo ""
echo "INSTRUCTIONS:"
echo "1. Log into Grafana."
echo "2. Navigate to 'Dashboards' -> 'General'."
echo "3. Click on 'Matrix Core: Hardware & AI Compute'."
echo "4. You will see the CPU graph rapidly spiking upward in real-time as the background script hammers the engine."
echo "--------------------------------------------------------"
echo "Press [CTRL+C] to stop the load generator and terminate the port-forward."

kubectl port-forward svc/prometheus-stack-grafana 8080:80 -n monitoring

kill $LOAD_PID
kill $TRAFFIC_PID