#!/bin/bash
echo "Adding JuiceFS CSI Helm Repository..."
helm repo add juicefs https://juicedata.github.io/juicefs-csi-driver/
helm repo update

echo "Deploying JuiceFS CSI Driver to the Control Plane..."
helm install juicefs-csi juicefs/juicefs-csi-driver \
  --namespace kube-system \
  --set webhook.enable=true

echo "Waiting for the Storage Operator to initialize across worker nodes..."
kubectl wait --namespace kube-system --for=condition=ready pod -l app.kubernetes.io/name=juicefs-csi-driver --timeout=120s

echo "JuiceFS CSI is ONLINE. The cluster can now mount distributed POSIX filesystems."