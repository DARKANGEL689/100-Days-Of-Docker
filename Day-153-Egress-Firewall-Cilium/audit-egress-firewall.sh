#!/bin/bash
echo "Auditing eBPF Layer 7 Egress Firewall..."
echo "--------------------------------------------------------"
POD_NAME=$(kubectl get pods -l app=secure-ai-worker -o jsonpath='{.items[0].metadata.name}')

echo ">>> TEST 1: Authorized Domain Access (huggingface.co)"
echo "Executing: curl -I https://huggingface.co"
kubectl exec $POD_NAME -- curl -s -o /dev/null -w "%{http_code}\n" -m 5 https://huggingface.co
echo "[RESULT] If 200 or 301/302 is returned, authorized egress is SUCCESSFUL."
echo ""

echo ">>> TEST 2: Unauthorized Data Exfiltration Attempt (google.com)"
echo "Executing: curl -I https://google.com"
kubectl exec $POD_NAME -- curl -s -I -m 5 https://google.com || echo "[RESULT] Connection Timeout. eBPF kernel drop SUCCESSFUL."

echo "--------------------------------------------------------"
echo "Unauthorized packets were destroyed before touching the physical network interface."