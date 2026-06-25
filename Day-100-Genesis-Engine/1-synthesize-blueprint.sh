#!/bin/bash
echo "Synthesizing Declarative Blueprint for the 'Enterprise-Alpha' Child Cluster..."

./clusterctl.exe generate cluster enterprise-alpha \
  --kubernetes-version v1.28.0 \
  --control-plane-machine-count=1 \
  --worker-machine-count=2 \
  --flavor development \
  > 2-enterprise-alpha-cluster.yaml

echo "Blueprint synthesized: '2-enterprise-alpha-cluster.yaml'."
echo "Deploying the Blueprint to the Management Cluster..."
kubectl apply -f 2-enterprise-alpha-cluster.yaml

echo "--------------------------------------------------------"
echo "The Genesis Engine has received the blueprints. It is now physically building a new Kubernetes cluster in the background!"