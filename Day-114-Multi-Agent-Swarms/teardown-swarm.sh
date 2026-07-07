#!/bin/bash
echo "Executing clean teardown of Day 114 Architecture..."
kubectl delete -f 3-swarm-job.yaml --ignore-not-found
kubectl delete -f 2-swarm-logic.yaml --ignore-not-found
kubectl delete -f 1-swarm-intent.yaml --ignore-not-found
echo "Teardown complete. Collective consciousness suspended."