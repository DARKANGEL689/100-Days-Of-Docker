#!/bin/bash
echo "Executing clean teardown of Day 130 Architecture..."
kubectl delete -f 2-vulnerable-api.yaml --ignore-not-found
kubectl delete -f 1-block-shells-policy.yaml --ignore-not-found
echo "Teardown complete. Kernel policies purged."