#!/bin/bash

# =============================================================
# Debug log - after deploy SSH in and run:
#   cat /var/log/user-data.log
# =============================================================
exec > /var/log/user-data.log 2>&1
set -e

echo "=== [START] user_data script - $(date) ==="

# Update system
apt-get update -y
apt-get upgrade -y

# Install required packages
apt-get install -y ca-certificates curl gnupg lsb-release

# -----------------------------
# Install Java 17 (required for Jenkins)
# -----------------------------
apt-get install -y openjdk-17-jre-headless
echo "=== Java 17 installed ==="
java -version

# -----------------------------
# Install Jenkins
# FIXED: wget saves the .asc key directly - more reliable in user_data
# than curl | gpg --dearmor pipe which fails silently
# -----------------------------
apt-get install -y wget

wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "=== Jenkins key saved - $(ls -la /usr/share/keyrings/jenkins-keyring.asc) ==="

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
  | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update -y
apt-get install -y jenkins

systemctl enable jenkins
systemctl start jenkins

echo "=== Jenkins installed and started ==="
systemctl status jenkins --no-pager

# -----------------------------
# Install Docker
# -----------------------------
apt-get install -y docker.io
systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu
usermod -aG docker jenkins

echo "=== Docker installed ==="
docker --version

echo "=== [DONE] All tools installed successfully - $(date) ==="