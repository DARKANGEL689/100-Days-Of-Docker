#!/bin/bash
echo "Establishing secure tunnel to the Global Operations Center..."
echo "--------------------------------------------------------"
echo "URL: http://localhost:3000"
echo "Username: admin"
echo "Password: Protocol-300-Admin"
echo "--------------------------------------------------------"
echo "Navigate to 'Dashboards' -> 'Real-Time Enterprise Fraud Operations' to view the live telemetry stream."
kubectl port-forward svc/enterprise-visualizer-grafana 3000:80