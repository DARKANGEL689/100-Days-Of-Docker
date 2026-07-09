#!/bin/bash
echo "Executing clean teardown of Day 117 Architecture..."
kubectl delete -f 1-zero-trust-policy.yaml --ignore-not-found
kubectl delete -f 2-hubble-ui.yaml --ignore-not-found
echo "Policies purged. (Note: Cilium CNI remains active to maintain cluster networking)."