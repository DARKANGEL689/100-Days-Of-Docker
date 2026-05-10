#!/bin/bash
echo "Scanning cluster for FAILED batch jobs..."
echo "----------------------------------------"


kubectl get jobs -o json | jq -r '.items[] | select(.status.failed > 0) | .metadata.name' > failed_jobs.txt

if [ -s failed_jobs.txt ]; then
  echo "WARNING: The following jobs have failed execution:"
  cat failed_jobs.txt
else
  echo "All jobs have executed successfully."
fi

rm failed_jobs.txt
echo "----------------------------------------"
