#!/bin/bash
echo "Fetching latest KubeVirt release version..."
export VERSION=$(curl -s https://storage.googleapis.com/kubevirt-prow/release/kubevirt/kubevirt/stable.txt)

echo "Deploying KubeVirt Operator..."
kubectl create -f https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt-operator.yaml

echo "Deploying KubeVirt Custom Resource Definitions..."
kubectl create -f https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/kubevirt-cr.yaml

echo "Waiting for Operator to boot..."
sleep 10
kubectl wait --namespace kubevirt --for=condition=ready pod -l app.kubernetes.io/component=virt-operator --timeout=120s

echo "Patching KubeVirt to enable Software Emulation (for local testing)..."
kubectl patch kubevirt kubevirt -n kubevirt --type=merge -p '{"spec":{"configuration":{"developerConfiguration":{"useEmulation":true}}}}'

echo "Downloading KubeVirt Executive CLI (virtctl) for Windows..."
curl -sL -o virtctl.exe https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/virtctl-${VERSION}-windows-amd64.exe
chmod +x virtctl.exe

echo "KubeVirt is ONLINE. The cluster can now hypervise Virtual Machines."