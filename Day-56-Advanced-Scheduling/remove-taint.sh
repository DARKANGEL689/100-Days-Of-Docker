#!/bin/bash
NODE_NAME=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
echo "Removing 'Dedicated=Database' Taint from $NODE_NAME..."
kubectl taint nodes $NODE_NAME hardware-class=database:NoSchedule-
echo "Hardware restored to general compute pool."
