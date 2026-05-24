#!/bin/bash
echo "Auditing Zero-Touch Cryptographic Pipeline..."
echo "-------------------------------------------"

echo "[1] Checking Global Issuer Status:"
kubectl get clusterissuers

echo ""
echo "[2] Verifying Autonomously Generated Certificates:"
kubectl get certificates -A

echo ""
echo "[3] Verifying Secret Injection:"
kubectl get secret auto-generated-tls-secret

echo ""
echo "[4] Penetration Testing Edge Routing (Bypassing local CA warning with -k):"
curl -s -k -v https://localhost 2>&1 | grep -E "subject:|issuer:|SECURE:"
echo "-------------------------------------------"
echo "If you see 'issuer: CN=the-300-protocol-ca', the pipeline is fully operational."