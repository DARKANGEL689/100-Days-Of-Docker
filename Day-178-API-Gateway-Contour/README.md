## Day 178: API Gateway & Layer 7 Rate Limiting (Contour & Envoy)

**Objective:** Protect expensive cluster compute resources from Application-Layer (L7) DDoS attacks and runaway client scripts by deploying a high-performance edge proxy capable of algorithmic traffic shaping.

### Architecture & Engineering Logs
1. **Edge Data Plane Provisioning:** Deployed the CNCF Project Contour architecture, separating the control plane (`contour`) from the high-throughput data plane (`envoy`) to intercept all inbound cluster ingress traffic.
2. **HTTPProxy Protocol Extension:** Bypassed standard Kubernetes Ingress limitations by engineering an `HTTPProxy` CRD, mapping external Fully Qualified Domain Names (FQDN) directly to internal Service endpoints.
3. **Algorithmic Rate Limiting:** Injected a `localRateLimitPolicy` directly into the Envoy routing mesh, configuring a strict 3-request-per-minute threshold at the ingress boundary.
4. **Traffic Shaping Audit:** Scripted a simulated HTTP burst attack, mathematically proving the proxy's capability to instantly transition from `HTTP 200 (OK)` state routing to `HTTP 429 (Too Many Requests)` packet drops without exposing backend workloads to computational stress.