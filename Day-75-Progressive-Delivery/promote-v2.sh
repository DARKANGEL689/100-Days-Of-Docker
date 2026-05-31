#!/bin/bash
echo "QA Approved. Executing manual promotion..."
./kubectl-argo-rollouts.exe promote enterprise-api
echo "Rollout unlocked. Proceeding to 50% and autonomous timers."