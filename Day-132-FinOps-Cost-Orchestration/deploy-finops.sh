#!/bin/bash
echo "Deploying the Bleeding Capital Workload (Simulated Developer Waste)..."
kubectl apply -f 1-wasteful-workload.yaml

echo "Waiting for the massive workload to schedule across the worker nodes..."
sleep 5
kubectl wait --for=condition=available deployment/legacy-java-monolith --timeout=120s

echo "Workload is ACTIVE. Kubernetes has reserved the resources."
echo "Kubecost is currently intercepting the API metrics and converting the CPU/RAM requests into USD."