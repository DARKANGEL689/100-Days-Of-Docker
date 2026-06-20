#!/bin/bash
echo "Executing clean teardown of Day 94 Architecture..."
export KUBECONFIG=~/.kube/karmada.config
kubectl delete -f 2-propagation-policy.yaml --ignore-not-found
kubectl delete -f 3-override-policy.yaml --ignore-not-found
kubectl delete -f 1-global-workload.yaml --ignore-not-found

echo "Teardown complete. Global fleet synchronized to empty state."