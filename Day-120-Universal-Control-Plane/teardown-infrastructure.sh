#!/bin/bash
echo "Executing clean teardown of Day 120 Architecture..."
kubectl delete -f 3-developer-claim.yaml --ignore-not-found
kubectl delete -f 2-database-composition.yaml --ignore-not-found
kubectl delete -f 1-aws-provider.yaml --ignore-not-found
echo "Teardown complete. Physical cloud resources terminated autonomously."