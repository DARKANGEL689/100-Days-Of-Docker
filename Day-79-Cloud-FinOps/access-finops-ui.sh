#!/bin/bash
echo "Port-forwarding the Kubecost Financial Dashboard..."
echo "---------------------------------------------------"
echo "Open your browser to: http://localhost:9090"
echo "Navigate to 'Allocations' -> 'Namespaces' to view the physical dollar cost of your pods."
echo "(Note: It takes ~3-5 minutes for Prometheus to gather the first cost metrics!)"
echo "---------------------------------------------------"
kubectl port-forward --namespace kubecost deployment/enterprise-finops-cost-analyzer 9090:9090