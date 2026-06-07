#!/bin/bash
echo "Executing clean teardown of Day 81 Architecture..."
kubectl delete -f 4-managed-rds-db.yaml --ignore-not-found
kubectl delete -f 3-managed-s3-bucket.yaml --ignore-not-found
kubectl delete -f 2-provider-config.yaml --ignore-not-found
kubectl delete secret aws-creds -n crossplane-system --ignore-not-found
echo "Teardown complete. Crossplane Engine remains active."