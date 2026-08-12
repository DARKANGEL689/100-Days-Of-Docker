#!/bin/bash
echo "[DEPLOY] Provisioning Untrusted AI Compute Instance..."
kubectl apply -f 1-untrusted-ai-worker.yaml

echo "[WAIT] Awaiting Pod Initialization..."
sleep 5
kubectl wait --for=condition=available deployment/secure-ai-worker --timeout=60s

echo "[DEPLOY] Injecting eBPF Egress NetworkPolicy (Cilium)..."
kubectl apply -f 2-cilium-egress-policy.yaml

echo "Egress Firewall is ARMED. Kernel-level outbound restrictions applied."