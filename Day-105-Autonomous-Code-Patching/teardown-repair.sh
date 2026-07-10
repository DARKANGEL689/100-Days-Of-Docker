#!/bin/bash
echo "Executing clean teardown..."
kubectl delete job autonomous-repair-job --ignore-not-found
rm -rf trivy-scanner.exe