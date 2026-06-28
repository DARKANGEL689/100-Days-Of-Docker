#!/bin/bash
echo "Auditing Agentic Recall (RAG)..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l job-name=rag-agent-run -o jsonpath='{.items[0].metadata.name}')

echo "Extracting the Agent's thought process:"
kubectl logs $POD_NAME

echo "--------------------------------------------------------"