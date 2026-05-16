## Day 61: The Kubernetes Package Manager (Helm Charts)

**Objective:** Transition from static YAML engineering to dynamic, templated deployments using Helm to enable scalable multi-environment architecture.

### Architecture & Engineering Logs
1. **Chart Initialization:** Engineered a custom Helm Chart directory structure (`Chart.yaml`, `values.yaml`, `/templates`).
2. **Template Engineering:** Converted static `Deployment`, `Service`, and `ConfigMap` manifests into dynamic Go Templates utilizing `.Values` and `.Release` variables.
3. **Data Injection:** Engineered pipeline functions (`quote`, `upper`) to dynamically format and inject variables into container environments.
4. **Automated Deployments:** Scripted `helm install` commands to parse templates and deploy the localized package architecture.
5. **Live Mutations:** Scripted `helm upgrade` utilities with `--set` overrides to dynamically mutate live cluster state (e.g., scaling replicas, altering environment variables) without altering baseline files.
6. **Disaster Recovery:** Authored `helm rollback` procedures to autonomously revert cluster architecture to a previous stable revision state.