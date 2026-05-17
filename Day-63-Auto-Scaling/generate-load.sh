#!/bin/bash
echo "Initiating simulated DDoS traffic spike..."
echo "Running in background. Press Ctrl+C to stop viewing, but the attack will continue."
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://web-balancer; done"