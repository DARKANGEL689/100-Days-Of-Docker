#!/bin/bash
export KARPENTER_VERSION="v0.32.0"

echo "[INIT] Injecting CNCF Karpenter Custom Resource Definitions..."
kubectl apply -f https://raw.githubusercontent.com/aws/karpenter/${KARPENTER_VERSION}/pkg/apis/crds/karpenter.sh_nodepools.yaml
kubectl apply -f https://raw.githubusercontent.com/aws/karpenter/${KARPENTER_VERSION}/pkg/apis/crds/karpenter.k8s.aws_ec2nodeclasses.yaml

echo "[WAIT] Aligning API Server schemas (10s)..."
sleep 10

echo "[DEPLOY] Provisioning Serverless Compute NodePool Rules..."
kubectl apply -f 2-karpenter-nodepool.yaml

echo "[DEPLOY] Injecting Hardware-Busting AI Workload..."
kubectl apply -f 1-massive-ai-workload.yaml
sleep 5

echo "Karpenter Matrix is ARMED. Infrastructure constraints have been removed."