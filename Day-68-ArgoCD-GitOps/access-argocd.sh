#!/bin/bash
echo "Extracting ArgoCD Admin Credentials..."
echo "--------------------------------------"
echo "Username: admin"
echo -n "Password: "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo ""
echo "--------------------------------------"
echo "Port-forwarding the Web UI. Do not close this terminal!"
echo "Open your browser to: https://localhost:8080"
echo "(Accept the self-signed certificate warning)"
kubectl port-forward svc/argocd-server -n argocd 8080:443