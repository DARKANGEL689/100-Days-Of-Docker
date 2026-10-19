#!/bin/bash
echo "[INIT] Provisioning ArgoCD GitOps Control Plane..."
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "[WAIT] Aligning GitOps Synchronization Controllers (45s)..."
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=120s
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-application-controller -n argocd --timeout=120s

echo "[DEPLOY] Injecting Autonomous Application Boundary (Self-Healing Enabled)..."
kubectl apply -f 1-argocd-application.yaml

echo "[WAIT] Awaiting Git clone, state comparison, and dynamic deployment..."
sleep 10
kubectl wait --for=condition=available deployment/guestbook-ui -n default --timeout=120s

echo "GitOps Matrix is ARMED. The cluster is now autonomously mirroring the Git repository."