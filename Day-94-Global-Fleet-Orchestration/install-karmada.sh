#!/bin/bash
echo "Downloading Karmada Fleet Commander (karmadactl)..."
curl -sL -o karmadactl.exe https://github.com/karmada-io/karmada/releases/download/v1.8.0/karmadactl-windows-amd64.exe
chmod +x karmadactl.exe

echo "Initializing the Global Control Plane (This will spin up a 'Cluster within a Cluster')..."
./karmadactl.exe init

echo "--------------------------------------------------------"
echo "Karmada is ONLINE. Extracting the Global Kubeconfig..."
export KUBECONFIG=~/.kube/karmada.config
kubectl config use-context karmada-apiserver

echo "Registering the underlying physical cluster as 'member1'..."
./karmadactl.exe join member1 --cluster-kubeconfig=$HOME/.kube/config
echo "Fleet Federation established."