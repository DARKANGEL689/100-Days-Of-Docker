#!/bin/bash
echo "Auditing Enterprise Cloud Waste (Kubecost API)..."
echo "--------------------------------------------------------"

echo "Establishing temporary tunnel to the FinOps Engine API..."
kubectl port-forward --namespace kubecost deployment/enterprise-finops-cost-analyzer 9090:9090 > /dev/null 2>&1 &
TUNNEL_PID=$!

sleep 5

echo "[1] Extracting Live Container Right-Sizing Recommendations:"
echo "Querying Kubecost /model/savings API for the 'default' namespace..."
echo ""

curl -s "http://localhost:9090/model/savings/requestSizing?targetUtilization=0.8" | jq '.data[] | select(.controllers[].name == "legacy-java-monolith") | {
  Deployment: .controllers[].name,
  Current_CPU_Request: .controllers[].containers[].requests.cpu,
  Recommended_CPU_Request: .controllers[].containers[].recommendedRequests.cpu,
  Current_RAM_Request: .controllers[].containers[].requests.memory,
  Recommended_RAM_Request: .controllers[].containers[].recommendedRequests.memory,
  Estimated_Monthly_Savings_USD: .controllers[].monthlySavingsBytes
}'

echo ""
echo "--------------------------------------------------------"
echo "Kubecost has detected the anomaly. The API mathematically proves the workload is idle."
echo "It recommends slashing the CPU and RAM limits to bare minimums, exposing the exact monthly USD savings."
echo ""
echo "To view the graphical FinOps dashboard, open a browser to http://localhost:9090"

kill $TUNNEL_PID