#!/bin/bash
echo "Adding Alluxio Helm Repository..."
helm repo add alluxio https://owl.alluxio.io/helm
helm repo update

echo "Deploying the Alluxio Data Orchestration Layer..."
helm install enterprise-cache alluxio/alluxio \
  --namespace storage-cache \
  --create-namespace \
  --set master.count=1 \
  --set tier.ram.enabled=false \
  --set tier.ssd.enabled=true \
  --set tier.ssd.path=/mnt/nvme-local/alluxio-cache \
  --set tier.ssd.quota=50Gi

echo "Waiting for Data Orchestration Master and Local Workers to arm..."
kubectl wait --namespace storage-cache --for=condition=ready pod -l app=alluxio-master --timeout=150s
kubectl wait --namespace storage-cache --for=condition=ready pod -l app=alluxio-worker --timeout=150s

echo "Alluxio Data Orchestrator is ONLINE. Local NVMe SSD arrays are virtualized."