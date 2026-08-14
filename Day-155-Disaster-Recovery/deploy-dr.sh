#!/bin/bash
echo "[INIT] Deploying S3 Object Storage Vault (MinIO)..."
kubectl apply -f 1-minio-vault.yaml
kubectl wait --for=condition=available deployment/dr-storage-vault --timeout=120s

echo "[INIT] Creating isolated backup bucket ('velero-backups')..."
kubectl run minio-setup --image=minio/mc --restart=Never --command -- /bin/sh -c \
  "mc alias set myminio http://minio-dr-svc.default.svc.cluster.local:9000 protocol300 protocol300 && mc mb myminio/velero-backups"
sleep 5
kubectl delete pod minio-setup --ignore-not-found

echo "[DEPLOY] Generating Velero configuration metrics..."
cat << 'EOF' > velero-values.yaml
configuration:
  provider: aws
  backupStorageLocation:
    - name: default
      provider: aws
      bucket: velero-backups
      config:
        region: minio
        s3ForcePathStyle: "true"
        s3Url: http://minio-dr-svc.default.svc.cluster.local:9000
credentials:
  useSecret: true
  secretContents:
    cloud: |
      [default]
      aws_access_key_id=protocol300
      aws_secret_access_key=protocol300
initContainers:
  - name: velero-plugin-for-aws
    image: velero/velero-plugin-for-aws:v1.7.0
    volumeMounts:
      - mountPath: /target
        name: plugins
EOF

echo "[DEPLOY] Installing Velero Disaster Recovery Engine..."
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
helm repo update
helm upgrade --install velero vmware-tanzu/velero --namespace velero --create-namespace -f velero-values.yaml --wait

echo "[DEPLOY] Deploying Target Stateful Database..."
kubectl apply -f 2-target-database.yaml
kubectl wait --for=condition=available deployment/mlops-postgres --timeout=120s

echo "Disaster Recovery Matrix is ARMED."