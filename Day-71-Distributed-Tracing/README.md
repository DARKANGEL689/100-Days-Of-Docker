## Day 71: Distributed Tracing (Jaeger)

**Objective:** Engineer a centralized distributed tracing architecture to achieve granular, request-level observability across complex microservice boundaries, enabling rapid bottleneck identification.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the `jaeger-all-in-one` binary, establishing an in-memory datastore, trace collector, and visualization UI within a single cohesive pod.
2. **Telemetry Routing:** Provisioned internal Kubernetes Services to expose HTTP (`14268`) ingestion endpoints for cluster-wide application trace forwarding.
3. **Application Instrumentation:** Deployed the Jaeger HotROD simulated microservice architecture, configured via environment variables (`JAEGER_ENDPOINT`) to stream OpenTracing telemetry.
4. **Chaos Engineering:** Authored background port-forwarding scripts to bombard the ingress routing layer with asynchronous HTTP requests, validating span generation under load.
5. **Raw Data Auditing:** Engineered bash utilities to directly interrogate the Jaeger REST API, validating JSON `traceID` structures bypassing the graphical interface.