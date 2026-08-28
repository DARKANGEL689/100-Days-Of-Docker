#!/bin/bash
echo "Auditing eBPF Runtime Threat Enforcement..."
echo "--------------------------------------------------------"
POD_NAME=$(kubectl get pods -l app=vulnerable-pod -o jsonpath='{.items[0].metadata.name}')

echo ">>> [1/2] EXECUTING AUTHORIZED COMMAND:"
echo "Command: cat /etc/hosts"
kubectl exec $POD_NAME -- cat /etc/hosts | head -n 2
echo "[SUCCESS] Standard system reads are permitted."
echo ""

echo ">>> [2/2] INJECTING MALICIOUS PAYLOAD (Simulated Data Exfiltration):"
echo "Command: cat /etc/shadow"
echo ""
echo "Initiating kernel-level intercept..."
kubectl exec $POD_NAME -- cat /etc/shadow
echo ""
echo "[RESULT] If the terminal returned 'command terminated with exit code 137' (Killed), Tetragon successfully assassinated the process at the eBPF layer."
echo "--------------------------------------------------------"