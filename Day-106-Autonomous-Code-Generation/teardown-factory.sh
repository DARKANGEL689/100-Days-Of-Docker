#!/bin/bash
echo "Executing clean teardown of Day 106 Architecture..."
kubectl delete -f 4-factory-job.yaml --ignore-not-found
kubectl delete configmap factory-scripts --ignore-not-found
kubectl delete -f 1-factory-intent.yaml --ignore-not-found
echo "Teardown complete. Factory reset."