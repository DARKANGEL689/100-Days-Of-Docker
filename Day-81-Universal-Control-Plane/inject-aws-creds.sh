#!/bin/bash
echo "Generating Sandbox AWS Credentials..."

cat <<EOF > aws-creds.conf
[default]
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EOF

echo "Injecting cryptographic keys into the Crossplane vault..."
kubectl create secret generic aws-creds -n crossplane-system --from-file=creds=./aws-creds.conf

rm aws-creds.conf
echo "Keys injected. Crossplane is authorized to command AWS."