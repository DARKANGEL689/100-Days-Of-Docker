#!/bin/bash
echo "Deploying the Kata Containers Operator..."
kubectl apply -k github.com/kata-containers/kata-containers/tools/packaging/kata-deploy/kata-rbac/base
kubectl apply -k github.com/kata-containers/kata-containers/tools/packaging/kata-deploy/kata-deploy/base

echo "Waiting for the Kata Deploy DaemonSet to initialize hypervisor shims on all nodes..."
sleep 5
kubectl wait --namespace kube-system --for=condition=ready pod -l name=kata-deploy --timeout=300s

echo "Kata Containers Operator is ONLINE. Worker nodes are now capable of MicroVM orchestration."