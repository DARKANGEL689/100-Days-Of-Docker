#!/bin/bash
echo "Executing clean teardown of Progressive Delivery Architecture..."
kubectl delete -f 2-rollout-service.yaml --ignore-not-found
kubectl delete -f 1-canary-rollout.yaml --ignore-not-found
echo "Teardown complete. Argo Rollouts Controller remains active."