#!/bin/bash
echo "Upgrading VPA from Advisor Mode to Autonomous Mutation Mode..."
kubectl apply -f 3-vpa-autonomous.yaml
echo "The VPA Updater is now authorized to execute pods that do not meet the algorithmic resource targets."
echo "Within the next minute, the pod will be terminated and resurrected."