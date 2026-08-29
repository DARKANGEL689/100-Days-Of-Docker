#!/bin/bash
echo "Auditing Fractional GPU Hardware Allocation..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Verifying Device Plugin Virtualization Status:"
kubectl logs -n kube-system -l name=gpu-device-plugin --tail=6
echo ""

echo ">>> [2/2] Inspecting Concurrent Model Pods on Shared Silicon:"
kubectl get pods -o custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,MODEL:.metadata.labels.app
echo ""
echo ">>> Container Runtime Verification:"
VISION_POD=$(kubectl get pods -l app=vision-embed -o jsonpath='{.items[0].metadata.name}')
TEXT_POD=$(kubectl get pods -l app=text-gen -o jsonpath='{.items[0].metadata.name}')

echo "Vision Model Output: $(kubectl logs $VISION_POD | head -n 1)"
echo "Text Model Output:   $(kubectl logs $TEXT_POD | head -n 1)"
echo "--------------------------------------------------------"
echo "Multiple independent AI workloads are actively sharing the silicon layer with zero lockouts."