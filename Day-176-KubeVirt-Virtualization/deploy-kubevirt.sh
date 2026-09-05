#!/bin/bash
export KUBEVIRT_VERSION="v1.1.1"

echo "[INIT] Provisioning KubeVirt Virtualization Operator..."
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-operator.yaml

echo "[WAIT] Aligning KubeVirt Controllers (20s)..."
sleep 20

echo "[INIT] Deploying KubeVirt Custom Resource to initialize hardware emulation..."
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-cr.yaml

echo "[WAIT] Awaiting KubeVirt Control Plane integration. This can take up to 2 minutes..."
kubectl wait -n kubevirt kubevirt kubevirt --for condition=Available --timeout=180s

echo "[DEPLOY] Injecting Legacy Virtual Machine into the Kubernetes Matrix..."
kubectl apply -f 1-legacy-vm.yaml
sleep 10

echo "KubeVirt Matrix is ARMED. Hardware emulation is booting."