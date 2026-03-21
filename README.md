# 🚀 EasyShop - Full DevOps Deployment (AWS | Terraform | EKS | Jenkins | ArgoCD)

## 📌 Overview
This project demonstrates a **production-style DevOps pipeline** for deploying a full-stack e-commerce application on AWS using modern DevOps tools and practices.

It showcases:
- Infrastructure as Code (Terraform)
- Container orchestration (Kubernetes - EKS)
- CI/CD automation (Jenkins)
- GitOps deployment (ArgoCD)
- Monitoring & Logging (Prometheus, Grafana, ELK Stack)

---

## 🧠 What I Built
- Designed and provisioned AWS infrastructure using Terraform  
- Deployed a Kubernetes (EKS) cluster with secure access via bastion host  
- Built CI/CD pipelines in Jenkins for automated build and deployment  
- Implemented GitOps workflow using ArgoCD  
- Set up monitoring with Prometheus & Grafana  
- Implemented centralized logging using Elasticsearch, Filebeat, and Kibana  

---

## 🏗️ Architecture
![Architecture](./public/diagram-export.JPG)

### Flow:
1. Developer pushes code to GitHub  
2. Jenkins builds and pushes Docker image  
3. ArgoCD deploys to Kubernetes (EKS)  
4. Application runs in pods behind AWS Load Balancer  
5. Prometheus & Grafana monitor system health  
6. Logs shipped to Elasticsearch and visualized in Kibana  

---

## 🛠️ Tech Stack
- **Cloud:** AWS (EC2, EKS, IAM, VPC, ALB, Route53)  
- **IaC:** Terraform  
- **Containers:** Docker  
- **Orchestration:** Kubernetes (EKS)  
- **CI/CD:** Jenkins  
- **GitOps:** ArgoCD  
- **Monitoring:** Prometheus, Grafana  
- **Logging:** Elasticsearch, Filebeat, Kibana  

---

## ⚙️ Key Features
- Fully automated infrastructure provisioning  
- End-to-end CI/CD pipeline  
- GitOps-based continuous deployment  
- Scalable Kubernetes workloads  
- Centralized logging and monitoring  
- Secure architecture using IAM and bastion host  

---

## 📈 Impact
- Reduced manual deployment effort by **~70%** through CI/CD automation  
- Improved deployment reliability using Kubernetes and GitOps  
- Enabled real-time monitoring and alerting  
- Achieved consistent and repeatable infrastructure provisioning  

---

## 🔍 Challenges & Solutions

**Issue:** Kubernetes authentication & API access errors  
**Solution:** Fixed IAM roles and kubeconfig configuration  

**Issue:** Terraform state conflicts  
**Solution:** Implemented remote backend with S3 + DynamoDB  

**Issue:** Observability gaps  
**Solution:** Integrated Prometheus, Grafana, and ELK stack  

---

## 📸 Screenshots

### 📊 Grafana Dashboard
![Grafana](./public/grafana.JPG)

### 📦 ArgoCD Deployment
![ArgoCD](./public/Argocd.JPG)

### 📈 Prometheus
![Prometheus](./public/prometheus.JPG)

### 📜 Kibana Logs
![Kibana](./public/kibana.JPG)

---

## 🚀 Future Improvements
- Add auto-scaling (HPA + Cluster Autoscaler)  
- Implement HTTPS with ACM + Ingress  
- Add blue/green or canary deployments  
- Introduce Terraform modules for reusability  

---

## 👤 Author
**Yinka Owolabi**  
- GitHub: https://github.com/yinkaowolabi091-web  
- LinkedIn: https://www.linkedin.com/in/olayinka-owolabi-9169a4220  
