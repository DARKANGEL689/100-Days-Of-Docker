# Day 20: Advanced API Gateway & NGINX Ingress

Today marks the 20% milestone of the 100-day journey. I eliminated `port-forwarding` by architecting an enterprise-grade API Gateway using NGINX Ingress, complete with Layer 7 routing and edge security.

## Architecture & Security Implemented:
1. **Edge Controller:** Deployed the `NGINX Ingress Controller` as a centralized reverse proxy.
2. **Local FQDNs:** Engineered local DNS overrides (`/etc/hosts`) to resolve `grafana.local` to the loopback adapter.
3. **Fan-Out Multiplexing:** Configured path-based routing to serve multiple distinct microservices (`/` and `/api`) from a single domain.
4. **DDoS Mitigation:** Implemented `limit-rps` annotations to automatically block high-frequency request spam.
5. **Payload Restrictions:** Configured `proxy-body-size` limits to protect internal services from buffer overflow attacks.
6. **CORS Enforcement:** Hardened Cross-Origin Resource Sharing policies to prevent malicious cross-site requests.