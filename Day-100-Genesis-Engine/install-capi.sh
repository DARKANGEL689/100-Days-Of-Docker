#!/bin/bash
echo "Downloading the Genesis Engine (clusterctl)..."
curl -sL -o clusterctl.exe https://github.com/kubernetes-sigs/cluster-api/releases/latest/download/clusterctl-windows-amd64.exe
chmod +x clusterctl.exe

echo "Initializing the Management Cluster..."
echo "Injecting Cluster API Core, Bootstrap (Kubeadm), and Infrastructure (Docker) Providers..."
./clusterctl.exe init --infrastructure docker

echo "Waiting for the Genesis Controllers to boot..."
kubectl wait --namespace capi-system --for=condition=ready pod --all --timeout=120s
kubectl wait --namespace capd-system --for=condition=ready pod --all --timeout=120s

echo "Cluster API is ONLINE. Your cluster is now capable of creating other clusters."