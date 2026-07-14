#!/bin/bash
echo "Executing clean teardown of Day 122 Architecture..."
kubectl delete -f active-policy.yaml --ignore-not-found
kubectl delete -f 2-rogue-workload.yaml --ignore-not-found
rm active-policy.yaml
echo "Teardown complete. Admission webhooks deactivated."