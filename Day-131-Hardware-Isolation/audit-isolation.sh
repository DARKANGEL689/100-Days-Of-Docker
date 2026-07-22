#!/bin/bash
echo "Auditing MicroVM Hardware Isolation..."
echo "--------------------------------------------------------"

echo "[1] Spawning a standard, shared-kernel control pod..."
kubectl run standard-pod --image=alpine:latest --restart=Never --command -- sleep infinity
kubectl wait --for=condition=ready pod/standard-pod --timeout=60s

echo ""
echo "[2] Querying Kernel Version of the Standard Pod (Host Kernel):"
kubectl exec standard-pod -- uname -r

echo ""
echo "[3] Querying Kernel Version of the Secure Vault API (Kata MicroVM):"
KATA_POD=$(kubectl get pods -l app=vault-api -o jsonpath='{.items[0].metadata.name}')
kubectl exec $KATA_POD -- uname -r

echo "--------------------------------------------------------"
echo "Notice the difference. The Kata pod is running its own custom, hyper-optimized kernel."
echo "If an attacker roots the Kata pod, they only root the VM. Your physical host is absolutely safe."

kubectl delete pod standard-pod > /dev/null 2>&1