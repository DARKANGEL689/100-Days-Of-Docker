#!/bin/bash
echo "Auditing Statistical Data Drift..."
echo "--------------------------------------------------------"

kubectl port-forward svc/inference-gateway-svc 8000:8000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [SCENARIO 1] Injecting Normal Baseline Traffic (~$50)..."
for i in {1..5}; do curl -X POST "http://127.0.0.1:8000/infer?transaction_amount=52" -s > /dev/null; done

kubectl delete job data-drift-monitor --ignore-not-found > /dev/null 2>&1
kubectl apply -f 3-drift-analyzer.yaml > /dev/null 2>&1
echo "Analyzing..."
sleep 10
kubectl logs job/data-drift-monitor
echo ""

echo ">>> [SCENARIO 2] Injecting Anomalous Traffic Burst (~$150)..."
for i in {1..10}; do curl -X POST "http://127.0.0.1:8000/infer?transaction_amount=155" -s > /dev/null; done

kubectl delete job data-drift-monitor --ignore-not-found > /dev/null 2>&1
kubectl apply -f 3-drift-analyzer.yaml > /dev/null 2>&1
echo "Analyzing..."
sleep 10
kubectl logs job/data-drift-monitor

kill $PF_PID
echo "--------------------------------------------------------"