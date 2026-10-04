#!/bin/bash
echo "Auditing Autonomous DAG Execution..."
echo "--------------------------------------------------------"

WF_NAME=$(kubectl get workflows -o jsonpath='{.items[0].metadata.name}')
echo "[SYSTEM] Tracking Active ML Pipeline: $WF_NAME"
echo ""

echo ">>> [1/3] Awaiting Data Extraction Stage..."
kubectl wait --for=condition=ready pod -l workflows.argoproj.io/workflow=$WF_NAME,workflows.argoproj.io/template=data-extractor --timeout=60s > /dev/null 2>&1
sleep 4
EXTRACT_POD=$(kubectl get pods -l workflows.argoproj.io/workflow=$WF_NAME,workflows.argoproj.io/template=data-extractor -o jsonpath='{.items[0].metadata.name}')
kubectl logs $EXTRACT_POD
echo ""

echo ">>> [2/3] Awaiting Model Training Stage..."
kubectl wait --for=condition=ready pod -l workflows.argoproj.io/workflow=$WF_NAME,workflows.argoproj.io/template=model-trainer --timeout=60s > /dev/null 2>&1
sleep 6
TRAIN_POD=$(kubectl get pods -l workflows.argoproj.io/workflow=$WF_NAME,workflows.argoproj.io/template=model-trainer -o jsonpath='{.items[0].metadata.name}')
kubectl logs $TRAIN_POD
echo ""

echo ">>> [3/3] Awaiting Model Evaluation Stage..."
kubectl wait --for=condition=ready pod -l workflows.argoproj.io/workflow=$WF_NAME,workflows.argoproj.io/template=model-evaluator --timeout=60s > /dev/null 2>&1
sleep 3
EVAL_POD=$(kubectl get pods -l workflows.argoproj.io/workflow=$WF_NAME,workflows.argoproj.io/template=model-evaluator -o jsonpath='{.items[0].metadata.name}')
kubectl logs $EVAL_POD

echo "--------------------------------------------------------"
echo "Notice the execution architecture. You submitted a single YAML file, and the cluster autonomously orchestrated three distinct, dependent lifecycle stages."