## Day 147: Network Topology-Aware Scheduling & Routing

**Objective:** Eliminate physical network switch latency and cross-AZ transit costs for distributed deep learning models. By enforcing strict spatial scheduling constraints, we compel the Kubernetes control plane to deploy parallel processing components onto the exact same physical racks, minimizing data-link network hops.

### Architecture & Engineering Logs
1. **Spatial Mapping:** Scripted the dynamic injection of `topology.kubernetes.io` labels directly into node metadata to map the physical datacenter boundaries.
2. **Affinity Engine:** Authored compute Deployments utilizing strict `podAffinity` rules keyed to rack-level topology, forcing synchronized model workers into adjacent silicon.
3. **Zone-Locked Routing:** Implemented `Topology Mode: Auto` via Service annotations, instructing kube-proxy/Cilium eBPF to construct routing tables that prioritize intra-zone endpoints, entirely bypassing the spine network layers.
4. **Placement Verification:** Scripted a node-mapping audit to definitively cross-reference runtime pod execution locations with their underlying hardware topology assignments.