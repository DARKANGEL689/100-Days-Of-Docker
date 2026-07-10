#!/bin/bash
echo "Auditing Global Fleet Distribution Matrix..."
echo "--------------------------------------------------------"

echo "[1] Checking Replica Distribution Status:"
karmadactl get deployment enterprise-global-api

echo ""
echo "[2] Verifying Geographic Sub-Cluster Assignments:"
karmadactl get pods -l app=global-api --show-clusters

echo "--------------------------------------------------------"
echo "If AWS (us-east-cluster) fails, Karmada will automatically detect the connection drop and instantly spin up the lost replicas in GCP (eu-west-cluster)."