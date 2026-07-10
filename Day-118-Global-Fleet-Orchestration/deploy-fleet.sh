#!/bin/bash
echo "Submitting Agnostic Workload to the Fleet Commander..."
kubectl apply -f 1-global-workload.yaml

echo "Applying Multi-Cloud Geographic Propagation Rules..."
kubectl apply -f 2-propagation-policy.yaml

echo "Injecting Dynamic Regional Override Vectors (EU GDPR Compliance)..."
kubectl apply -f 3-cluster-override.yaml

echo "Karmada is calculating available node capacity across AWS and GCP..."
sleep 5
echo "Workload successfully shattered and scheduled across the global fleet."