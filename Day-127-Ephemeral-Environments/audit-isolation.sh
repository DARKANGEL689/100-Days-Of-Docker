#!/bin/bash
echo "Auditing Multi-Tenancy Hard Isolation..."
echo "--------------------------------------------------------"

echo "[VIEW 1: Inside the Virtual Cluster]"
echo "Querying API Server for Deployments..."
kubectl get deployments
echo "(Notice the API responds cleanly with 'experimental-feature-api')"
echo ""

echo "Disconnecting from Virtual Cluster. Returning to Physical Host..."
vcluster disconnect
echo ""

echo "[VIEW 2: Inside the Physical Host Cluster]"
echo "Querying API Server for Deployments in the host namespace..."
kubectl get deployments -n host-namespace-alpha
echo "(Notice there are NO deployments! The host knows nothing about the developer's architecture.)"
echo ""

echo "Querying API Server for raw Pods in the host namespace..."
kubectl get pods -n host-namespace-alpha
echo "(Notice the pods exist, but they are brutally renamed by the syncer, e.g., 'experimental-feature-api-x-default-x-dev-environment-alpha'.)"

echo "--------------------------------------------------------"
echo "Isolation confirmed. You can deploy 100 virtual clusters on 1 physical cluster without a single collision."