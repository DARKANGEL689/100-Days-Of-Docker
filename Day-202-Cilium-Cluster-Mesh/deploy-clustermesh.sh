#!/bin/bash
echo "[INIT] Installing Cilium CLI for eBPF Network Management..."
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz > /dev/null 2>&1
tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin > /dev/null 2>&1

echo "[NETWORK] Enabling Cilium Cluster Mesh on Virtual Datacenter 1 (AWS)..."
cilium clustermesh enable --context kind-member-cluster-aws --service-type NodePort

echo "[NETWORK] Enabling Cilium Cluster Mesh on Virtual Datacenter 2 (GCP)..."
cilium clustermesh enable --context kind-member-cluster-gcp --service-type NodePort

echo "[WAIT] Aligning eBPF Certificate Authorities (15s)..."
sleep 15

echo "[MESH] Establishing Cryptographic Tunnel Between Datacenters..."
cilium clustermesh connect --context kind-member-cluster-aws --destination-context kind-member-cluster-gcp

echo "[DEPLOY] Provisioning Global Service and Backend to GCP Datacenter..."
kubectl apply -f 1-global-service.yaml --context kind-member-cluster-gcp
kubectl apply -f 2-cross-cluster-workload.yaml --context kind-member-cluster-gcp

echo "[DEPLOY] Provisioning Global Service and Frontend to AWS Datacenter..."
kubectl apply -f 1-global-service.yaml --context kind-member-cluster-aws
kubectl apply -f 2-cross-cluster-workload.yaml --context kind-member-cluster-aws

echo "eBPF Multi-Cluster Mesh is ARMED. Networks have been mathematically fused."