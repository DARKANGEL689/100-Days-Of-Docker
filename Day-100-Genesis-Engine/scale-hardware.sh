#!/bin/bash
echo "Executing physical hardware scale-out on the Child Cluster..."

kubectl scale machinedeployment enterprise-alpha-md-0 --replicas=4

echo "Hardware scale-out initiated."
echo "Run './audit-genesis.sh' to watch the Management Cluster provision two brand new physical nodes!"