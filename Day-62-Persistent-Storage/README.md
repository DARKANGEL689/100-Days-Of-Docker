## Day 62: Persistent Data Architecture (PVCs & StatefulSets)

**Objective:** Engineer stateful architecture to decouple storage lifecycles from ephemeral compute lifecycles, guaranteeing data survival across container terminations.

### Architecture & Engineering Logs
1. **Storage Requisition:** Authored `PersistentVolumeClaim` manifests to dynamically request host-level disk allocation.
2. **Volume Mounting:** Engineered `Deployment` specifications to intercept abstract storage claims and physically map them to container file directories.
3. **Chaos Engineering (Amnesia Test):** Scripted automated container assassinations to validate dynamic persistent volume reattachment and data survival.
4. **Headless Networking:** Engineered `clusterIP: None` Services to bypass kube-proxy load balancing, enabling direct DNS resolution for stateful nodes.
5. **StatefulSets:** Designed Enterprise `StatefulSet` architecture featuring strict ordinal scaling (`pod-0`, `pod-1`) and stable network identifiers.
6. **Volume Templates:** Implemented `volumeClaimTemplates` to autonomously stamp dedicated block storage for individual replica nodes within a distributed database cluster.