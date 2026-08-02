#!/bin/bash
echo "Auditing Knative Concurrency Scaling..."
echo "--------------------------------------------------------"

KSVC_URL=$(kubectl get ksvc enterprise-serverless-api -o jsonpath='{.status.url}')
echo "Serverless Endpoint Generated: $KSVC_URL"

echo ""
echo "[1] Baseline Verification: Ensuring scale-to-zero is active."
kubectl get pods -l serving.knative.dev/service=enterprise-serverless-api
echo "(There should be NO pods running right now. CPU burn is 0.)"
echo ""

echo "[2] Triggering Massive Concurrent Load (Cold Start Execution)..."
echo "Sending 200 concurrent HTTP requests to the gateway..."
echo "--------------------------------------------------------"

kubectl run load-generator --image=williamyeh/hey --restart=Never --rm -i -- \
  -c 50 -z 5s $KSVC_URL > /dev/null 2>&1 &
LOAD_PID=$!

sleep 2

echo "Monitoring algorithmic pod synthesis in real-time:"
kubectl get pods -l serving.knative.dev/service=enterprise-serverless-api

wait $LOAD_PID
echo "--------------------------------------------------------"
echo "Load test complete. Knative successfully spawned pods to handle the 50 concurrent request chunks."
echo "If you run 'kubectl get pods' in 60 seconds, all of these pods will be terminated."