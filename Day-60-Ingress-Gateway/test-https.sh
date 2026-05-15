#!/bin/bash
echo "Auditing TLS SSL Termination & Redirection..."
echo "--------------------------------------"

echo "[TEST 1] Attempting insecure HTTP connection..."
curl -s -I -H "Host: the300protocol.local" http://localhost | grep "308 Permanent Redirect" && echo "SUCCESS: Insecure traffic forcibly redirected."

echo ""
echo "[TEST 2] Attempting secure HTTPS connection (-k to bypass self-signed warning)..."
curl -s -k -H "Host: the300protocol.local" https://localhost/api
echo ""
echo "--------------------------------------"