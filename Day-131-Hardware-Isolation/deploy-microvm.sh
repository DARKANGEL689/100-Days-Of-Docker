#!/bin/bash
echo "Registering Hardware Hypervisor (Kata RuntimeClass)..."
kubectl apply -f 1-kata-runtime.yaml

echo "Deploying Ultra-Secure Enterprise Workload..."
kubectl apply -f 2-secure-workload.yaml

echo "Waiting for hypervisors to provision isolated MicroVMs (approx 1-3 seconds)..."
sleep 5
kubectl wait --for=condition=available deployment/enterprise-vault-api --timeout=120s

echo "Hardware Isolation is ACTIVE. The workloads are running on dedicated kernels."