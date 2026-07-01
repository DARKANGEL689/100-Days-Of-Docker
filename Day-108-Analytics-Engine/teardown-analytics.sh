#!/bin/bash
echo "Executing clean teardown of Day 108 Architecture..."
kubectl delete -f 1-clickhouse-cluster.yaml --ignore-not-found
echo "Teardown complete. Columnar storage detached."