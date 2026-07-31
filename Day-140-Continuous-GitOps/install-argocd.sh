#!/bin/bash
echo "Deploying the ArgoCD GitOps Control Plane..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Installing ArgoCD CLI..."
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

echo "Waiting for the GitOps Engine to initialize..."
kubectl wait --namespace argocd --for=condition=ready pod -l app.kubernetes.io/name=argocd-server --timeout=120s
kubectl wait --namespace argocd --for=condition=ready pod -l app.kubernetes.io/name=argocd-application-controller --timeout=120s

echo "ArgoCD is ONLINE. The cluster is ready to establish continuous synchronization."