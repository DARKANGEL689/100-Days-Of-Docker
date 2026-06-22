#!/bin/bash
echo "Accessing the Machine Learning Factory Dashboard..."
echo "--------------------------------------------------------"
echo "Open: http://localhost:2746"
echo "Click your 'enterprise-ml-factory' workflow to see the real-time node graph."
echo "--------------------------------------------------------"
kubectl port-forward -n argo-rollouts svc/argo-server 2746:2746