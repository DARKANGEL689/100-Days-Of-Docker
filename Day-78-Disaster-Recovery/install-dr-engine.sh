#!/bin/bash
echo "Deploying the Off-Site S3 Storage Vault (MinIO)..."
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install s3-vault bitnami/minio \
  --namespace velero-system \
  --create-namespace \
  --set auth.rootUser=minioadmin \
  --set auth.rootPassword=minioadmin \
  --set defaultBuckets=enterprise-backups

echo "Downloading Velero CLI Engine..."
curl -sL -o velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.13.0/velero-v1.13.0-windows-amd64.tar.gz
tar -xzf velero.tar.gz
mv velero-*-windows-amd64/velero.exe .

echo "Generating Cryptographic Credentials for the S3 Vault..."
echo -e "[default]\naws_access_key_id=minioadmin\naws_secret_access_key=minioadmin" > credentials-velero

echo "Installing Velero into the Cluster and bridging it to the S3 Vault..."
./velero.exe install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.9.0 \
    --bucket enterprise-backups \
    --secret-file ./credentials-velero \
    --use-node-agent \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://s3-vault-minio.velero-system.svc.cluster.local:9000

echo "Waiting for Velero Controller to boot..."
kubectl wait --namespace velero-system --for=condition=ready pod -l name=velero --timeout=120s
echo "Disaster Recovery Engine is ONLINE."