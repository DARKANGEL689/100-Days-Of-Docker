#!/bin/bash
echo "Auditing Knative Scale-to-Zero Mechanics..."
echo "--------------------------------------------------------"

KNATIVE_URL=$(kubectl get ksvc ephemeral-ml-api -o jsonpath='{.status.url}')
echo "[METRIC] Assigned Serverless Endpoint: $KNATIVE_URL"
echo ""

echo ">>> [1/3] Verifying Zero Active Pods..."
kubectl get pods -l serving.knative.dev/service=ephemeral-ml-api
echo "Expected State: No resources found."
echo ""

echo ">>> [2/3] Firing Cold-Start Inference Request..."
echo "Executing: curl -s $KNATIVE_URL"
curl -s $KNATIVE_URL | grep message
echo ""
echo "Pod instantly spawned to serve traffic:"
kubectl get pods -l serving.knative.dev/service=ephemeral-ml-api
echo ""

echo ">>> [3/3] Initiating Idle State Audit (Waiting 45 seconds)..."
echo "Traffic ceased. Awaiting automated assassination..."
sleep 45
kubectl get pods -l serving.knative.dev/service=ephemeral-ml-api
echo "Expected State: No resources found. Hardware memory successfully reclaimed."
echo "--------------------------------------------------------"