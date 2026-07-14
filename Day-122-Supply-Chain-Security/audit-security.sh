#!/bin/bash
echo "Auditing Software Supply Chain Defenses..."
echo "--------------------------------------------------------"

echo "ATTACK: Attempting to deploy an unauthorized, unsigned Docker image..."
kubectl apply -f 2-rogue-workload.yaml

echo ""
echo "--------------------------------------------------------"
echo "If you see a server error stating 'admission webhook Validation failed... image verification failed', your architecture is perfectly secure."
echo "No hacker can execute code in your cluster without stealing your offline private keys."