#!/bin/bash
echo "Executing clean teardown of Day 111 Architecture..."
kubectl delete -f 4-chaos-job.yaml --ignore-not-found
kubectl delete -f 3-chaos-script.yaml --ignore-not-found
kubectl delete -f 2-adversary-rbac.yaml --ignore-not-found
kubectl delete -f 1-target-workload.yaml --ignore-not-found
echo "Teardown complete. Threat eliminated."