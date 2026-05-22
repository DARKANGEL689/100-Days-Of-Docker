#!/bin/bash
echo "Executing clean teardown of GitOps Architecture..."
kubectl delete application the-300-protocol-app -n argocd
kubectl delete deployment gitops-api --ignore-not-found
kubectl delete svc gitops-svc --ignore-not-found
echo "Teardown complete. ArgoCD Agent remains on standby."