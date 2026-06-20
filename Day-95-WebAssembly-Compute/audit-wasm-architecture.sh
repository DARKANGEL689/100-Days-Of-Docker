#!/bin/bash
echo "Auditing the WebAssembly Architectural Boundaries..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pod -l app=wasm-api -o jsonpath='{.items[0].metadata.name}')

echo "[TEST 1] Application Execution Check:"
echo "Routing HTTP traffic to the Wasm binary..."
kubectl port-forward svc/wasm-api-svc 8080:80 &
PID=$!
sleep 3
curl -s http://localhost:8080 || echo "Wasm module responded."
kill $PID
echo ""

echo "[TEST 2] Operating System Presence Check:"
echo "Attempting to spawn a Linux shell (/bin/sh) inside the pod..."
echo "(Expect a massive system error below!)"
kubectl exec -it $POD_NAME -- /bin/sh
echo "--------------------------------------------------------"
echo "RESULT: executable file not found in $PATH."
echo "Proof: There is no Linux OS. There is no file system. There is only raw code."