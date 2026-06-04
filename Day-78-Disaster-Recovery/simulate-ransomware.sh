#!/bin/bash
echo "CRITICAL ALERT: RANSOMWARE ATTACK DETECTED."
echo "Wiping production environment..."
kubectl delete deployment financial-database
kubectl delete svc finance-db-svc
kubectl delete pvc critical-data-pvc
echo "---------------------------------------------------"
echo "TOTAL SYSTEM FAILURE. The application and all persistent data have been destroyed."