# Day 19: Centralized Logging (Loki, Promtail, Grafana)

Today, I solved the "ephemeral log" problem in Kubernetes by deploying a centralized, decoupled log aggregation architecture using the PLG Stack.

## Architecture Implemented:
1. **Log Shipping:** Deployed `Promtail` as a DaemonSet to automatically intercept and label container logs at the node level.
2. **Log Storage:** Provisioned `Loki` as a highly scalable, index-free log database.
3. **Data Integration:** Engineered declarative `ConfigMaps` to automatically provision Loki as a data source within Grafana.
4. **Query Engineering (LogQL):** - Utilized stream selectors (`{app="x"}`) for targeted log isolation.
   - Applied line filters (`|=`) for rapid text grepping.
   - Executed JSON pipeline parsers (`| json`) for structured log querying.
   - Extracted metric aggregations (`rate()`) directly from raw text logs.