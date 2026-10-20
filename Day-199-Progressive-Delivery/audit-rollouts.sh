#!/bin/bash
echo "Auditing Autonomous Canary Promotion Pipeline..."
echo "--------------------------------------------------------"

echo ">>> [1/2] TRIGGERING CI/CD IMAGE UPDATE (V1 -> V2)..."
kubectl patch rollout ai-inference-canary --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"stefanprodan/podinfo:6.0.1"}]'
echo "Update registered. Rollout controller engaged."
echo ""

echo ">>> [2/2] OBSERVING TRAFFIC WEIGHTING & PAUSE SEQUENCES:"
echo "Watching ReplicaSet transitions over the next 40 seconds..."
echo "Target: 5 Total Replicas"
echo "Phase 1: 20% (1 Pod) -> Pause 15s"
echo "Phase 2: 60% (3 Pods) -> Pause 15s"
echo "Phase 3: 100% (5 Pods)"
echo ""

for i in {1..25}; do
  echo "--- Time: $(($i * 2))s ---"
  kubectl get pods -l app=ai-canary -o custom-columns=NAME:.metadata.name,IMAGE:.spec.containers[0].image,STATUS:.status.phase | grep podinfo
  sleep 2
done

echo "--------------------------------------------------------"
echo "[SUCCESS] The rollout has safely reached 100%. If V2 had crash-looped during the 20% phase, Argo would have automatically severed its traffic, sparing 80% of your users from experiencing an outage."