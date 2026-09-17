#!/bin/bash
export KARPENTER_VERSION="v0.32.0"
echo "Executing clean teardown of Day 183 Architecture..."
kubectl delete -f 1-massive-ai-workload.yaml --ignore-not-found
kubectl delete -f 2-karpenter-nodepool.yaml --ignore-not-found
kubectl delete -f https://raw.githubusercontent.com/aws/karpenter/${KARPENTER_VERSION}/pkg/apis/crds/karpenter.k8s.aws_ec2nodeclasses.yaml --ignore-not-found
kubectl delete -f https://raw.githubusercontent.com/aws/karpenter/${KARPENTER_VERSION}/pkg/apis/crds/karpenter.sh_nodepools.yaml --ignore-not-found
echo "Teardown complete. API schemas flushed."