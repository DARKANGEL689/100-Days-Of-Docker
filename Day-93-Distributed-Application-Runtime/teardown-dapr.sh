#!/bin/bash
echo "Executing clean teardown of Day 93 Architecture..."
kubectl delete -f 4-business-microservice.yaml --ignore-not-found
kubectl delete -f 3-pubsub-component.yaml --ignore-not-found
kubectl delete -f 2-statestore-component.yaml --ignore-not-found
kubectl delete -f 1-redis-infrastructure.yaml --ignore-not-found
echo "Teardown complete. Dapr Control Plane remains active."