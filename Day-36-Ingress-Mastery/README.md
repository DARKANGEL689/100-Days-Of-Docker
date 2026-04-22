## Day 36: Ingress Mastery & Layer 7 Load Balancing
1. **Controller Deployment:** Installed NGINX Ingress Controller via Helm.
2. **TLS Termination:** Secured the cluster using self-signed RSA certificates and Kubernetes TLS Secrets.
3. **Advanced Routing:** Configured path-based routing to handle multiple microservices behind a single IP.
4. **Traffic Shaping:** Implemented server-side rate limiting via Ingress Annotations to prevent API abuse.