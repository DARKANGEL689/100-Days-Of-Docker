#!/bin/bash
echo "Executing clean teardown of Day 157 Architecture..."
if [ -f pf.pid ]; then
    kill $(cat pf.pid)
    rm pf.pid
fi
helm uninstall ai-sandbox -n vcluster-tenant --wait
kubectl delete namespace vcluster-tenant --ignore-not-found
rm virtual-kubeconfig.yaml
echo "Teardown complete. Holographic sandbox collapsed."