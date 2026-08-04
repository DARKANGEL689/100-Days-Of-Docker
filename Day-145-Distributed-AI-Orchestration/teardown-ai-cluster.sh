#!/bin/bash
echo "Executing clean teardown of Day 145 Architecture..."
kubectl delete -f 2-ray-training-job.yaml --ignore-not-found
kubectl delete -f 1-ray-cluster.yaml --ignore-not-found
echo "Teardown complete. Distributed AI nodes flushed and resources reclaimed."