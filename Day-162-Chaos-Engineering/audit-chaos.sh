#!/bin/bash
echo "Auditing Autonomous System Auto-Healing..."
echo "--------------------------------------------------------"
echo "Watching the 'resilient-api' pods."
echo "You will see pods being violently terminated (Terminating state) every 10 seconds."
echo "Simultaneously, you will see the Control Plane instantly spawn replacements (ContainerCreating state) to maintain the 3-replica quorum."
echo ""
echo "Press Ctrl+C to exit the live watch."
echo "--------------------------------------------------------"

kubectl get pods -l app=resilient-api -w