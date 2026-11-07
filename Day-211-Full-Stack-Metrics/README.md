## Day 211: Full-Stack Metrics (Kube-Prometheus Stack & Grafana)

**Objective:** Achieve total hardware visibility by deploying a declarative, highly available time-series database (Prometheus) and data visualization engine (Grafana) to monitor pod scaling, CPU saturation, and memory allocations in real-time.

### Architecture & Engineering Logs
1. **Operator Provisioning:** Deployed the `kube-prometheus-stack` utilizing Helm to establish a robust monitoring control plane, inclusive of Node Exporters for deep OS-level kernel metrics extraction.
2. **Dynamic Service Discovery:** Authored a `ServiceMonitor` CRD directly targeting AI workloads. This effectively instructs the Prometheus Operator to autonomously map endpoints and ingest standard `/metrics` data every 10 seconds without manual target file modifications.
3. **Declarative Dashboard Injection:** Engineered a Kubernetes `ConfigMap` labeled specifically for Grafana's sidecar controller. Defined explicit PromQL (Prometheus Query Language) queries mapping `container_cpu_usage_seconds_total` to visually track artificial CPU spikes generated during the local load-testing audit.