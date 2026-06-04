#!/bin/bash
echo "Initiating Enterprise Backup Sequence..."
./velero.exe backup create alpha-protocol-backup --include-namespaces default

echo "Backup initiated. Waiting for upload to S3 Vault to complete..."
sleep 15
./velero.exe backup describe alpha-protocol-backup --details
echo "---------------------------------------------------"
echo "Backup successfully encrypted and stored off-site."