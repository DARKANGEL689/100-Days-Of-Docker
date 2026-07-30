#!/bin/bash
echo "Installing K8sGPT CLI Engine..."
curl -sLO https://github.com/k8sgpt-ai/k8sgpt/releases/latest/download/k8sgpt_Linux_x86_64.tar.gz
tar -xzf k8sgpt_Linux_x86_64.tar.gz
sudo mv k8sgpt /usr/local/bin/k8sgpt
rm k8sgpt_Linux_x86_64.tar.gz

echo "Adding K8sGPT Helm Repository..."
helm repo add k8sgpt https://charts.k8sgpt.ai/
helm repo update

echo "Deploying the K8sGPT In-Cluster Operator..."
helm install aiops-operator k8sgpt/k8sgpt-operator \
  --namespace k8sgpt-system \
  --create-namespace

echo "Waiting for the AIOps Engine to integrate with the K8s API..."
kubectl wait --namespace k8sgpt-system --for=condition=ready pod -l app.kubernetes.io/name=k8sgpt-operator --timeout=120s

echo "K8sGPT is ONLINE. The AI is now reading the cluster state."