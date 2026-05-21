#!/bin/bash
echo "Downloading Kubeseal Encryption Engine for Windows..."
curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.1/kubeseal-0.27.1-windows-amd64.tar.gz | tar xz kubeseal.exe

echo "Fetching Public Key from Cluster and Encrypting Payload..."
./kubeseal.exe --format yaml < raw-secret.yaml > sealed-secret.yaml

echo "--------------------------------------------------------"
echo "Encryption Complete. View the safe payload:"
cat sealed-secret.yaml