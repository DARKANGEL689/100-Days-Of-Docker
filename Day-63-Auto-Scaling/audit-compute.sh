#!/bin/bash
echo "Querying Physical Hardware Utilization (Node):"
kubectl top node
echo "---------------------------------------------------"
echo "Querying Individual Pod Compute Draw:"
kubectl top pods