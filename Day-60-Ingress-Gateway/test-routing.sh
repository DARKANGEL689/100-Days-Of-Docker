#!/bin/bash
echo "Auditing Layer 7 Path-Based Routing..."
echo "--------------------------------------"

echo "[TEST 1] Hitting the Root Path (/) -> Should return Nginx Frontend"
curl -s -H "Host: the300protocol.local" http://localhost | grep -o "Welcome to nginx!" || echo "Frontend Failed"

echo ""
echo "[TEST 2] Hitting the API Path (/api) -> Should return JSON Backend"
curl -s -H "Host: the300protocol.local" http://localhost/api
echo ""
echo "--------------------------------------"