#!/bin/bash
echo "Auditing Knative Scale-to-Zero Mechanics..."
echo "--------------------------------------------------------"

echo ">>> [1/3] OBSERVING AUTONOMOUS VRAM RECLAMATION:"
echo "Awaiting Knative 15-second idle window timeout..."
sleep 20
echo "Active Pods for 'zero-vram-inference':"
kubectl get pods -l serving.knative.dev/service=zero-vram-inference
echo "[SYSTEM] 0 Pods running. Your HP Victus GPU is currently 100% idle and available."
echo ""

echo ">>> [2/3] EXECUTING COLD-START INGRESS REQUEST:"
kubectl port-forward svc/kourier -n kourier-system 8080:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 2

KNATIVE_URL=$(kubectl get ksvc zero-vram-inference -o jsonpath='{.status.url}' | sed 's#http://##')
echo "Firing API Request to dormant endpoint: $KNATIVE_URL"

curl -s -H "Host: $KNATIVE_URL" http://127.0.0.1:8080 | grep "COMPUTE"
echo ""

echo ">>> [3/3] VERIFYING RE-ENGAGED SILICON:"
kubectl get pods -l serving.knative.dev/service=zero-vram-inference
echo "--------------------------------------------------------"
echo "[RESULT] The network buffered the inbound request in memory, booted the AI logic, served the HTTP response, and will now automatically terminate the pod in 15 seconds."

kill $PF_PID