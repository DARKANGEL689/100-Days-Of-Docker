## Day 45: Hardware Telemetry & Alerting (Prometheus & Alertmanager)
1. **Metrics Engine:** Deployed Prometheus Server, Node Exporter, and Kube-State-Metrics via Helm to autonomously scrape cluster vitals.
2. **PromQL Analytics:** Validated raw time-series metric ingestion utilizing the Prometheus Query Language.
3. **Data Source Integration:** Wired internal cluster DNS to connect the Prometheus datastore to the Grafana visualization UI.
4. **Enterprise Dashboards:** Imported community-standard hardware and network telemetry dashboards for real-time observability.
5. **Proactive Alerting:** Engineered custom Prometheus rules and validated autonomous incident detection via Alertmanager using synthetic CrashLoop injection.