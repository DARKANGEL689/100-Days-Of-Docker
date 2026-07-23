#!/bin/bash
echo "Executing clean teardown of Day 132 Architecture..."
kubectl delete -f 1-wasteful-workload.yaml --ignore-not-found
echo "Teardown complete. Wasteful workload terminated. Capital bleed stopped."