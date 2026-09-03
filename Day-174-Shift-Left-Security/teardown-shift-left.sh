#!/bin/bash
echo "Executing clean teardown of Day 174 Architecture..."
kubectl delete -f 2-hardened-workload.yaml --ignore-not-found
kubectl delete -f 1-vulnerable-workload.yaml --ignore-not-found
echo "Teardown complete. Matrix secured."