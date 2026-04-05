Deployed full Prometheus & Grafana Observability stack via Helm
# Day 18: Advanced Observability and Alerting

Today, I engineered an enterprise-grade telemetry pipeline using the Prometheus Operator and Grafana.

## Architecture Implemented:
1. **Dynamic Target Discovery:** Engineered `ServiceMonitor` CRDs to automatically scrape targets via Kubernetes labels.
2. **Dashboards as Code:** Deployed immutable Grafana dashboards via `ConfigMap` sidecar injection to prevent state loss.
3. **Mathematical Telemetry:** Authored advanced `PromQL` expressions mapping `rate()`, rolling windows, and `kube-state-metrics` for anomaly detection.
4. **Automated Alerting:** Designed `PrometheusRule` thresholds with multi-stage evaluation (`for: 1m`) to prevent alert fatigue.
5. **Incident Routing:** Configured `AlertmanagerConfig` to handle alert grouping, batching, and webhook receiver routing.
6. **Validation:** Executed synthetic chaos testing to validate the entire metric-to-alert lifecycle.