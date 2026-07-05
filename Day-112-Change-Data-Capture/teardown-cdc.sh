#!/bin/bash
echo "Executing clean teardown of Day 112 Architecture..."
kubectl delete -f 2-debezium-connect.yaml --ignore-not-found
kubectl delete -f 1-postgres-source.yaml --ignore-not-found
echo "Teardown complete. Capture loops deactivated."