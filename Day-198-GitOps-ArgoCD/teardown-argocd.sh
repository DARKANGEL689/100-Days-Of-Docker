#!/bin/bash
echo "Executing clean teardown of Day 198 Architecture..."
kubectl delete -f 1-argocd-application.yaml --ignore-not-found
sleep 5
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml --ignore-not-found
kubectl delete namespace argocd --ignore-not-found
echo "Teardown complete. Continuous Delivery pipelines detached."