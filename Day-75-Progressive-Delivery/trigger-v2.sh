#!/bin/bash
echo "Merging V2 (Yellow) Codebase..."
echo "Instructing Argo Rollouts to update the image and initiate the Canary Strategy!"
./kubectl-argo-rollouts.exe set image enterprise-api api=argoproj/rollouts-demo:yellow