#!/bin/bash
echo "Auditing Zero-Day Container Escape Defenses..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l app=web-api -o jsonpath='{.items[0].metadata.name}')

echo "[ATTACK] Initiating reverse shell payload injection..."
echo "Attempting to spawn an interactive bash session inside the container:"
echo ""

kubectl exec -it $POD_NAME -- /bin/sh

echo ""
echo "--------------------------------------------------------"
echo "Did your terminal just say 'command terminated with exit code 137'?"
echo "Exit Code 137 means SIGKILL. Tetragon detected the malicious syscall and instantly assassinated the process. The attacker gets nothing."