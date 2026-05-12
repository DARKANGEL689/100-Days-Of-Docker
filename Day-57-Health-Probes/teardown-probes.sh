#!/bin/bash
echo "Executing clean teardown of Day 57 Architecture..."
kubectl delete pod zombie-app cache-loader-app heavy-legacy-app --ignore-not-found
kubectl delete service probe-service --ignore-not-found
echo "Teardown complete."