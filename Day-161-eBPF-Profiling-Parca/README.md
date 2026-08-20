## Day 161: Continuous Performance Profiling (Parca & eBPF)

**Objective:** Diagnose algorithmic bottlenecks and CPU saturation at the kernel level without injecting overhead into the application layer. Engineered a Continuous Profiling matrix using Parca and Extended Berkeley Packet Filter (eBPF) to autonomously generate live Flamegraphs of cluster execution stacks.

### Architecture & Engineering Logs
1. **Target Workload Provisioning:** Authored a dynamic C++ execution container that explicitly compiles (`g++ -O0 -g`) and runs a heavy, unoptimized prime-factorization algorithm to simulate intense compute spikes.
2. **eBPF Agent Deployment:** Deployed the Parca stack via Helm, configuring the DaemonSet with `hostPID: true` and `privileged` execution rights to allow kernel-space process mapping.
3. **Out-of-Band Telemetry:** The Parca agent leverages eBPF to read CPU stack traces natively from the Linux scheduler 100 times per second, ensuring zero code-modification is required within the target workloads.
4. **Visual Analytics:** Established localized tunneling to the Parca Server UI to visualize deep execution Flamegraphs, exposing exact functions and memory addresses responsible for compute consumption.