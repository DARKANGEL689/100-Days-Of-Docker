#!/bin/bash
echo "Auditing Autonomous FinOps Cost Allocation..."
echo "--------------------------------------------------------"

kubectl port-forward svc/kubecost-cost-analyzer -n kubecost 9090:9090 > /dev/null 2>&1 &
PF_PID=$!

echo "[WAIT] Aligning Prometheus telemetry caches (waiting 15s for initial scrape)..."
sleep 15

echo ">>> [1/2] Executing API Extraction for Namespace Dollar Value:"
echo "Targeting namespace: 'heavy-ml-pipeline'"
curl -s "http://127.0.0.1:9090/model/allocation?window=1h&aggregate=namespace" | jq '.data[0]."heavy-ml-pipeline" | {cpuCost, ramCost, totalCost}' || echo "Metrics still compiling..."
echo ""

echo ">>> [2/2] Establishing tunnel to Kubecost Visualization UI..."
echo "Execute this command in a separate terminal to view the financial dashboard:"
echo "kubectl port-forward svc/kubecost-cost-analyzer -n kubecost 9090:9090"
echo ""
echo "Once running, open your browser to: http://localhost:9090"
echo "You will see a complete breakdown of cluster costs by Namespace, Pod, and Label."
echo "--------------------------------------------------------"

kill $PF_PID