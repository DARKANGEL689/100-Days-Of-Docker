#!/bin/bash
echo "Deploying High-Frequency Target Workloads..."
kubectl apply -f 1-high-frequency-api.yaml

echo "Deploying XDP-Mapped L4 Load Balancer..."
kubectl apply -f 2-xdp-lb.yaml

echo "Waiting for Cilium to synchronize Service definitions with physical NIC eBPF maps..."
sleep 5
kubectl wait --for=condition=available deployment/edge-trading-api --timeout=60s

echo "Hardware Routing is ACTIVE."