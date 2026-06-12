#!/bin/bash
echo "Establishing secure tunnel to Hubble eBPF Observability Engine..."
echo "--------------------------------------------------------"
echo "Open your web browser to: http://localhost:12000"
echo "Select the 'default' namespace."
echo "You will see a live topological map of your microservices, and physical red arrows showing eBPF dropping the hacker's packets!"
echo "--------------------------------------------------------"
kubectl port-forward -n kube-system svc/hubble-ui 12000:80