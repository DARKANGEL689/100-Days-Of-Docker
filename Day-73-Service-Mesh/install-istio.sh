#!/bin/bash
echo "Downloading Istio Control Plane CLI..."
curl -L https://istio.io/downloadIstio | sh -
cd istio-*
export PATH=$PWD/bin:$PATH

echo "Deploying the Istio Service Mesh (Default Profile)..."
istioctl install --set profile=default -y

echo "Injecting Envoy Sidecar Proxies into the Default Namespace..."
kubectl label namespace default istio-injection=enabled --overwrite

echo "Istio Control Plane is ONLINE. The mesh is active."