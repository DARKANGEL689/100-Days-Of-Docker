#!/bin/bash
export KUBEVIRT_VERSION="v1.1.1"
echo "Executing clean teardown of Day 176 Architecture..."
kubectl delete -f 1-legacy-vm.yaml --ignore-not-found
sleep 5

kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-cr.yaml --ignore-not-found
kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-operator.yaml --ignore-not-found
echo "Teardown complete. Virtual hardware collapsed."