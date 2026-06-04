#!/bin/bash
echo "Executing clean teardown of DR Architecture..."
kubectl delete -f 1-mission-critical-db.yaml --ignore-not-found
kubectl delete -f 2-database-svc.yaml --ignore-not-found
./velero.exe backup delete alpha-protocol-backup --confirm
echo "Teardown complete. Velero Engine and S3 Vault remain active."