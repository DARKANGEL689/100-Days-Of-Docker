#!/bin/bash
echo "Adding Cilium/Tetragon Helm Repository..."
helm repo add cilium https://helm.cilium.io
helm repo update

echo "Deploying the Tetragon eBPF Security Engine..."
helm install tetragon cilium/tetragon \
  --namespace kube-system \
  --set tetragon.enableProcessCred=true \
  --set tetragon.enableProcessNs=true

echo "Waiting for the Kernel Forensics Engine to initialize..."
kubectl wait --namespace kube-system --for=condition=ready pod -l app.kubernetes.io/name=tetragon --timeout=120s

echo "Tetragon is ONLINE. The Linux kernel is now actively intercepting system calls."