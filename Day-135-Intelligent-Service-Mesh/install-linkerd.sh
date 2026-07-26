#!/bin/bash
echo "Downloading Linkerd CLI..."
curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

echo "Executing Cluster Pre-Flight Checks..."
linkerd check --pre

echo "Installing Linkerd Control Plane..."
linkerd install --crds | kubectl apply -f -
linkerd install | kubectl apply -f -

echo "Installing Linkerd Viz (Observability Dashboard)..."
linkerd viz install | kubectl apply -f -

echo "Waiting for the Service Mesh to initialize..."
linkerd check
echo "Linkerd is ONLINE. The mesh is ready to accept workloads."