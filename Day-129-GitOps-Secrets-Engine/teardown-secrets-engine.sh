#!/bin/bash
echo "Executing clean teardown of Day 129 Architecture..."
kubectl delete -f 3-secure-database-api.yaml --ignore-not-found
kubectl delete -f 2-external-secret-request.yaml --ignore-not-found
kubectl delete -f 1-aws-secret-store.yaml --ignore-not-found
echo "Teardown complete. Synthesized secrets and vault connections purged."