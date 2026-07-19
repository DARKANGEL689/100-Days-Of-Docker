#!/bin/bash
echo "Injecting Hardware Slicing (MIG) Configuration..."
kubectl apply -f 1-mig-profile.yaml

echo "Labeling worker nodes to trigger the physical partition sequence..."
kubectl label nodes --all nvidia.com/mig.config=all-1g.5gb --overwrite

echo "Waiting for hardware partitioning to complete (this resets the GPU)..."
sleep 10

echo "Deploying Concurrent AI Inferencing Workloads..."
kubectl apply -f 2-ai-inferencing.yaml

echo "Waiting for pods to lock onto virtual GPU slices..."
sleep 5
kubectl wait --for=condition=available deployment/local-llm-inferencing --timeout=120s

echo "Workloads ONLINE. They are running concurrently on shared physical hardware."