#!/bin/sh
echo "[GITOPS] Initializing Version Control for newly synthesized microservice..."
cd /workspace/output

git config --global user.email "autonomous-agent@enterprise.local"
git config --global user.name "AI Software Factory"
git init

git add .
git commit -m "feat: Autonomous initial generation of enterprise-auth-api"

echo "[GITOPS] Codebase committed successfully."
echo "[GITOPS] Pushing to Enterprise Repository (Simulated)..."
git log -1 --stat
echo "[GITOPS] Microservice handed over to ArgoCD for deployment."