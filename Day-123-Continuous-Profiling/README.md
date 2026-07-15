## Day 123: Continuous Profiling (Parca & eBPF)

**Objective:** Deprecate heavy, code-intrusive APM SDKs by engineering an eBPF-based continuous profiling layer. Utilizing Parca to autonomously hook into the Linux kernel, extracting native and user-space CPU stack traces at 100Hz to generate zero-overhead Flamegraphs for instantaneous root-cause analysis.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the Parca Server and Parca Agent DaemonSet via Helm, establishing a cluster-wide eBPF telemetry net capable of reading process memory directly from the kernel ring buffers.
2. **Anomaly Simulation:** Authored a Python `ConfigMap` payload utilizing inefficient recursive processing loops to intentionally generate severe CPU throttling events without any internal Prometheus/OpenTelemetry instrumentation.
3. **Microscopic Observability:** Established port-forwarding tunnels to the Parca time-series database UI, mathematically validating the visualization of the `compute_heavy_algorithm` stack frame dominating the ICicle/Flamegraph execution tree.