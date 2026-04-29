## Day 44: Centralized Log Aggregation (PLG Stack)
1. **Observability Perimeter:** Provisioned an isolated namespace for cluster-wide telemetry tools.
2. **PLG Deployment:** Deployed Promtail (Agent), Loki (Database), and Grafana (UI) via the integrated Helm umbrella chart.
3. **Synthetic Log Generation:** Deployed a chaos pod to simulate high-density application log streams.
4. **LogQL Engineering:** Utilized Loki Query Language to parse, filter, and isolate specific error traces across distributed pods.
5. **Metric Transformation:** Converted unstructured log data into real-time visual dashboards using rate mathematical functions.