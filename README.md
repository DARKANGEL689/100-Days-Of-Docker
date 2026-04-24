## Day 38: Centralized Log Aggregation (PLG Stack)
1. **Aggregator Deployment:** Provisioned Grafana Loki and Promtail using Helm within the `monitoring` namespace.
2. **DaemonSet Architecture:** Promtail configured to automatically scrape `stdout` and `stderr` from all container runtimes across the cluster.
3. **Data Source Integration:** Wired Loki's internal Kubernetes DNS endpoint (`http://loki:3100`) into Grafana.
4. **LogQL Exploration:** Executed LogQL queries via Grafana Explore to centralize and filter microservice telemetry streams.
5. **Structured Logging:** Deployed custom infrastructure outputting standardized JSON logs for downstream processing.
6. **Advanced LogQL:** Engineered data pipelines using the `| json` parser to extract dynamic labels and filter critical module failures.
7. **Logs-to-Metrics:** Developed aggregate queries to convert unstructured log data into graphable rate metrics.
8. **Host Telemetry:** Validated Promtail's capability to scrape underlying node kernel logs (`/var/log`) for deep infrastructure debugging.