## Day 117: eBPF Kernel Networking & Zero-Trust (Cilium)

**Objective:** Deprecate legacy `iptables` routing by deploying Cilium, an eBPF-based Container Network Interface (CNI). Establishing Layer 7 Zero-Trust network policies and deep packet observability natively within the Linux kernel to eliminate CPU routing overhead and block unauthorized lateral API movements.

### Architecture & Engineering Logs
1. **CNI Replacement:** Uninstalled legacy `kube-proxy` equivalents and bootstrapped the Cilium agent across all cluster nodes, injecting highly efficient eBPF bytecode directly into the kernel network stack.
2. **L7 Kernel Firewall:** Authored `CiliumNetworkPolicy` CRDs to enforce strict identity-based routing. Hardened the Day 116 gRPC boundaries by exclusively permitting HTTP/2 POST requests targeting specific Protobuf methods, dropping all other packets at the socket level.
3. **Omniscient Observability:** Deployed Hubble Relay and UI components to map cluster-wide Directed Acyclic Graphs (DAGs) of microservice communication based on raw TCP/UDP kernel metrics.
4. **Flow Telemetry:** Executed the `hubble observe` CLI utility to mathematically validate the packet forwarding and dropping mechanics of the newly engineered kernel mesh.