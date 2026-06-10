#!/bin/bash
echo "Executing clean teardown of Day 85 Architecture..."
kubectl delete -f 3-secure-pod.yaml --ignore-not-found
kubectl delete -f 2-rogue-pod.yaml --ignore-not-found
kubectl delete -f 1-crypto-policy.yaml --ignore-not-found
echo "Teardown complete. Kyverno Engine remains active."