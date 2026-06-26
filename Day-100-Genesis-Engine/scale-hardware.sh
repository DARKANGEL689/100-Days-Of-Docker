#!/bin/bash
echo "Executing the Final Teardown Sequence..."
kubectl delete -f 2-enterprise-alpha-cluster.yaml
echo "Child cluster annihilated."
echo "The 100-Day Protocol is officially concluded."