#!/bin/bash
echo "Auditing Event-Driven Autoscaling (Queue Length Metric)..."
echo "--------------------------------------------------------"
echo ">>> [1/3] Verifying Zero Active Compute Footprint:"
kubectl get pods -l app=ai-worker
echo ""

echo ">>> [2/3] Executing 25 Asynchronous AI Jobs into the Message Broker..."
kubectl exec deployment/redis-broker -- /bin/sh -c '
for i in $(seq 1 25); do
  redis-cli rpush ai-job-queue "Tensor-Payload-$i" > /dev/null
done'
echo "[SUCCESS] Payloads buffered in Redis memory."
echo ""

echo ">>> [3/3] Observing KEDA Controller Autonomous Response..."
echo "Watch the worker pods instantly spawn to match the queue density."
echo "Once the queue is drained, wait ~30 seconds, and they will self-terminate."
echo "(Press Ctrl+C to exit the live watch)"
echo "--------------------------------------------------------"

kubectl get pods -l app=ai-worker -w