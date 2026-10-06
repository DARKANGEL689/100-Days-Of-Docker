#!/bin/bash
echo "Auditing Ray Distributed Computing Execution..."
echo "--------------------------------------------------------"

echo "[WAIT] Awaiting Python Script Execution..."
sleep 10
kubectl wait --for=condition=complete job/ray-execution-job --timeout=120s > /dev/null 2>&1

JOB_POD=$(kubectl get pods -l job-name=ray-execution-job -o jsonpath='{.items[0].metadata.name}')

kubectl logs $JOB_POD

echo "--------------------------------------------------------"
echo "If you ran 20 million Monte Carlo iterations in standard Python, it would take significantly longer because it runs on 1 core. Ray fractured the math into 4 chunks and solved it simultaneously across multiple virtual machines."