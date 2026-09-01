#!/bin/bash
echo "Executing clean teardown of Day 172 Architecture..."
kubectl delete -f 1-autonomous-app.yaml --ignore-not-found
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml --ignore-not-found
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml --ignore-not-found
kubectl delete namespace argocd --ignore-not-found
echo "Teardown complete. GitOps loops collapsed."