#!/bin/bash
echo "[HACKER MODE] Attempting to overwrite a system binary with malware..."
POD_NAME=$(kubectl get pod -l app=innocent-api -o jsonpath='{.items[0].metadata.name}')

kubectl exec $POD_NAME -- /bin/sh -c "touch /bin/malware_miner" > /dev/null 2>&1
echo "Binary mutation attempted."