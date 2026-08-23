#!/bin/bash
echo "Executing clean teardown of Day 164 Architecture..."
kubectl delete -f 2-s3-bucket.yaml --ignore-not-found
kubectl delete -f 1-aws-provider.yaml --ignore-not-found
helm uninstall crossplane -n crossplane-system
kubectl delete namespace crossplane-system --ignore-not-found
echo "Teardown complete. External API schemas flushed."