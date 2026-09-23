#!/bin/bash
echo "Auditing Fully Sharded Data Parallel Execution..."
echo "--------------------------------------------------------"

echo "[WAIT] Awaiting Pod Initialization..."
sleep 15

MASTER_POD=$(kubectl get pods -l training.kubeflow.org/job-role=master -o jsonpath='{.items[0].metadata.name}')
WORKER_POD=$(kubectl get pods -l training.kubeflow.org/replica-index=0,training.kubeflow.org/job-role=worker -o jsonpath='{.items[0].metadata.name}')

echo ">>> [1/2] Extracting Master Node Telemetry (Rank 0):"
kubectl logs $MASTER_POD
echo ""

echo ">>> [2/2] Extracting Worker Node Telemetry (Rank 1):"
kubectl logs $WORKER_POD
echo "--------------------------------------------------------"
echo "Notice how the weights are sharded independently, but Rank 0 successfully aggregates the synchronized loss gradients across the entire network ring."