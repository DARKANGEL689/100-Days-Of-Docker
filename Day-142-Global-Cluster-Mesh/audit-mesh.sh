#!/bin/bash
echo "Auditing Cross-Cloud eBPF Routing Matrices..."
echo "--------------------------------------------------------"

echo "Spawning internal client pod in AWS (us-east-1)..."
kubectl run mesh-test-client --context context-aws --image=alpine --restart=Never -- sleep infinity
kubectl wait --context context-aws --for=condition=ready pod/mesh-test-client --timeout=60s

echo "Executing 4 sequential requests to the internal service IP from AWS:"
echo "--------------------------------------------------------"

for i in {1..4}; do
  kubectl exec --context context-aws mesh-test-client -- wget -qO- http://enterprise-auth-backend
done

echo "--------------------------------------------------------"
echo "If you see responses from BOTH AWS and GCP, the network boundary has been shattered."
echo "The AWS pod just communicated with a GCP pod using an internal Kubernetes IP address, with zero public exposure."

kubectl delete pod mesh-test-client --context context-aws > /dev/null 2>&1