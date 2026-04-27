## Day 42: Zero-Trust Service Mesh (Istio & Envoy)
1. **Control Plane:** Deployed the `istiod` control plane and base CRDs via Helm.
2. **Autonomous Proxies:** Enabled namespace labeling for automatic Envoy sidecar proxy injection.
3. **Strict Security:** Enforced global `STRICT` mTLS PeerAuthentication, dropping all unencrypted internal cluster traffic.
4. **Edge Routing:** Provisioned the Istio Ingress Gateway and `VirtualService` definitions for mesh-native ingress.
5. **Chaos Engineering:** Injected artificial network latency (Fault Injection) via proxy manipulation without altering application code.
6. **Mesh Topography:** Deployed Kiali for real-time visual mapping of encrypted traffic flows and proxy telemetry.