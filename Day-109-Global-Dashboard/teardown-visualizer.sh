#!/bin/bash
echo "Executing clean teardown of Day 109 Architecture..."
kubectl delete -f 2-fraud-dashboard.yaml --ignore-not-found
kubectl delete -f 1-clickhouse-datasource.yaml --ignore-not-found
echo "Teardown complete."