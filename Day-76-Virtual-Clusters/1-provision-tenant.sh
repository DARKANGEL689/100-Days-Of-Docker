#!/bin/bash
echo "Provisioning Hard Multi-Tenancy Sandbox (Virtual Cluster)..."
echo "Building Virtual API Server inside the host cluster..."
./vcluster.exe create matrix-cluster --namespace enterprise-tenant-1

echo "--------------------------------------------------------"
echo "Synthesis Complete."
echo "Your kubeconfig has been temporarily hijacked."
echo "You are now logged into the Virtual Cluster. You are inside the Matrix."