#!/usr/bin/env bash

set -xe
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


mkdir ~/.kube
echo ${KUBECONFIG_B64} | base64 -d > ~/.kube/config
mkdir ~/.ssh
chmod 0700 ~/.ssh
echo ${SSH_PRIVATE_KEY_B64} | base64 -d > ~/.ssh/anthos-gke
chmod 0600 ~/.ssh/anthos-gke

# starts HTTP proxy on localhost:8118
ssh -o 'ServerAliveInterval=30' -o 'ServerAliveCountMax 3' -o 'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no' -i ~/.ssh/anthos-gke -L8118:localhost:8118 ubuntu@${BASTION_HOST} -N -4 &
