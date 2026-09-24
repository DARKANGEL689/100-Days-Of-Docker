#!/bin/bash
echo "Auditing Parameter-Efficient Fine-Tuning Execution..."
echo "--------------------------------------------------------"

echo "[WAIT] Awaiting library installation and model download (can take 60s)..."
POD_NAME=$(kubectl get pods -l job-name=lora-finetuning-matrix -o jsonpath='{.items[0].metadata.name}')

kubectl logs -f $POD_NAME

echo "--------------------------------------------------------"
echo "Look at the 'trainable params' metric above. You just fine-tuned a model by training barely 0.2% of its actual logic. This is how enterprise engineers train massive models on single GPUs."