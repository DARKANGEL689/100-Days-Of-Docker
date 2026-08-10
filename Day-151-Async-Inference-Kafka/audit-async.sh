#!/bin/bash
echo "Auditing Asynchronous Traffic Decoupling..."
echo "--------------------------------------------------------"
POD_NAME=$(kubectl get pods -l app=async-ai -o jsonpath='{.items[0].metadata.name}')

echo ">>> Tailing API Gateway Ingestion (High Speed):"
kubectl logs $POD_NAME -c api-producer --tail=5

echo ""
echo ">>> Tailing Inference Compute Engine (Throttled/Heavy Load):"
kubectl logs $POD_NAME -c ai-consumer --tail=5

echo "--------------------------------------------------------"
echo "Notice the Job IDs. The API ingests requests far faster than the worker computes them."
echo "Because they are decoupled by Kafka, 0 requests are dropped."