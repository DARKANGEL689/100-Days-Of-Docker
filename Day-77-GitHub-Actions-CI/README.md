## Day 77: Continuous Integration (GitHub Actions)

**Objective:** Engineer a centralized Continuous Integration (CI) pipeline utilizing GitHub Actions to autonomously test, build, and package application code into immutable Docker artifacts upon `git push` events.

### Architecture & Engineering Logs
1. **Target Application:** Provisioned a Node.js Express API featuring integrated health check endpoints and standardized JSON responses.
2. **Automated Testing:** Authored Jest/Supertest testing suites to cryptographically validate API `HTTP 200 OK` status codes prior to artifact compilation.
3. **Containerization:** Engineered highly optimized, multi-stage alpine Dockerfiles targeting production-only dependency trees.
4. **CI Workflow Provisioning:** Architected `.github/workflows/ci-pipeline.yml` to synthesize ephemeral `ubuntu-latest` execution runners upon targeted path mutations (`Day-77-GitHub-Actions-CI/**`).
5. **Secret Injection:** Configured GitHub Actions Repository Secrets to securely inject Docker Hub authentication tokens into the CI runner via `docker/login-action`.
6. **Artifact Promotion:** Implemented dynamic dual-tagging (`:latest` and `${{ github.sha }}`) using the `docker/build-push-action` to establish immutable artifact versioning tied directly to specific Git commits.