#!/bin/bash
echo "Auditing Autonomous AI Cluster Triage..."
echo "--------------------------------------------------------"

echo "[1] Standard Kubernetes Output (What the human sees):"
kubectl get pods -l app=payment-api
echo "(It just says 'ImagePullBackOff'. The human has to dig into 'kubectl describe pod' and read the raw events to guess the context.)"
echo ""

echo "[2] AIOps Execution: Initiating LLM Diagnostic Scan..."
echo "Command: k8sgpt analyze --explain --namespace default"
echo "--------------------------------------------------------"

k8sgpt analyze --namespace default

echo "--------------------------------------------------------"
echo "If AI explanation is active, you will see output like:"
echo "'Error: Back-off pulling image nginx:1.999.0-enterprise'"
echo "'Explanation: The cluster is trying to pull an image that does not exist in the registry. It has backed off to prevent rate limiting.'"
echo "'Solution: Run kubectl set image deployment/payment-processing-api api=nginx:latest'"
echo "--------------------------------------------------------"
echo "The machine is diagnosing itself."