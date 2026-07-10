#!/bin/bash
echo "Downloading Karmada Fleet Commander CLI..."
curl -sL https://raw.githubusercontent.com/karmada-io/karmada/master/hack/install-cli.sh | bash

echo "Initializing the Karmada Global Control Plane..."
karmadactl init

echo "Simulating cross-cloud Member Cluster joins..."
echo "[AWS] Registering us-east-cluster into the Fleet..."
sleep 2
echo "Cluster 'us-east-cluster' joined successfully."

echo "[GCP] Registering eu-west-cluster into the Fleet..."
sleep 2
echo "Cluster 'eu-west-cluster' joined successfully."

echo "Fleet Control Plane is ONLINE. Multi-cloud routing available."