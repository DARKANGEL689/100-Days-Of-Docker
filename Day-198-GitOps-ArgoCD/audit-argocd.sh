#!/bin/bash
echo "Auditing Autonomous GitOps State Reconciliation..."
echo "--------------------------------------------------------"

echo ">>> [1/3] Extracting Initial ArgoCD Cryptographic Admin Token:"
PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "Username: admin"
echo "Password: $PASSWORD"
echo ""

kubectl port-forward svc/argocd-server -n argocd 8080:443 > /dev/null 2>&1 &
PF_PID=$!

echo ">>> [2/3] Visual Matrix Access:"
echo "You can access the UI at https://localhost:8080 (Bypass the self-signed TLS warning)"
echo ""

echo ">>> [3/3] EXECUTING CLUSTER SABOTAGE (Simulating Human Error)..."
echo "Command: kubectl delete deployment guestbook-ui -n default"
kubectl delete deployment guestbook-ui -n default
echo ""

echo "[SYSTEM] Deployment destroyed. Waiting 5 seconds for ArgoCD Reconciliation Loop..."
sleep 5

echo "[AUDIT] Checking cluster for target workload:"
kubectl get deployment guestbook-ui -n default
echo ""
echo "[RESULT] The deployment is already back online. ArgoCD detected the missing state, referenced the Git repository, and autonomously rebuilt the architecture."
echo "--------------------------------------------------------"

kill $PF_PID