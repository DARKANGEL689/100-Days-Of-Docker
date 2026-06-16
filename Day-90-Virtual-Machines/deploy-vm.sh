#!/bin/bash
echo "Deploying Virtual Machine to the cluster..."
kubectl apply -f 1-legacy-vm.yaml
kubectl apply -f 2-vm-service.yaml

echo "Waiting for the virt-launcher hypervisor pod to initialize..."
sleep 5
kubectl wait --for=condition=ready pod -l kubevirt.io/vm=enterprise-legacy-vm --timeout=120s

echo "Hypervisor Online. The Operating System is booting..."