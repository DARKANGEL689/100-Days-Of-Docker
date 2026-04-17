# Month 2: Platform Engineering & Automation

# Day 31: Helm Package Management & Template Injection

Today, I fundamentally shifted cluster management from static manifest files to dynamic, data-driven templates using Helm.

## Architecture Implemented:
1. **Scaffolding & Templating:** Generated standardized Helm Charts, separating static Kubernetes syntax (`templates/`) from dynamic parameters (`values.yaml`).
2. **Lifecycle Management:** Executed live `helm install` and `helm upgrade` operations, managing massive architectural state changes by mutating single configuration variables.
3. **Version Control & Rollbacks:** Validated Helm's native revision history, successfully executing zero-downtime `helm rollback` commands to instantly revert accidental architectural changes.
4. **Third-Party Integrations:** Tapped into upstream Helm repositories to deploy complex enterprise software (Metrics Server), utilizing `--set` flags to dynamically inject custom arguments for local cluster compatibility.