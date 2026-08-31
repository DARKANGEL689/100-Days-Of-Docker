#!/bin/bash
echo "[INIT] Adding Istio Helm Repository..."
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

echo "[DEPLOY] Provisioning Istio Control Plane (istiod)..."
helm upgrade --install istio-base istio/base -n istio-system --create-namespace --wait
helm upgrade --install istiod istio/istiod -n istio-system --wait

echo "[NETWORK] Enabling Autonomous Sidecar Injection for the Default Namespace..."
kubectl label namespace default istio-injection=enabled --overwrite

echo "[DEPLOY] Provisioning Secure Workloads (Sidecars will be dynamically injected)..."
kubectl apply -f 1-secure-workloads.yaml
sleep 15
kubectl wait --for=condition=available deployment/secure-backend --timeout=120s
kubectl wait --for=condition=available deployment/secure-frontend --timeout=120s

echo "[DEPLOY] Provisioning Unencrypted Legacy Workload..."
kubectl apply -f 2-rogue-legacy-pod.yaml
sleep 5
kubectl wait --for=condition=available deployment/unencrypted-rogue-client -n legacy-system --timeout=120s

echo "[EXECUTE] Injecting STRICT mTLS Cryptographic Enforcement..."
kubectl apply -f 3-mtls-strict-policy.yaml
sleep 5

echo "Istio Service Mesh is ARMED. Zero-Trust internal encryption is active."