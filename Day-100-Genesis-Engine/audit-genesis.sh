#!/bin/bash
echo "Auditing the Genesis Sequence..."
echo "--------------------------------------------------------"

echo "Checking the status of the new Child Cluster:"
kubectl get cluster

echo ""
echo "Checking the physical hardware provisioning (Machines):"
kubectl get machines
echo "--------------------------------------------------------"
echo "Note: It takes about 2-3 minutes for the physical nodes to provision and the new API server to boot."
echo "Run this script again until the Cluster Phase says 'Provisioned'."