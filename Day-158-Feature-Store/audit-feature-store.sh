#!/bin/bash
echo "Auditing Online Feature Store Latency & Data Consistency..."
echo "--------------------------------------------------------"

kubectl port-forward svc/feature-server-svc 8000:8000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> SIMULATING INFERENCE ENGINE QUERY FOR USER 101:"
echo "Fetching real-time context vector..."
curl -s http://127.0.0.1:8000/get-online-features/101 | jq .

echo ""
echo ">>> SIMULATING INFERENCE ENGINE QUERY FOR USER 102:"
curl -s http://127.0.0.1:8000/get-online-features/102 | jq .

kill $PF_PID

echo "--------------------------------------------------------"
echo "If latency_ms is sub-millisecond, your inference models can securely ingest real-time context without creating network bottlenecks."