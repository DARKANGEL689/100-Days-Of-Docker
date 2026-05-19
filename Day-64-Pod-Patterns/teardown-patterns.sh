#!/bin/bash
echo "Executing clean teardown of Day 64 Architecture..."
kubectl delete pod strict-boot-app sidecar-log-shipper network-ambassador --ignore-not-found
kubectl delete svc dummy-database-svc --ignore-not-found
kubectl delete configmap ambassador-config --ignore-not-found
echo "Teardown complete."