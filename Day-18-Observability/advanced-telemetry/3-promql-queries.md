# Advanced PromQL Metric Queries

**1. Rolling HTTP Error Rate (5m Window):**
Calculates the per-second rate of 500-level crashes on our backend over the last 5 minutes.
`rate(http_requests_total{status=~"5.."}[5m])`

**2. Per-Pod CPU Throttling:**
Identifies pods that are hitting their CPU limits and being throttled by Kubernetes.
`rate(container_cpu_cfs_throttled_seconds_total[5m])`

**3. Memory Saturation:**
`container_memory_working_set_bytes / container_spec_memory_limit_bytes > 0.85`
**4. Pod CrashLoopBackOff Detection:**
Finds pods that are repeatedly crashing and restarting.
`kube_pod_container_status_waiting_reason{reason="CrashLoopBackOff"} > 0`

**5. PVC Storage Exhaustion:**
Triggers when a StatefulSet hard drive is 90% full.
`kubelet_volume_stats_used_bytes / kubelet_volume_stats_capacity_bytes > 0.9`