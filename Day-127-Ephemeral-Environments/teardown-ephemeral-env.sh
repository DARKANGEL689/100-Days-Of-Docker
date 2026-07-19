#!/bin/bash
echo "Executing clean teardown of Day 127 Architecture..."
vcluster delete dev-environment-alpha -n host-namespace-alpha
kubectl delete namespace host-namespace-alpha --ignore-not-found
echo "Teardown complete. Virtual reality collapsed."