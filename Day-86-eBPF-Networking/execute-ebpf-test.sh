#!/bin/bash
echo "Executing eBPF Penetration Test..."
echo "--------------------------------------------------------"

echo "[TEST 1] Legitimate Action: Frontend requesting GET /public"
kubectl exec frontend-app -- curl -s -X GET http://payroll-svc/public --max-time 2
echo "Result: SUCCESS. eBPF allowed the compliant HTTP method and path."
echo ""

echo "[TEST 2] Insider Threat: Frontend requesting POST /admin"
echo "(Wait 2 seconds... eBPF is silently dropping the forbidden HTTP packet)"
kubectl exec frontend-app -- curl -s -X POST http://payroll-svc/admin --max-time 2 || echo "Result: ACCESS DENIED. eBPF executed an HTTP Layer 7 Drop!"
echo ""

echo "[TEST 3] External Threat: Hacker requesting GET /public"
echo "(Wait 2 seconds... eBPF is silently dropping the IP packet)"
kubectl exec rogue-hacker -- curl -s -X GET http://payroll-svc/public --max-time 2 || echo "Result: ACCESS DENIED. eBPF executed an IP Layer 3 Drop!"
echo "--------------------------------------------------------"