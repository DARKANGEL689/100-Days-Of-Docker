#!/bin/bash
echo "Adding KWasm Operator Helm Repository..."
helm repo add kwasm http://kwasm.sh/kwasm-operator/
helm repo update

echo "Deploying the KWasm Kernel Mutator..."
helm install kwasm-operator kwasm/kwasm-operator \
  --namespace kwasm \
  --create-namespace

echo "Waiting for the Operator to boot..."
kubectl wait --namespace kwasm --for=condition=ready pod -l app.kubernetes.io/name=kwasm-operator --timeout=120s

echo "Operator ONLINE. Ready to upgrade physical nodes."