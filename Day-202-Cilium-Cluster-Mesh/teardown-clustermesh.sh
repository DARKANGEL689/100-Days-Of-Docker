#!/bin/bash
echo "Executing clean teardown of Day 202 Architecture..."
kubectl delete -f 2-cross-cluster-workload.yaml --context kind-member-cluster-aws --ignore-not-found
kubectl delete -f 1-global-service.yaml --context kind-member-cluster-aws --ignore-not-found
kubectl delete -f 2-cross-cluster-workload.yaml --context kind-member-cluster-gcp --ignore-not-found
kubectl delete -f 1-global-service.yaml --context kind-member-cluster-gcp --ignore-not-found

echo "Severing inter-cluster eBPF tunnels..."
cilium clustermesh disable --context kind-member-cluster-aws
cilium clustermesh disable --context kind-member-cluster-gcp
echo "Teardown complete. Datacenter isolation restored."