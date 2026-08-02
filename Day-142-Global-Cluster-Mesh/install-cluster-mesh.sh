#!/bin/bash
echo "Upgrading Cilium Control Planes to act as Global Mesh hubs..."

cilium clustermesh enable --context context-aws --service-type LoadBalancer
cilium clustermesh enable --context context-gcp --service-type LoadBalancer

echo "Waiting for Mesh API servers to establish external connectivity..."
cilium clustermesh status --context context-aws --wait
cilium clustermesh status --context context-gcp --wait

echo "Fusing the AWS and GCP eBPF networks..."
cilium clustermesh connect --context context-aws --destination-context context-gcp

echo "Waiting for WireGuard cross-cloud tunnel negotiation..."
sleep 10
cilium clustermesh status --context context-aws

echo "Cluster Mesh is ONLINE. AWS and GCP now share a single, flat IP space."