#!/bin/bash
echo "Auditing Active Prometheus Service Monitors..."
echo "--------------------------------------------"
kubectl get servicemonitors -A
echo "--------------------------------------------"
echo "If 'api-monitor' is listed, Prometheus is actively scraping your application."