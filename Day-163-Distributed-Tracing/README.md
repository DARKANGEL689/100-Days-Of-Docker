## Day 163: Distributed Tracing & Telemetry (OpenTelemetry + Jaeger)

**Objective:** Resolve the "Invisible Execution" bottleneck in highly decoupled microservice environments by tracking cross-container HTTP lifecycles. Engineered a zero-touch instrumentation pipeline using OpenTelemetry to automatically inject, propagate, and export Trace IDs across the cluster network.

### Architecture & Engineering Logs
1. **Telemetry Collector Provisioning:** Deployed the Jaeger All-in-One distributed tracing backend, exposing OTLP gRPC endpoints for high-speed data ingestion and a localized visualization UI.
2. **Zero-Touch Auto-Instrumentation:** Utilized the `opentelemetry-bootstrap` and `opentelemetry-instrument` CLI wrappers to dynamically hook into Python FastAPI and `requests` binaries at runtime. This enabled full distributed tracing without modifying a single line of application source code.
3. **Trace Propagation:** Mathematically validated the autonomous injection of W3C Trace Context headers as the `frontend-gateway-api` initiated outbound HTTP requests to the `backend-database-api`.
4. **Waterfall Visualization:** Established port-forwarded tunnels to the Jaeger UI, allowing for deep latency inspection of multi-span cascades, pinpointing exact execution bottlenecks (e.g., simulated database query sleep delays).