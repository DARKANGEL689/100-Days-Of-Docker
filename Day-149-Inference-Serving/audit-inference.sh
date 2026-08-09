#!/bin/bash
echo "Auditing Production Inference Endpoints..."
echo "--------------------------------------------------------"

kubectl port-forward svc/inference-service 8080:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo "[1] Executing Health Probe:"
curl -s http://127.0.0.1:8080/health
echo -e "\n"

echo "[2] Executing Tensor Inference Payload (Simulated):"
curl -s -X POST -H "Content-Type: application/json" -d '{"inputs": "Execute primary matrix"}' http://127.0.0.1:8080/v2/models/transformer/infer
echo -e "\n"

kill $PF_PID

echo "[3] Auditing Autoscaler Telemetry:"
kubectl get hpa inference-scaler

echo "--------------------------------------------------------"
echo "If compute_latency_ms is reported and HPA metrics are tracking, your model is successfully served."