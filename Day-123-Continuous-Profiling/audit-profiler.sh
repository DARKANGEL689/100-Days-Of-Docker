#!/bin/bash
echo "Auditing Microscopic CPU Telemetry..."
echo "--------------------------------------------------------"

echo "Establishing temporary tunnel to the Continuous Profiling Engine..."
kubectl port-forward -n parca-system svc/enterprise-profiler-parca 7070:7070 > /dev/null 2>&1 &
TUNNEL_PID=$!
sleep 3

echo "Tunnel established. Open your browser to:"
echo "http://localhost:7070"
echo "--------------------------------------------------------"
echo "Instructions:"
echo "1. In the 'Compare' or 'Profile' tab, search for the 'legacy-billing-api' pod."
echo "2. Look at the Flamegraph. You will visually see the exact 'compute_heavy_algorithm' Python function consuming 99% of the horizontal CPU block."
echo "3. Press CTRL+C to terminate the tunnel when finished."

wait $TUNNEL_PID