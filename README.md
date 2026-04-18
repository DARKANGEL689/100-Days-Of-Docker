# Day 32: Umbrella Charts & Multi-Tier Microservice Orchestration

Today, I engineered a global "Umbrella Chart" architecture to orchestrate and deploy multiple dependent microservices as a single, cohesive ecosystem.

## Architecture Implemented:
1. **Dependency Resolution:** Configured `Chart.yaml` to dynamically resolve, pull, and package external enterprise Helm charts (Bitnami Redis and Nginx) as localized sub-charts.
2. **Global Parameter Injection:** Engineered a master `values.yaml` matrix to override deeply nested sub-chart variables from a single control plane (e.g., dynamically altering replica counts and database authentication credentials).
3. **Full-Stack Deployment:** Executed a unified `helm install` to simultaneously provision a highly-available frontend and a cached database backend, eliminating imperative, multi-step provisioning workflows.