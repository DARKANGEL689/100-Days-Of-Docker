#!/bin/bash
echo "Executing clean teardown of Day 207 Architecture..."
kubectl delete -f 2-langgraph-job.yaml --ignore-not-found
kubectl delete -f 1-langgraph-controller.yaml --ignore-not-found
echo "Teardown complete. Synthetic workforce collapsed."