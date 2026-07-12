#!/bin/bash
echo "Registering AWS Provider into the Control Plane..."
kubectl apply -f 1-aws-provider.yaml
sleep 3

echo "Architecting Custom APIs (EnterpriseDatabase XRD & Composition)..."
kubectl apply -f 2-database-composition.yaml

echo "Submitting Developer Infrastructure Claim..."
kubectl apply -f 3-developer-claim.yaml

echo "Crossplane is negotiating with the AWS API..."
echo "Physical RDS instances are currently being provisioned without Terraform."