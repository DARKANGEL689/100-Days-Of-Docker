#!/bin/bash
echo "Auditing Kernel-Level CPU Profiling..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Verifying C++ process execution..."
kubectl logs -l app=cpu-stress-test --tail=5
echo ""

echo ">>> [2/2] Establishing tunnel to Parca Observability Engine..."
echo "Execute this command in a separate terminal to view the Flamegraph:"
echo "kubectl port-forward svc/parca -n parca 7070:7070"
echo ""
echo "Once running, open your browser to: http://localhost:7070"
echo "Search for 'burner' or 'cpp-worker' to see the exact C++ functions consuming the CPU block."
echo "--------------------------------------------------------"