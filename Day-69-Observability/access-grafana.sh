#!/bin/bash
echo "Extracting Grafana Admin Credentials..."
echo "--------------------------------------"
echo "Username: admin"
echo -n "Password: "
kubectl get secret --namespace observability enterprise-metrics-grafana -o jsonpath="{.data.admin-password}" | base64 -d
echo ""
echo "--------------------------------------"
echo "Port-forwarding Grafana Web UI..."
echo "Open your browser to: http://localhost:3000"
echo "Navigate to Dashboards -> General -> 'Kubernetes / Compute Resources / Namespace (Workloads)' to see your CPU spikes!"
kubectl port-forward -n observability svc/enterprise-metrics-grafana 3000:80