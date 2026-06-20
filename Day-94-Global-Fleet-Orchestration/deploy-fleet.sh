#!/bin/bash
echo "Targeting the Karmada Global Control Plane..."
export KUBECONFIG=~/.kube/karmada.config

echo "Uploading Application Architecture..."
kubectl apply -f 1-global-workload.yaml

echo "Uploading Geographic Override Mutations..."
kubectl apply -f 3-override-policy.yaml

echo "Executing Global Propagation..."
kubectl apply -f 2-propagation-policy.yaml

echo "The Armada is synchronizing..."