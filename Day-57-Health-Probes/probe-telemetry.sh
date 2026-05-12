#!/bin/bash
echo "Auditing Self-Healing Telemetry..."
echo "---------------------------------"
echo "Zombie Pod Restart Count:"
kubectl get pod zombie-app | awk '{print $4}'
echo "---------------------------------"
echo "Recent Health Events:"
kubectl describe pod zombie-app | grep -E 'Liveness probe failed|Killing'