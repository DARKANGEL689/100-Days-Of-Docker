## Day 37: Enterprise Observability & Telemetry (Prometheus & Grafana)
1. **Infrastructure:** Deployed the `kube-prometheus-stack` via Helm for cluster-wide metrics scraping and Grafana visualization.
2. **Application Telemetry:** Authored a Node.js microservice natively instrumented with `prom-client` to expose custom application metrics.
3. **Dynamic Discovery:** Configured a `ServiceMonitor` Custom Resource Definition (CRD) to autonomously bind the API endpoints to the Prometheus scraping engine.
4. **Proactive Defense:** Engineered a `PrometheusRule` to trigger automated critical alerts based on target availability state.