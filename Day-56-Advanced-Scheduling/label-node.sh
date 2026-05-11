#!/bin/bash
NODE_NAME=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
echo "Attaching architectural label 'disk-tier=nvme' to $NODE_NAME..."
kubectl label nodes $NODE_NAME disk-tier=nvme --overwrite
echo "Node labeled successfully."
kubectl get nodes --show-labels | grep disk-tier
