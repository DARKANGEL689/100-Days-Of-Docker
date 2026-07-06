#!/bin/bash
echo "Auditing In-Memory Data Grid Performance..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l job-name=grid-latency-test -o jsonpath='{.items[0].metadata.name}')

echo "Extracting Grid Latency Telemetry:"
kubectl logs $POD_NAME

echo "--------------------------------------------------------"
echo "If your retrieval latency is under 2.0 milliseconds, you have successfully bypassed the database bottleneck."