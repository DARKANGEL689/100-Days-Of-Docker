#!/bin/bash
echo "Auditing Cluster Survivability under Chaos..."
echo "-------------------------------------------"

echo "[TEST 1] Network Latency Check:"
echo "Pinging the application. You should see responses taking > 200ms instead of 1ms!"
POD_IP=$(kubectl get pod -l app=robust-api -o jsonpath='{.items[0].status.podIP}')
kubectl run -i --rm temp-tester --image=busybox --restart=Never -- ping -c 4 $POD_IP
echo ""

echo "[TEST 2] Pod Survivability (The Assassin):"
echo "Watching the cluster fight back. You will see pods terminating and new ones spinning up instantly."
echo "(Press Ctrl+C to stop watching)"
kubectl get pods -l app=robust-api -w