#!/bin/bash
echo "[INIT] Adding vCluster Helm Repository..."
helm repo add loft https://charts.loft.sh
helm repo update

echo "[DEPLOY] Provisioning Virtual Kubernetes Control Plane..."
helm upgrade --install ai-sandbox loft/vcluster --namespace vcluster-tenant --create-namespace --wait

echo "[NETWORK] Extracting Virtual Kubeconfig..."
kubectl get secret vc-ai-sandbox -n vcluster-tenant --template={{.data.config}} | base64 -d > virtual-kubeconfig.yaml

echo "[NETWORK] Establishing encrypted tunnel to Virtual API Server..."
kubectl port-forward svc/ai-sandbox -n vcluster-tenant 8443:443 > /dev/null 2>&1 &
echo $! > pf.pid
sleep 3

sed -i 's/ai-sandbox.vcluster-tenant.svc:443/127.0.0.1:8443/g' virtual-kubeconfig.yaml

echo "[EXECUTE] Injecting Untrusted AI Payload into the Sandbox..."
kubectl --kubeconfig virtual-kubeconfig.yaml apply -f 1-sandbox-payload.yaml

echo "Virtual Sandbox is ARMED. AI Agents are trapped in the hologram."