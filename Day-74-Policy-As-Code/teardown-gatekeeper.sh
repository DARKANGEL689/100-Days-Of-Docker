#!/bin/bash
echo "Executing clean teardown of Policy Configurations..."
kubectl delete -f 4-compliant-pod.yaml --ignore-not-found
kubectl delete -f 2-constraint-block-latest.yaml
kubectl delete -f 1-template-block-latest.yaml
echo "Teardown complete. Gatekeeper Controller remains active."