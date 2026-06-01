#!/bin/bash
echo "Terminating Virtual Cluster and purging tenant data..."
./vcluster.exe delete matrix-cluster --namespace enterprise-tenant-1
kubectl delete namespace enterprise-tenant-1 --ignore-not-found
echo "Teardown complete. Matrix dismantled."