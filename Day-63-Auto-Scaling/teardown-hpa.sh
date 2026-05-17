#!/bin/bash
echo "Executing clean teardown of Day 63 Architecture..."
kubectl delete hpa web-cpu-scaler web-advanced-scaler --ignore-not-found
kubectl delete deployment scalable-web-server
kubectl delete svc web-balancer
kubectl delete pod load-generator --ignore-not-found
echo "Teardown complete. Autopilot disengaged."