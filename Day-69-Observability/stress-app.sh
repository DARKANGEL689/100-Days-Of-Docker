#!/bin/bash
echo "Initiating simulated high-volume traffic spike..."
echo "Running in background. Keep this open while you check Grafana!"
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://telemetry-svc:8080; done"