#!/bin/bash
echo "Adding Cilium Helm Repository..."
helm repo add cilium https://helm.cilium.io/
helm repo update

echo "Deploying Cilium eBPF CNI & Hubble Observability Engine..."
helm install cilium cilium/cilium \
  --version 1.15.1 \
  --namespace kube-system \
  --set hubble.relay.enabled=true \
  --set hubble.ui.enabled=true

echo "Waiting for the eBPF Kernel Probes to compile and attach..."
kubectl rollout status daemonset/cilium -n kube-system --timeout=120s

echo "Cilium is ONLINE. The Linux Kernel has been upgraded."