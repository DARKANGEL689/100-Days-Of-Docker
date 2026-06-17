#!/bin/bash
echo "Cloning Official Kubernetes Autoscaler Repository..."
git clone https://github.com/kubernetes/autoscaler.git

echo "Deploying Vertical Pod Autoscaler Control Plane..."
cd autoscaler/vertical-pod-autoscaler
./hack/vpa-up.sh
cd ../..

echo "Waiting for VPA Recommender, Updater, and Admission Controller to boot..."
kubectl wait --namespace kube-system --for=condition=ready pod -l app=vpa-recommender --timeout=120s
echo "Vertical Pod Autoscaler is ONLINE. The AI is monitoring the cluster."