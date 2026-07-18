## Day 126: Distributed Tracing (OpenTelemetry & Jaeger)

**Objective:** Deprecate blind operational debugging by engineering an omniscient Distributed Tracing mesh. Utilizing the OpenTelemetry (OTel) Collector to route auto-instrumented span data into a Jaeger visualization backend, yielding sub-millisecond visibility into cross-network microservice latency waterfalls.

### Architecture & Engineering Logs
1. **Trace Backend Provisioning:** Deployed the Jaeger All-In-One UI and storage engine, exposing native OTLP gRPC ingestion endpoints.
2. **Telemetry Routing:** Engineered the OpenTelemetry Collector via ConfigMaps to act as an asynchronous, non-blocking telemetry buffer, decoupling application performance from observability network constraints.
3. **Zero-Code Instrumentation:** Deployed localized Python APIs utilizing the `opentelemetry-instrument` execution wrapper. This automatically mutated HTTP and library boundaries to inject standard `TraceID` and `SpanID` headers into cross-service network traffic without code refactoring.
4. **Latency Verification:** Validated the trace propagation loop by executing frontend API commands and visually analyzing the sequential cascading delays (waterfall graphs) inside the Jaeger UI dashboard.