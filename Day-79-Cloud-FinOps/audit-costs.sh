#!/bin/bash
echo "Interrogating Kubecost API for Live Billing Telemetry..."
kubectl port-forward -n kubecost svc/enterprise-finops-cost-analyzer 9090:9090 &
PID=$!
sleep 4

echo "---------------------------------------------------"
curl -s "http://localhost:9090/model/allocation?window=10m&aggregate=namespace" | grep -o '"default":{"name":"default"[^}]*' || echo "Gathering cost metrics. Wait 3 minutes for Prometheus to aggregate the initial billing data..."
echo ""
echo "---------------------------------------------------"
kill $PID