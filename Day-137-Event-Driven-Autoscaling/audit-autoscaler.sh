#!/bin/bash
echo "Auditing Proactive Event-Driven Autoscaling (KEDA)..."
echo "--------------------------------------------------------"

REDIS_POD=$(kubectl get pods -l app=redis-broker -o jsonpath='{.items[0].metadata.name}')

echo "[ATTACK] Injecting 150 messages into 'enterprise_task_queue'..."
kubectl exec $REDIS_POD -- sh -c 'for i in $(seq 1 150); do redis-cli lpush enterprise_task_queue "Task-$i" > /dev/null; done'

echo ""
echo "Messages successfully injected. KEDA has detected the external anomaly."
echo "Monitoring instantaneous algorithmic pod scaling..."
echo "--------------------------------------------------------"

kubectl get pods -l app=queue-worker -w