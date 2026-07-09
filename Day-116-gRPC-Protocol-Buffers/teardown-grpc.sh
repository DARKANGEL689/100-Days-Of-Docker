#!/bin/bash
echo "Executing clean teardown of Day 116 Architecture..."
kubectl delete -f 3-grpc-architecture.yaml --ignore-not-found
kubectl delete -f 2-grpc-logic.yaml --ignore-not-found
kubectl delete -f 1-service-contract.yaml --ignore-not-found
echo "Teardown complete. Binary streams closed."