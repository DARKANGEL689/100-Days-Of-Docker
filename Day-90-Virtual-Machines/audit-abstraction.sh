#!/bin/bash
echo "Auditing the API Abstraction Layer..."
echo "--------------------------------------------------------"

echo "Querying Kubernetes for Pods:"
kubectl get pods -l kubevirt.io/vm=enterprise-legacy-vm
echo "(Notice the pod is named 'virt-launcher-xyz'. This pod is holding the VM!)"
echo ""

echo "Querying Kubernetes for VirtualMachines:"
kubectl get vms
echo "--------------------------------------------------------"