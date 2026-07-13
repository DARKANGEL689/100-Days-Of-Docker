#!/bin/bash
echo "Injecting SPIFFE CSI Driver to intercept storage mounts..."
kubectl apply -f 1-spiffe-csi.yaml

echo "Registering Workload Fingerprints to the Trust Authority..."
./2-register-workloads.sh

echo "Deploying the Zero-Trust Enterprise API..."
kubectl apply -f 3-secure-workload.yaml

echo "Waiting for the Workload to boot and negotiate its cryptographic identity..."
sleep 5
kubectl wait --for=condition=available deployment/enterprise-secure-api --timeout=60s

echo "The Workload is ONLINE. Cryptographic passport has been issued to memory."