#!/bin/bash
echo "Port-forwarding the Chaos Mesh Executive Dashboard..."
echo "---------------------------------------------------"
echo "Open your browser to: http://localhost:2333"
echo "Here you can visually pause or resume the active chaos experiments."
echo "---------------------------------------------------"
kubectl port-forward -n chaos-mesh svc/chaos-dashboard 2333:2333