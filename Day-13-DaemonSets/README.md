# Day 13: DaemonSets and Node-Level Architecture

Today, I engineered the infrastructure required to deploy and manage system-level agents across physical cluster nodes.

## Core Concepts Mastered:
1. **Global Distribution:** Guaranteed 1-to-1 Pod-to-Node scheduling using `DaemonSets`.
2. **Targeted Deployment:** Used `NodeSelectors` and Labels to restrict agents to specific hardware topologies (e.g., GPU nodes).
3. **Elevated Privileges:** Bypassed standard K8s isolation using `Tolerations` (Control Plane access), `hostNetwork` (physical network sniffing), and `hostPath` (physical file system mounting).
4. **Resilience:** Protected critical agents from OOM-killer evictions using `system-node-critical` PriorityClasses, and ensured zero-blind-spot upgrades using strict `maxUnavailable` RollingUpdate strategies.