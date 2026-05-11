## Day 56: Advanced Scheduling (DaemonSets, Taints, & Affinity)

**Objective:** Master the Kubernetes Scheduler to enforce hardware-specific workload targeting and cluster-wide agent distribution.

### Architecture & Engineering Logs
1. **Global Agents:** Deployed a `DaemonSet` to guarantee single-replica execution across all available physical nodes, simulating global logging infrastructure.
2. **Hardware Repulsion:** Engineered `NoSchedule` node Taints to repel unauthorized workloads from dedicated compute resources.
3. **VIP Authorization:** Authored workload `tolerations` to selectively bypass hardware taints for authorized applications.
4. **Hardware Identification:** Scripted imperative node labeling to classify underlying hardware capabilities (e.g., NVMe storage).
5. **Strict Targeting:** Implemented `nodeSelector` manifests to force workloads onto specifically labeled physical servers.
6. **Smart Fallbacks:** Engineered `NodeAffinity` to provide weighted, soft-preference scheduling, allowing workloads to fallback to general compute if specialized hardware is unavailable.
