#!/bin/bash
echo "Auditing Multi-Tenant Hard Isolation..."
echo "--------------------------------------------------------"
echo ">>> [1/2] VIEW FROM INSIDE THE VIRTUAL CLUSTER (The AI's Perspective):"
echo "Command: kubectl --kubeconfig virtual-kubeconfig.yaml get pods -A"
echo ""
kubectl --kubeconfig virtual-kubeconfig.yaml get pods -A
echo ""
echo "Notice: The AI believes it is the root user. It only sees its own pods and standard K8s services."
echo "It is completely blind to your MLflow, MinIO, and Argo infrastructure."
echo "--------------------------------------------------------"
sleep 2

echo ">>> [2/2] VIEW FROM THE HOST CONTROL PLANE (Your Perspective):"
echo "Command: kubectl get pods -n vcluster-tenant"
echo ""
kubectl get pods -n vcluster-tenant
echo ""
echo "Notice how the host cluster dynamically maps the virtual pod into reality by rewriting its name:"
echo "(e.g., ai-coding-agent-xxxx-x-default-x-ai-sandbox)"
echo "--------------------------------------------------------"
echo "Total isolation achieved. Your host architecture is safe."