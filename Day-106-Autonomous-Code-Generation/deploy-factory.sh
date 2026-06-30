#!/bin/bash
echo "Loading Architect Intent into Cluster..."
kubectl apply -f 1-factory-intent.yaml

echo "Loading Factory Scripts into ConfigMap..."
kubectl create configmap factory-scripts \
  --from-file=2-builder-agent.py \
  --from-file=3-gitops-publisher.sh \
  -n default --dry-run=client -o yaml | kubectl apply -f -

echo "Initiating Autonomous Software Factory Sequence..."
kubectl delete job autonomous-software-factory --ignore-not-found
kubectl apply -f 4-factory-job.yaml

echo "The Factory is online. Waiting for generation sequence to complete..."
sleep 5
kubectl wait --for=condition=complete job/autonomous-software-factory --timeout=120s || true