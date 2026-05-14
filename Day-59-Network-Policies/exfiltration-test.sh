#!/bin/bash
echo "Testing Data Exfiltration Prevention..."
echo "Compromised pod attempting to reach the external internet (google.com)..."
kubectl exec compromised-container -- sh -c 'wget -qO- --timeout=3 http://google.com' || echo "BLOCKED: Egress firewall prevented external communication."