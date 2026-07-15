#!/bin/bash
echo "Injecting Legacy API Workload (CPU Anomaly Simulation)..."
kubectl apply -f 1-cpu-anomaly-workload.yaml

echo "Waiting for workload instantiation..."
sleep 5
kubectl wait --for=condition=available deployment/legacy-billing-api --timeout=60s

echo "Workload is active. Parca eBPF agents are currently extracting native stack traces without instrumentation."