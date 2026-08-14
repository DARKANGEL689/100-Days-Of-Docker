#!/bin/bash
echo "Auditing Zero-Data-Loss Resurrection Sequence..."
echo "--------------------------------------------------------"
DB_POD=$(kubectl get pods -l dr-target=true -o jsonpath='{.items[0].metadata.name}')

echo ">>> [1/5] INJECTING CRITICAL DATA INTO POSTGRES..."
kubectl exec -i $DB_POD -- psql -U admin -d mlflow -c "CREATE TABLE ai_models (name VARCHAR(50), accuracy FLOAT);"
kubectl exec -i $DB_POD -- psql -U admin -d mlflow -c "INSERT INTO ai_models VALUES ('Transformer-V1', 98.6);"
kubectl exec -i $DB_POD -- psql -U admin -d mlflow -c "SELECT * FROM ai_models;"
echo "Data secured in primary memory."
echo ""

echo ">>> [2/5] INITIATING VELERO SNAPSHOT..."
kubectl apply -f 3-dr-triggers.yaml 
echo "Waiting 20 seconds for storage drivers to upload blocks to S3 vault..."
sleep 20
kubectl get backup mlops-snapshot-01 -n velero
echo ""

echo ">>> [3/5] SIMULATING CATASTROPHIC FAILURE (DELETING DATABASE)..."
kubectl delete -f 2-target-database.yaml
sleep 5
echo "Verifying destruction: Pods remaining -> $(kubectl get pods -l dr-target=true | wc -l)"
echo ""

echo ">>> [4/5] EXECUTING VELERO RESTORE SEQUENCE..."
cat 3-dr-triggers.yaml | awk '/kind: Restore/{flag=1} flag' | kubectl apply -f -
echo "Commanding control plane to fetch state from MinIO vault..."
sleep 25 
kubectl wait --for=condition=available deployment/mlops-postgres --timeout=120s
echo ""

echo ">>> [5/5] VERIFYING DATA INTEGRITY AFTER RESURRECTION..."
NEW_DB_POD=$(kubectl get pods -l dr-target=true -o jsonpath='{.items[0].metadata.name}')
kubectl exec -i $NEW_DB_POD -- psql -U admin -d mlflow -c "SELECT * FROM ai_models;"

echo "--------------------------------------------------------"
echo "If the Transformer-V1 data returned successfully, you have achieved stateful immortality."