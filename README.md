## Day 39: Stateful Workloads & Persistent Storage (MongoDB)
1. **Persistent Volumes:** Provisioned PVCs to decouple physical storage from ephemeral pod lifecycles.
2. **Stateful Routing:** Engineered Headless Services (`clusterIP: None`) for stable, predictable database networking.
3. **StatefulSet Deployment:** Deployed MongoDB as a StatefulSet to guarantee ordinal scaling and sticky volume attachment.
4. **Security & Initialization:** Injected root credentials via Kubernetes Secrets and volume-mounted initialization scripts via ConfigMaps.
5. **Disaster Recovery:** Configured a Kubernetes `CronJob` for automated, nightly `mongodump` archiving.
6. **Zero-Trust Network:** Enforced `NetworkPolicy` rules to restrict database access strictly to backend API components.