#!/bin/bash
export PATH="$HOME/.rover/bin:$PATH"

echo "[COMPILER] Stitching subgraphs into Enterprise Supergraph..."
rover supergraph compose --config 3-federation-config.yaml > supergraph.graphql

echo "[CLUSTER] Uploading Compiled Supergraph Schema to ConfigMap..."
kubectl create configmap supergraph-schema --from-file=supergraph.graphql=supergraph.graphql -n default --dry-run=client -o yaml | kubectl apply -f -

echo "[CLUSTER] Deploying Apollo Router (Rust Edge Engine)..."
kubectl apply -f 4-router-deployment.yaml

echo "Waiting for the Supergraph Router to initialize..."
sleep 5
kubectl wait --for=condition=available deployment/enterprise-supergraph-router --timeout=120s

echo "GraphQL Federation is ONLINE. The API is unified."