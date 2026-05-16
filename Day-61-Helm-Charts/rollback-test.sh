#!/bin/bash
echo "Checking Helm Release History..."
helm history v1-alpha

echo "Emergency detected. Initiating 1-second Rollback to Revision 1..."
helm rollback v1-alpha 1

echo "--------------------------------------------------------"
echo "Architecture restored to default parameters."
kubectl get pods