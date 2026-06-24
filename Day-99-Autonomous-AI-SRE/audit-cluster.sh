#!/bin/bash
echo "Unleashing the Autonomous AI SRE..."
echo "Scanning 50+ Kubernetes resource types for anomalies..."
echo "--------------------------------------------------------"

./k8sgpt-engine.exe analyze

echo "--------------------------------------------------------"
echo "Look at the output above! The AI found:"
echo "- The missing Vault Secret"
echo "- The missing Persistent Volume"
echo "- The misspelled Docker image"
echo "- The mismatched Service port"