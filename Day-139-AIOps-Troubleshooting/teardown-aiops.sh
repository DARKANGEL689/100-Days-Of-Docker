#!/bin/bash
echo "Executing clean teardown of Day 139 Architecture..."
kubectl delete -f 2-failing-microservice.yaml --ignore-not-found
echo "Teardown complete. Failed workloads purged from the timeline."