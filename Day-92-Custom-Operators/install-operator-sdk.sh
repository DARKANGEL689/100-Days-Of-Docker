#!/bin/bash
echo "Initializing Python Operator SDK Environment..."
python -m venv operator-env
source operator-env/Scripts/activate

echo "Installing Kubernetes Operator Pythonic Framework (Kopf)..."
pip install kopf kubernetes

echo "Operator SDK is ONLINE. You are authorized to program the K8s API."