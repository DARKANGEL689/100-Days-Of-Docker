#!/bin/bash
echo "Auditing MLflow Hyperparameter Registry..."
echo "--------------------------------------------------------"

kubectl port-forward svc/mlflow-server-svc 5000:5000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [1/2] Verifying Experiment Initialization:"
EXPERIMENT_DATA=$(curl -s "http://127.0.0.1:5000/api/2.0/mlflow/experiments/get-by-name?experiment_name=Production_LLM_Tuning")
EXPERIMENT_ID=$(echo $EXPERIMENT_DATA | jq -r '.experiment.experiment_id')
echo "Experiment 'Production_LLM_Tuning' located at ID: $EXPERIMENT_ID"
echo ""

echo ">>> [2/2] Extracting Captured Hyperparameters & Artifact Mathematics:"
echo "Executing MLflow Search API Request..."
curl -s -X POST http://127.0.0.1:5000/api/2.0/mlflow/runs/search \
  -H "Content-Type: application/json" \
  -d "{\"experiment_ids\": [\"$EXPERIMENT_ID\"]}" | jq '.runs[0].data.params'

echo "--------------------------------------------------------"
echo "Notice how the 'learning_rate' and 'batch_size' are permanently stored in the database. When you deploy to production on Day 200, you will know exactly which parameters generated your weights."

kill $PF_PID