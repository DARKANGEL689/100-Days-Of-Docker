## Day 151: Asynchronous Event-Driven Inference (Apache Kafka)

**Objective:** Architect a fault-tolerant, decoupled execution pipeline for heavy machine learning workloads. By transitioning from synchronous REST APIs to asynchronous event streaming via Kafka, we eliminate HTTP timeouts, buffer extreme traffic spikes, and protect backend compute resources from localized DDoS saturation.

### Architecture & Engineering Logs
1. **Event Bus Deployment:** Provisioned a lightweight, single-node Apache Kafka broker operating in KRaft mode, bypassing legacy Zookeeper dependencies for memory-efficient local orchestration.
2. **Logic Decoupling:** Engineered distinct Python operational loops. The API Producer acts as a high-speed data ingestion gateway, instantly acknowledging payloads. 
3. **Throttled Execution:** The AI Consumer runs in an isolated context, continuously polling the `inference-queue` topic to execute heavy tensor simulations at maximum sustained hardware throughput without risking connection drops.