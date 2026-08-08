#!/bin/bash
echo "Auditing AI Model Lineage and Registry..."
echo "--------------------------------------------------------"

echo "Querying the MLflow Tracking Server API for registered experiments..."
kubectl port-forward svc/mlflow-service 5000:5000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ""
echo "[API RESPONSE] Registered Experiments Matrix:"
curl -s http://127.0.0.1:5000/api/2.0/mlflow/experiments/list | grep -o '"name": "[^"]*"' | sed 's/"name": "//' | sed 's/"//'

echo ""
echo "[API RESPONSE] Extracted Metadata for 'Day-148-Transformer-Core':"
EXPERIMENT_ID=$(curl -s http://127.0.0.1:5000/api/2.0/mlflow/experiments/get-by-name?experiment_name=Day-148-Transformer-Core | grep -o '"experiment_id": "[^"]*"' | cut -d'"' -f4)

curl -s -X POST -H "Content-Type: application/json" -d "{\"experiment_ids\": [\"$EXPERIMENT_ID\"]}" http://127.0.0.1:5000/api/2.0/mlflow/runs/search | grep -E '"key":|"value":|"run_id":' | head -n 15

kill $PF_PID

echo ""
echo "--------------------------------------------------------"
echo "If hyperparameter keys (AdamW, learning_rate) and Run IDs are visible, your MLOps telemetry is fully integrated."