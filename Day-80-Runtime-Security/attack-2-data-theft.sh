#!/bin/bash
echo "[HACKER MODE] Attempting to exfiltrate root Linux passwords..."
POD_NAME=$(kubectl get pod -l app=innocent-api -o jsonpath='{.items[0].metadata.name}')

kubectl exec $POD_NAME -- cat /etc/shadow > /dev/null 2>&1
echo "File read attempted."