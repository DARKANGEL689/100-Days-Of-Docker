#!/bin/bash
echo "Executing clean teardown of Day 201 Architecture..."
kubectl delete -f 2-federated-deployment.yaml --ignore-not-found
kubectl delete -f 1-propagation-policy.yaml --ignore-not-found
kubectl delete cluster member-cluster-aws --ignore-not-found
kubectl delete cluster member-cluster-gcp --ignore-not-found
helm uninstall karmada -n karmada-system
kubectl delete namespace karmada-system --ignore-not-found
echo "Teardown complete. Global federation links severed."