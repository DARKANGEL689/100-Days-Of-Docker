## Day 148: AI Model Lineage Tracking & Model Registries (MLflow)

**Objective:** Establish a centralized governance, telemetry, and artifact tracking pipeline for distributed AI workloads. Integrating MLflow ensures that all training parameters, metrics, and physical model weights are immutably registered in a queryable database, enabling seamless transition from training environments to production inference serving.

### Architecture & Engineering Logs
1. **Metadata Backend:** Provisioned an intra-cluster PostgreSQL deployment to act as the highly structured relational state store for experiment lineage.
2. **Registry Server:** Deployed the MLflow Tracking Server framework via custom lightweight Python runtime configurations, binding it to the Postgres service and local artifact storage roots.
3. **Telemetry Integration:** Authored a batch Job container implementing the MLflow Python SDK. The workload simulates neural network epochs, pushing real-time hyperparameter metrics (optimizer, attention_heads) to the tracking URI.
4. **API Auditing:** Scripted a curl-based direct query integration against the MLflow REST API to extract JSON payload verifications of registered Run IDs and learning metrics.