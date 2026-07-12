#!/bin/bash
echo "Auditing Universal Control Plane Physical Provisioning..."
echo "--------------------------------------------------------"

echo "Querying Kubernetes for physical AWS RDS Instances:"
kubectl get instances.rds.aws.upbound.io

echo ""
echo "Querying Developer Claim Status:"
kubectl get enterprisedatabases.database.enterprise.local

echo "--------------------------------------------------------"
echo "Notice that the RDS instance is managed natively by K8s. If you delete it in AWS, K8s will instantly recreate it."