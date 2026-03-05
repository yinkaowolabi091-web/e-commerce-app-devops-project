#!/bin/bash

# =============================================================
# FIXED: Replaced snap installs with direct binary installs
# snap is unreliable on headless EC2 Ubuntu instances
# Debug log: cat /var/log/user-data.log
# =============================================================
exec > /var/log/user-data.log 2>&1
set -e

echo "=== [START] Bastion setup - $(date) ==="

apt-get update -y
apt-get install -y unzip curl

# -----------------------------
# Install AWS CLI v2
# -----------------------------
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp
/tmp/aws/install
rm -rf /tmp/aws /tmp/awscliv2.zip

echo "=== AWS CLI installed ==="
aws --version

# -----------------------------
# Install kubectl (latest stable)
# -----------------------------
KUBECTL_VERSION=$(curl -sL https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

echo "=== kubectl installed ==="
kubectl version --client

# -----------------------------
# Install Helm 3
# -----------------------------
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "=== Helm installed ==="
helm version

echo "=== [DONE] Bastion setup complete - $(date) ==="