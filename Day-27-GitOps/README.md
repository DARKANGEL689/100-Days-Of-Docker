# Day 27: Continuous Delivery & Automated GitOps

Today, I fundamentally shifted the cluster's deployment architecture from manual operational commands ("ClickOps") to a declarative, continuous GitOps pipeline using ArgoCD. GitHub is now the single source of truth.

## Architecture & Automation Implemented:
1. **The GitOps Engine:** Deployed the ArgoCD control plane and secured it behind an HTTPS-terminated NGINX Ingress controller.
2. **State Synchronization:** Authored declarative `Application` CRDs connecting live cluster state directly to the GitHub repository branch (`HEAD`).
3. **Automated Deployment:** Configured automated synchronization to instantly apply Git commits to the cluster without human intervention or terminal access.
4. **Self-Healing Infrastructure:** Engineered `prune` and `selfHeal` policies to automatically detect configuration drift and instantly revert unauthorized manual cluster mutations back to the Git baseline.