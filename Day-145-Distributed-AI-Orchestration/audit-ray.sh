#!/bin/bash
echo "Auditing Distributed Ray Execution..."
echo "--------------------------------------------------------"

echo "[1] Extracting Job Execution Telemetry:"
JOB_POD=$(kubectl get pods -l job-name=llm-distributed-training -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)

if [ -z "$JOB_POD" ]; then
    echo "Waiting for Job Pod to instantiate..."
    sleep 10
    JOB_POD=$(kubectl get pods -l job-name=llm-distributed-training -o jsonpath='{.items[0].metadata.name}')
fi

kubectl logs $JOB_POD

echo ""
echo "--------------------------------------------------------"
echo "Notice the different internal IP addresses in the logs. This proves your single Python script was physically fragmented and executed concurrently across multiple Kubernetes worker nodes."
echo ""

echo "[2] Establishing Secure Tunnel to the Ray Global Control Dashboard..."
HEAD_POD=$(kubectl get pods -l ray.io/node-type=head -o jsonpath='{.items[0].metadata.name}')
kubectl port-forward $HEAD_POD 8265:8265 > /dev/null 2>&1 &
TUNNEL_PID=$!

echo "Open your browser to: http://localhost:8265"
echo "You can view the real-time cluster utilization, actor distribution, and logical task graphs."
echo "Press CTRL+C to terminate the tunnel."

wait $TUNNEL_PID