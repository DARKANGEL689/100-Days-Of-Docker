#!/bin/bash
echo "Executing clean teardown of Day 110 Architecture..."
helm uninstall global-ledger
kubectl delete pvc -l app.kubernetes.io/name=cockroachdb
echo "Teardown complete. Global ledger destroyed."