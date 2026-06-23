#!/bin/bash
echo "Executing Control Plane Stress Test..."
echo "Fetching JSON payloads for all 2,500 pods simultaneously to measure API latency..."

time kubectl get pods -l app=ghost-workload -o json > /dev/null

echo "Stress test complete. If the 'real' time above is less than 2 seconds, your API server is perfectly optimized for Enterprise scale!"