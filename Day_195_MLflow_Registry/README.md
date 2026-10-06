## Day 195: MLflow Model Registry

**Objective:** Eradicate "Algorithmic Amnesia" by engineering a centralized tracking database capable of immortalizing machine learning hyperparameters, real-time performance metrics, and immutable model artifacts.

### Architecture & Engineering Logs
1. **Registry Core Provisioning:** Deployed the official `mlflow/mlflow` tracking server onto the localized cluster. Configured a lightweight SQLite backend to manage structured metric schemas and mapped a localized artifact root for binary tensor storage.
2. **SDK Instrumentation:** Authored a Python-based ML job natively instrumented with the `mlflow` SDK. Programmed the execution loop to autonomously map `learning_rate` and `batch_size` constants, while actively streaming real-time loss variables directly to the tracking server's internal DNS.
3. **API Extraction Audit:** Scripted a curl-based telemetry execution directly against the MLflow REST API (`/api/2.0/mlflow/runs/search`). Mathematically validated the successful database ingestion of the training pod's JSON metadata, proving absolute lifecycle traceability.