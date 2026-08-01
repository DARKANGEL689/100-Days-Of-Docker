#!/bin/bash
echo "Auditing XDP Bare-Metal Routing Maps..."
echo "--------------------------------------------------------"

CILIUM_POD=$(kubectl get pods -n kube-system -l k8s-app=cilium -o jsonpath='{.items[0].metadata.name}')

echo "Querying the physical NIC's eBPF Load Balancer array:"
echo "Command: cilium bpf lb list"
echo "--------------------------------------------------------"

kubectl exec -n kube-system $CILIUM_POD -- cilium bpf lb list

echo "--------------------------------------------------------"
echo "If you see your service IP mapped directly to backend Pod IPs here, the architecture is sound."
echo "Packets hitting your server are now evaluated and routed BEFORE standard OS memory allocation."