## Day 66: Configuration Management (Kustomize Overlays)

**Objective:** Engineer environment-specific deployment pipelines (Dev/Prod) utilizing native Kubernetes overlay architecture to eliminate YAML duplication.

### Architecture & Engineering Logs
1. **Base Architecture:** Extracted core infrastructure into a standardized `/base` directory to serve as the immutable foundation.
2. **Overlay Engineering:** Architected distinct `/overlays/dev` and `/overlays/prod` directories to inherit and mutate the base architecture.
3. **Dynamic Prefixing:** Utilized `namePrefix` directives to autonomously generate unique infrastructure identifiers (e.g., `dev-api-server`, `prod-api-server`) avoiding namespace collisions.
4. **JSON Patching:** Implemented inline `patches` to surgically target and replace specific array indices (container arguments) without modifying the base file.
5. **Strategic Merging:** Authored explicit `patchesStrategicMerge` manifests to inject production-grade security boundaries (`resources.limits`) strictly into the Prod overlay.
6. **Native Deployment:** Executed `kubectl apply -k` utilizing Kustomize's native integration with the Kubernetes control plane.