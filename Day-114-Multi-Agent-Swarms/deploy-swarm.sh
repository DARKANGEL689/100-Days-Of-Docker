#!/bin/bash
echo "Uploading Complex Task Intent to Cluster..."
kubectl apply -f 1-swarm-intent.yaml

echo "Injecting Swarm Cognitive Logic (Architect, Engineer, Auditor)..."
kubectl apply -f 2-swarm-logic.yaml

echo "Initiating Multi-Agent Swarm Orchestration..."
kubectl delete job multi-agent-swarm-run --ignore-not-found
kubectl apply -f 3-swarm-job.yaml

echo "The Swarm is awake. Waiting for consensus and synthesis (this may take 1-2 minutes)..."
sleep 5
kubectl wait --for=condition=complete job/multi-agent-swarm-run --timeout=300s || true