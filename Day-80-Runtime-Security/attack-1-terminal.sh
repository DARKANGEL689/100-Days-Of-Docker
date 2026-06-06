#!/bin/bash
echo "[HACKER MODE] Exploiting application to spawn an interactive shell..."
POD_NAME=$(kubectl get pod -l app=innocent-api -o jsonpath='{.items[0].metadata.name}')

kubectl exec $POD_NAME -- /bin/sh -c "echo 'Bypass complete. I am inside the container.'; exit"
echo "Terminal opened and closed."