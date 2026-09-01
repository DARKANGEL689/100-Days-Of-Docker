#!/bin/bash
echo "[INIT] Provisioning Core ArgoCD Control Plane..."
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "[WAIT] Aligning GitOps Controllers (30s)..."
sleep 30
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=120s

echo "[INIT] Injecting Autonomous Image Updater Operator..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-image-updater -n argocd --timeout=120s

echo "[DEPLOY] Submitting Autonomous Application to the Matrix..."
kubectl apply -f 1-autonomous-app.yaml

echo "Image Updater Matrix is ARMED. Polling registries for cryptographically signed updates."