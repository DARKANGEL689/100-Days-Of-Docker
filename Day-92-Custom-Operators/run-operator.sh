#!/bin/bash
echo "Booting Custom Operator Control Loop..."
source operator-env/Scripts/activate
kopf run core_operator.py --standalone