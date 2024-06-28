#!/bin/bash

# Fetch the current public IP of the node
NODE_PUBLIC_IP=$(curl -s -4 ifconfig.me)

# Check if we got the IP
if [[ -z "$NODE_PUBLIC_IP" ]]; then
  echo "Failed to retrieve public IP."
  exit 1
fi

# Run the installation command with the dynamic IP
curl -sfL https://get.k3s.io | K3S_URL=https://172.178.89.167:6443 K3S_TOKEN=K1029b1ebf41a07420cf8cec5790ea295b97c8af2fe7d258bed65b18cb36b1ba179::server:7f1decb998e737fb193ee5f52da21c2e sh -s - --node-external-ip=$NODE_PUBLIC_IP
