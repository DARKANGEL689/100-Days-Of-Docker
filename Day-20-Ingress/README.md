# Day 20: Edge Routing and NGINX Ingress

Today marks the 20% milestone of the 100-day journey. I eliminated the need for fragile `port-forwarding` by architecting a production-grade entry point for my cluster.

## Architecture Implemented:
1. **Edge Controller:** Deployed the `NGINX Ingress Controller` to act as the cluster's reverse proxy and Layer 7 traffic router.
2. **DNS Resolution:** Engineered local DNS overrides (`/etc/hosts`) to resolve custom domains (`grafana.local`, `argocd.local`) to the local loopback adapter.
3. **Declarative Routing:** Authored `Ingress` Kubernetes resources to dynamically map HTTP Host headers to internal ClusterIP services.