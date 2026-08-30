#!/bin/bash
echo "Auditing Distributed Compute Execution..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Extracting Distributed Job Logs:"
sleep 10 
kubectl logs job/ray-execution-job
echo ""

echo ">>> [2/2] Establishing tunnel to Ray Cluster Dashboard..."
echo "Execute this command in a separate terminal to view the supercomputer metrics:"
echo "kubectl port-forward svc/ml-supercluster-head-svc 8265:8265"
echo ""
echo "Once running, open your browser to: http://localhost:8265"
echo "You will see your active cluster topology, node metrics, and task lineage."
echo "--------------------------------------------------------"