#!/bin/bash
echo "Upgrading Cilium CNI to enable XDP (eXpress Data Path)..."

helm upgrade cilium cilium/cilium \
  --namespace kube-system \
  --reuse-values \
  --set bpf.lbExternalClusterIP=true \
  --set loadBalancer.acceleration=native \
  --set loadBalancer.mode=snat \
  --set devices=eth0+ 

echo "Waiting for the eBPF compiler to inject bytecode into the NIC drivers..."
sleep 10
kubectl rollout status daemonset/cilium -n kube-system --timeout=120s

echo "XDP Acceleration is ONLINE. The Linux kernel network stack has been bypassed."