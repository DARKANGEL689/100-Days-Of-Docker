#!/bin/bash
echo "[INIT] Adding Official Hardened SPIFFE/SPIRE Helm Repository..."
helm repo add spiffe https://spiffe.github.io/helm-charts-hardened/
helm repo update

echo "[DEPLOY] Installing SPIRE Custom Resource Definitions..."
helm upgrade --install spire-crds spiffe/spire-crds \
  --namespace spire-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning SPIRE Server, Agent DaemonSet & CSI Driver (Zero-Trust Mode)..."
helm upgrade --install spire spiffe/spire \
  --namespace spire-system \
  --set global.spire.trustDomain=matrix.internal \
  --set global.spire.clusterName=victus-matrix \
  --set spire-server.controllerManager.identities.clusterSPIFFEIDs.default.enabled=false \
  --wait

echo "[WAIT] Aligning SPIRE Server & Node Attestation Daemons (15s)..."
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=server -n spire-system --timeout=120s
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=agent -n spire-system --timeout=120s

echo "[DEPLOY] Injecting Cryptographic ClusterSPIFFEID Policy..."
kubectl apply -f 1-agent-spiffe-id.yaml

echo "[DEPLOY] Launching Attested AI Agent and Rogue Imposter Workloads..."
kubectl apply -f 2-attested-and-rogue-agents.yaml
kubectl wait --for=condition=ready pod/attested-ai-agent --timeout=90s
kubectl wait --for=condition=ready pod/rogue-imposter-pod --timeout=90s

echo "SPIFFE/SPIRE Identity Matrix is ARMED. Kernel-level workload attestation is live."