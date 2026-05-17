#!/bin/bash
echo "Auditing StatefulSet Ordinal Boot Sequence and Dedicated PVC provisioning..."
echo "------------------------------------------------------------------------"
kubectl get pods -l app=stateful-db -w &
sleep 15
kill $! 

echo ""
echo "Auditing dynamically provisioned Persistent Volume Claims:"
kubectl get pvc -l app=stateful-db