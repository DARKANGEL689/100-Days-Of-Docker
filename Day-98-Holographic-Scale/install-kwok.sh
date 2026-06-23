#!/bin/bash
echo "Deploying the Kubernetes Without Kubelet (KWOK) Controller..."

kubectl apply -f https://github.com/kubernetes-sigs/kwok/releases/download/v0.5.2/kwok.yaml

echo "Waiting for the Holographic Engine to boot..."
kubectl wait --namespace kube-system --for=condition=ready pod -l app=kwok-controller --timeout=120s

echo "KWOK Engine is ONLINE. Reality can now be simulated."