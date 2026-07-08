#!/bin/bash
echo "Executing clean teardown of Day 115 Architecture..."
kubectl delete -f 4-router-deployment.yaml --ignore-not-found
kubectl delete configmap supergraph-schema --ignore-not-found
rm supergraph.graphql
echo "Teardown complete. Router offline."