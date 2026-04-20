# Day 34: Multi-Environment Kustomize & GitOps Integration

Today, I shifted from Helm templating to native Kubernetes `Kustomize` patching, engineering a strict multi-environment architecture without duplicating base YAML files.

## Architecture Implemented:
1. **Base & Overlay Separation:** Established a pristine `base/` architecture and engineered distinct `overlays/` for Development and Production environments.
2. **Strategic Merge Patching:** Utilized Kustomize to dynamically inject environment-specific labels, name prefixes, and replica counts (scaling Prod to 3, Dev to 1) without modifying the source truth.
3. **Multi-Environment GitOps:** Authored isolated ArgoCD `Application` CRDs for both `dev` and `prod` overlays, allowing a single Git repository to autonomously drive multiple independent cluster environments simultaneously.