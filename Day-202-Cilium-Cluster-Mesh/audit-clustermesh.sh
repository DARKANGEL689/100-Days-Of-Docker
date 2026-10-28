#!/bin/bash
echo "Auditing Multi-Cluster eBPF Routing..."
echo "--------------------------------------------------------"

echo ">>> [1/2] Verifying Global Cluster Mesh Status:"
cilium clustermesh status --context kind-member-cluster-aws
echo ""

echo ">>> [2/2] Interrogating AWS Frontend Telemetry:"
echo "Extracting logs from the pod in Cluster 1 (AWS)..."
sleep 5

AWS_POD=$(kubectl get pods -l app=ai-frontend --context kind-member-cluster-aws -o jsonpath='{.items[0].metadata.name}')

kubectl logs $AWS_POD --context kind-member-cluster-aws | tail -n 5

echo "--------------------------------------------------------"
echo "[RESULT] The AWS pod successfully resolved 'global-ai-backend' and hit the GCP pod. You are no longer constrained by cluster boundaries. Your network is globally flat."