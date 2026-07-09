#!/bin/bash
echo "Auditing Kernel-Level Packet Flows (eBPF/Hubble)..."
echo "--------------------------------------------------------"

kubectl port-forward -n kube-system svc/hubble-relay 4245:80 &
RELAY_PID=$!
sleep 3

echo "Extracting the last 10 L7 Network Events from the Linux Kernel:"
hubble observe --pod grpc-server --last 10 --protocol grpc

echo "--------------------------------------------------------"
echo "If you see 'FORWARDED' it means the traffic met the strict CilliumNetworkPolicy."
echo "If you see 'DROPPED', the kernel successfully blocked an unauthorized lateral movement attempt."

kill $RELAY_PID