#!/bin/bash
echo "Auditing the Chaos Event Telemetry..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l job-name=autonomous-adversary-run -o jsonpath='{.items[0].metadata.name}')

kubectl logs $POD_NAME

echo "--------------------------------------------------------"