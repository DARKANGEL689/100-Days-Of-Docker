# Day 27: GitOps & Continuous Delivery (ArgoCD)

Today, I fundamentally shifted the cluster's deployment architecture from manual operational commands ("ClickOps") to a declarative, continuous GitOps pipeline using ArgoCD.

## Architecture Implemented:
1. **The GitOps Engine:** Deployed the ArgoCD control plane, application controllers, and state management databases into a dedicated namespace.
2. **Secure Edge Routing:** Engineered an NGINX Ingress controller specifically configured for internal HTTPS backend protocols to securely route traffic to the Argo API.
3. **Automated PKI Integration:** Integrated `cert-manager` to automatically generate and attach TLS certificates to the `argocd.local` domain.
4. **Credential Extraction:** Successfully extracted and decoded the initial Base64-encoded administrator credentials to establish root UI access.