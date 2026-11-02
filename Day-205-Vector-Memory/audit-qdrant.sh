#!/bin/bash
echo "Auditing Agentic Retrieval-Augmented Generation (RAG)..."
echo "--------------------------------------------------------"

echo "[WAIT] Awaiting Database Ingestion and Semantic Query Execution (15s)..."
sleep 15
kubectl wait --for=condition=complete job/autonomous-memory-job --timeout=120s > /dev/null 2>&1

JOB_POD=$(kubectl get pods -l job-name=autonomous-memory-job -o jsonpath='{.items[0].metadata.name}')

kubectl logs $JOB_POD
