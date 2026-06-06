#!/bin/bash
echo "Adding Falco Security Helm Repository..."
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

echo "Deploying Enterprise Falco DaemonSet (eBPF Kernel Tracing)..."
helm install enterprise-falco falcosecurity/falco \
  --namespace falco-system \
  --create-namespace \
  --set driver.kind=modern_ebpf \
  --set tty=true

echo "Waiting for Falco eBPF Probes to attach to the Linux Kernel..."
kubectl rollout status daemonset/enterprise-falco -n falco-system --timeout=120s

echo "Falco is ONLINE. The Kernel is now under surveillance."