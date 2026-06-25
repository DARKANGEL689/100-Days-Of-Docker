#!/bin/bash
echo "Extracting the cryptographic keys to the newly born cluster..."

./clusterctl.exe get kubeconfig enterprise-alpha > enterprise-alpha.kubeconfig

echo "--------------------------------------------------------"
echo "Keys extracted! Let's look inside the new cluster:"
export KUBECONFIG=$(pwd)/enterprise-alpha.kubeconfig

echo "Querying nodes inside 'enterprise-alpha':"
kubectl get nodes

echo ""
echo "Querying core namespaces inside 'enterprise-alpha':"
kubectl get namespaces
echo "--------------------------------------------------------"
echo "If you see the nodes above, YOU HAVE OFFICIALLY CREATED KUBERNETES WITH KUBERNETES."
export KUBECONFIG=~/.kube/config