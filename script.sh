#!/bin/bash

# Fetch the current public IP of the node
NODE_PUBLIC_IP=$(curl -s -4 ifconfig.me)

# Check if we got the IP
if [[ -z "$NODE_PUBLIC_IP" ]]; then
  echo "Failed to retrieve public IP."
  exit 1
fi

# Run the installation command with the dynamic IP
curl -sfL https://get.k3s.io | K3S_URL=https://74.235.164.239:6443 K3S_TOKEN=K1005590a179dd0d6bd7c80d7e69809de37f70fcbd2c4b287ea4a7693da984a7bed::server:ae832c1932ed9a3d304a9008a0124990 sh -s - --node-external-ip=$NODE_PUBLIC_IP
