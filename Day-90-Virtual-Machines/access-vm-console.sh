#!/bin/bash
echo "Attaching Serial Console directly to the Virtual Machine Hypervisor..."
echo "------------------------------------------------------------------"
echo "INSTRUCTIONS:"
echo "1. When the screen stops moving, press ENTER once."
echo "2. Login as username: cirros"
echo "3. Password: gocubsgo"
echo "4. You are now inside a physical Linux VM running inside Kubernetes!"
echo "5. Type 'exit', then press 'Ctrl + ]' to disconnect your terminal."
echo "------------------------------------------------------------------"
sleep 3
./virtctl.exe console enterprise-legacy-vm