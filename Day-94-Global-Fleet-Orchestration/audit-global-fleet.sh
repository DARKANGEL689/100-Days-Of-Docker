#!/bin/bash
echo "Auditing the Global Fleet..."
echo "--------------------------------------------------------"

echo "[GLOBAL VIEW] Querying Karmada Control Plane:"
export KUBECONFIG=~/.kube/karmada.config
kubectl get deployment global-enterprise-api
./karmadactl.exe get resourcebindings
echo ""

echo "[DATACENTER VIEW] Querying Physical 'member1' Cluster:"
export KUBECONFIG=~/.kube/config
kubectl get pods -l app=global-api
echo "--------------------------------------------------------"
echo "If you see 4 physical pods running in 'member1', the Armada successfully reached across the network and deployed your application!"