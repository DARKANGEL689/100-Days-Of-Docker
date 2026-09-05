#!/bin/bash
echo "Auditing Cloud-Native Virtualization Architecture..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Extracting Virtual Machine Instance (VMI) State:"
kubectl get vmi legacy-app-server -o custom-columns=NAME:.metadata.name,PHASE:.status.phase,IP:.status.interfaces[0].ip,NODE:.status.nodeName
echo ""

echo ">>> [2/2] Extracting Underlying Hypervisor Pod:"
echo "Notice the 'virt-launcher' pod below. This is the Kubernetes container running the KVM/QEMU hypervisor that is hosting your full operating system."
kubectl get pods -l kubevirt.io/domain=legacy-app-server
echo "--------------------------------------------------------"
echo "If the VMI phase is 'Running', your cluster successfully booted a full OS kernel inside the container matrix."