#!/bin/bash
echo "CRITICAL ERROR DETECTED. Executing Emergency Rollback..."
./kubectl-argo-rollouts.exe abort enterprise-api
echo "Rollout aborted. Traffic reverted to 100% stable baseline."