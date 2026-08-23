#!/bin/bash
echo "Auditing Universal Control Plane API Extension..."
echo "--------------------------------------------------------"
echo ">>> Verifying AWS S3 Bucket resource exists natively in Kubernetes:"
kubectl describe bucket.s3.aws.upbound.io/mlops-telemetry-vault-164
echo "--------------------------------------------------------"
echo "Notice the cluster natively understands 'bucket.s3.aws.upbound.io'."