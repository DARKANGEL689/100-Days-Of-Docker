## Day 87: Event-Driven Architecture (Apache Kafka & Strimzi)

**Objective:** Deprecate synchronous REST API communication bottlenecks by engineering an Asynchronous Event-Driven Architecture utilizing Apache Kafka to establish immutable, fault-tolerant message queues, ensuring absolute zero-data-loss guarantees during microservice outages.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the Strimzi Operator via Helm to automate the lifecycle management of complex Kafka and Zookeeper distributed stateful sets.
2. **Broker Synthesis:** Provisioned the `enterprise-broker` Kafka cluster and configured the `transaction-ledger` topic with strict 2-hour retention policies.
3. **Producer Integration:** Engineered a frontend deployment executing continuous shell-based data generation, injecting asynchronous JSON payloads directly into the Kafka broker.
4. **Consumer Integration:** Authored a backend settlement deployment utilizing Consumer Groups (`settlement-group`) to establish distributed offset tracking and message consumption.
5. **Chaos Engineering (Zero-Data-Loss):** Executed a catastrophic backend outage simulation. Validated Kafka's ability to seamlessly buffer transit data and confirmed the consumer's ability to autonomously process backlogged offsets upon resurrection without manual intervention.