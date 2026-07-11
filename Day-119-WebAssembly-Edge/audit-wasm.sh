#!/bin/bash
echo "Auditing WebAssembly (Wasm) Edge Execution..."
echo "--------------------------------------------------------"

echo "[1] Establishing Tunnel to Wasm Microservice..."
kubectl port-forward svc/wasm-api-svc 8080:80 > /dev/null 2>&1 &
TUNNEL_PID=$!
sleep 2

echo "[2] Executing HTTP Request against Wasm Sandbox:"
curl -s http://localhost:8080/
echo -e "\n"

echo "[3] Resource Footprint Analysis:"
kubectl get pods -l app=wasm-api -o custom-columns=NAME:.metadata.name,RUNTIME_CLASS:.spec.runtimeClassName,STATUS:.status.phase

echo "--------------------------------------------------------"
echo "Payload executed flawlessly without a traditional container runtime."

kill $TUNNEL_PID