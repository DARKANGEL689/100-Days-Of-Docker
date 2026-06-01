#!/bin/bash
echo "AUDITING THE VIRTUAL CLUSTER (The Developer's Illusion)"
echo "------------------------------------------"
echo "[1] Fetching Namespaces..."
echo "Notice: Istio, Argo, and Gatekeeper are completely missing!"
kubectl get namespaces
echo ""

echo "[2] Fetching Hardware Nodes..."
echo "Notice: These are fake virtual nodes synthesized by the vcluster!"
kubectl get nodes
echo ""

echo "[3] Deploying Workloads into the Matrix..."
kubectl apply -f 2-virtual-workload.yaml
kubectl apply -f 3-virtual-service.yaml

echo "Waiting for virtual pods to stabilize..."
sleep 10
kubectl get pods
echo "------------------------------------------"
echo "From the developer's perspective, everything looks like a standard, dedicated Kubernetes cluster."