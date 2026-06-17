## Day 91: Right-Sizing & Vertical Pod Autoscaler (VPA)

**Objective:** Deprecate manual resource guessing and support non-horizontally scalable legacy architectures by engineering the Vertical Pod Autoscaler (VPA) to algorithmically calculate optimal hardware limits and autonomously mutate Kubernetes pod definitions in real-time.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Bootstrapped the official Kubernetes Autoscaler repository, deploying the VPA Recommender, Updater, and Mutating Admission Webhook.
2. **Workload Starvation Simulation:** Provisioned a legacy deployment requesting minimal baseline compute (`10m` CPU) while executing heavy continuous shell-based CPU consumption.
3. **Algorithmic Advisement:** Authored VPA CRDs utilizing `updateMode: Off` to securely generate mathematical `Target`, `LowerBound`, and `UpperBound` hardware recommendations without risking pod termination.
4. **Autonomous Mutation:** Upgraded VPA policies to `updateMode: Auto`, authorizing the VPA Updater to safely terminate resource-starved replicasets.
5. **API Interception:** Validated the VPA Admission Controller's ability to seamlessly intercept pod initialization requests and dynamically overwrite the localized YAML with upgraded compute allocations.