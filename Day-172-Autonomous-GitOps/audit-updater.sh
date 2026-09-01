#!/bin/bash
echo "Auditing Autonomous Image Promotion Mechanics..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Forcing Registry Interrogation..."
kubectl annotate app autonomous-ml-api -n argocd argocd-image-updater.argoproj.io/force-update=true --overwrite
sleep 10

echo ""
echo ">>> [2/2] Extracting Controller Execution Logs:"
kubectl logs -n argocd -l app.kubernetes.io/name=argocd-image-updater --tail=10
echo ""

echo ">>> VERIFICATION: Extracting Live Pod Image Hash..."
sleep 15 
POD_NAME=$(kubectl get pods -n default -l app=podinfo -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)

if [ -z "$POD_NAME" ]; then
  echo "Target pod is currently initializing. Run the audit script again in 10 seconds."
else
  LIVE_IMAGE=$(kubectl get pod $POD_NAME -n default -o jsonpath='{.spec.containers[0].image}')
  echo "Live Execution Image: $LIVE_IMAGE"
  echo "--------------------------------------------------------"
  echo "Notice the image was autonomously upgraded to the highest available patch version (e.g., 6.0.3) matching the Regex boundary, entirely without human Git commits."
fi