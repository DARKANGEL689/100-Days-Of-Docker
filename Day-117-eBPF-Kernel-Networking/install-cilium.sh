#!/bin/bash
echo "Downloading Cilium CLI (eBPF Orchestrator)..."
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/master/stable.txt)
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-amd64.tar.gz
sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
rm cilium-linux-amd64.tar.gz

echo "Replacing kube-proxy with eBPF Kernel Hooks..."
cilium install \
  --set kubeProxyReplacement=strict \
  --set hubble.relay.enabled=true \
  --set hubble.ui.enabled=true

echo "Waiting for the eBPF Control Plane to synchronize..."
cilium status --wait

echo "Cilium is ONLINE. Legacy iptables have been bypassed."