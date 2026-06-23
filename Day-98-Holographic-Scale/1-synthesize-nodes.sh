#!/bin/bash
echo "Synthesizing 50 Holographic Worker Nodes..."

for i in {1..50}; do
  cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Node
metadata:
  annotations:
    node.alpha.kubernetes.io/ttl: "0"
    kwok.x-k8s.io/node: "admin"
  labels:
    beta.kubernetes.io/arch: amd64
    beta.kubernetes.io/os: linux
    type: kwok
  name: kwok-datacenter-node-$i
status:
  allocatable:
    cpu: "32"
    memory: "256Gi"
    pods: "110"
  capacity:
    cpu: "32"
    memory: "256Gi"
    pods: "110"
  nodeInfo:
    architecture: amd64
    kubeletVersion: fake
    operatingSystem: linux
  phase: Running
EOF
done

echo "Datacenter initialized."