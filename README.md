# 🚀 EasyShop – Production-Ready DevOps Platform

> A production-style DevOps platform that automates the deployment of a full-stack e-commerce application on AWS using Infrastructure as Code, Kubernetes, GitOps, CI/CD, and modern observability tools.

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-blue)
![Docker](https://img.shields.io/badge/Docker-Containers-blue)
![Jenkins](https://img.shields.io/badge/Jenkins-CI-red)
![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-orange)
![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-red)
![Grafana](https://img.shields.io/badge/Grafana-Dashboards-orange)

---

# 📑 Table of Contents

- Overview
- Project Goal
- Architecture
- Tech Stack
- AWS Infrastructure
- Key Features
- Skills Demonstrated
- CI/CD Workflow
- Project Impact
- Repository Structure
- Challenges & Solutions
- Deployment
- Screenshots
- Lessons Learned
- Future Improvements
- Author

---

# 📌 Overview

EasyShop is a production-style DevOps project demonstrating how a cloud-native application can be deployed, automated, monitored, and managed on AWS.

Instead of focusing on individual tools, this project combines Infrastructure as Code, Kubernetes orchestration, CI/CD automation, GitOps, monitoring, and centralized logging into a single deployment workflow.

---

# 🎯 Project Goal

The objective of this project was to simulate how a real DevOps team deploys, automates, monitors, and manages cloud-native applications in production.

The project integrates:

- Infrastructure as Code
- CI/CD Automation
- Kubernetes
- GitOps
- Monitoring
- Centralized Logging
- AWS Cloud Infrastructure

---

# 🧠 What I Built

- Provisioned AWS infrastructure using Terraform
- Deployed Amazon EKS cluster
- Configured secure Bastion Host access
- Built Jenkins CI/CD pipelines
- Automated Kubernetes deployments
- Implemented GitOps using ArgoCD
- Configured Prometheus & Grafana monitoring
- Implemented centralized logging using Elasticsearch, Filebeat and Kibana
- Managed Terraform remote state using S3 and DynamoDB

---

# 🏗️ Architecture

![Architecture](./public/diagram-export.JPG)

## Deployment Flow

1. Developer pushes code to GitHub
2. Jenkins automatically triggers CI pipeline
3. Docker images are built
4. Images are pushed to the container registry
5. ArgoCD detects Git changes
6. ArgoCD synchronizes Kubernetes manifests
7. Amazon EKS deploys the application
8. Prometheus collects metrics
9. Grafana visualizes dashboards
10. Filebeat ships logs to Elasticsearch
11. Kibana provides centralized log analysis

---

# 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| Cloud | AWS (EC2, EKS, IAM, VPC, ALB, Route53) |
| IaC | Terraform |
| Containers | Docker |
| Orchestration | Kubernetes |
| CI/CD | Jenkins |
| GitOps | ArgoCD |
| Monitoring | Prometheus, Grafana |
| Logging | Elasticsearch, Filebeat, Kibana |

---

# ☁️ AWS Infrastructure

Terraform provisions:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- IAM Roles
- Bastion Host
- Amazon EKS
- Route53
- S3 Backend
- DynamoDB State Locking

---

# ⚙️ Key Features

- Automated Infrastructure Provisioning
- Production-style CI/CD Pipeline
- GitOps Deployment
- Kubernetes Workloads
- Monitoring & Alerting
- Centralized Logging
- Secure IAM Architecture
- Remote Terraform State

---

# ⭐ Skills Demonstrated

- AWS Cloud
- Terraform
- Kubernetes
- Docker
- Jenkins
- GitHub
- GitOps
- ArgoCD
- Linux
- Infrastructure as Code
- DevOps Automation
- CI/CD
- Monitoring
- Logging
- AWS Networking
- IAM

---

# 🔄 CI/CD Workflow

```text
Developer
      │
      ▼
GitHub Repository
      │
      ▼
Jenkins Pipeline
      │
      ▼
Docker Image Build
      │
      ▼
Container Registry
      │
      ▼
ArgoCD
      │
      ▼
Amazon EKS
      │
      ▼
Application
      │
      ▼
Prometheus
Grafana
Elasticsearch
Kibana
```

---

# 📈 Project Impact

- Reduced manual deployment effort by approximately **70%**
- Automated infrastructure provisioning
- Improved deployment consistency
- Implemented GitOps deployment model
- Enabled centralized monitoring and logging
- Created repeatable cloud infrastructure

---

# 📦 Repository Structure

```text
e-commerce-app-devops-project/
├── terraform/          # Infrastructure as Code
├── kubernetes/         # Kubernetes manifests
├── helm-values/        # Helm values
├── scripts/            # Automation scripts
├── src/                # Application source
├── public/             # Images & diagrams
└── README.md
```

---

# 🔍 Challenges & Solutions

## Kubernetes Authentication

**Issue**

Unable to authenticate with Amazon EKS.

**Solution**

Configured IAM roles and updated kubeconfig.

---

## Terraform State Locking

**Issue**

Terraform state conflicts during deployments.

**Solution**

Implemented remote backend using Amazon S3 and DynamoDB.

---

## Monitoring

**Issue**

Limited visibility into cluster health.

**Solution**

Integrated Prometheus, Grafana and ELK Stack.

---

# 🚀 Deployment

This project provisions infrastructure with Terraform, deploys workloads to Amazon EKS, and uses ArgoCD for GitOps-based continuous delivery.

### Clone Repository

```bash
git clone https://github.com/yinkaowolabi091-web/e-commerce-app-devops-project.git
```

### Provision Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### Configure kubectl

```bash
aws eks update-kubeconfig --region <region> --name <cluster-name>
```

### Deploy Kubernetes Resources

```bash
kubectl apply -f kubernetes/
```

### Synchronize with ArgoCD

```bash
argocd app sync ecommerce
```

---

# 📸 Screenshots

## Architecture

![Architecture](./public/diagram-export.JPG)

## Grafana Dashboard

![Grafana](./public/grafana.JPG)

## Prometheus

![Prometheus](./public/prometheus.JPG)

## ArgoCD

![ArgoCD](./public/Argocd.JPG)

## Kibana

![Kibana](./public/kibana.JPG)

---

# 📚 Lessons Learned

This project strengthened my understanding of:

- Infrastructure as Code
- Kubernetes Administration
- GitOps
- AWS Networking
- CI/CD Automation
- Monitoring & Alerting
- Centralized Logging
- Troubleshooting distributed systems

---

# 🚀 Future Improvements

- Horizontal Pod Autoscaler
- Cluster Autoscaler
- HTTPS using ACM & Ingress
- Blue/Green Deployments
- Canary Releases
- Terraform Modules
- Security Scanning
- Disaster Recovery
- Multi-environment deployments

---

# 👤 Author

**Yinka Owolabi**

DevOps Engineer passionate about cloud infrastructure, Kubernetes, automation, and cloud-native technologies.

- GitHub: https://github.com/yinkaowolabi091-web
- LinkedIn: https://www.linkedin.com/in/olayinka-owolabi-9169a4220
