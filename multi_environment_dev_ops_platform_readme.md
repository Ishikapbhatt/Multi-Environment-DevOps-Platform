# 🚀 Multi-Environment DevOps Platform (Dev / QA / Prod)

This repository demonstrates a **production-grade DevOps architecture** implementing **Dev, QA, and Production environments** using modern DevOps tools and best practices. The project mirrors **real enterprise workflows** including environment isolation, CI/CD automation, approval gates, and safe deployment strategies.

---

## 📌 Project Overview

The goal of this project is to build an **end-to-end DevOps platform** where:
- Dev and QA environments support **fast, automated deployments**
- Production deployments are **controlled, approved, and zero-downtime**
- Infrastructure and applications are **fully isolated per environment**

---

## 🧰 Tech Stack

| Layer | Tools |
|-----|------|
| Source Control | GitHub |
| CI/CD | Jenkins |
| Containers | Docker |
| Orchestration | Kubernetes (EKS) |
| Infrastructure as Code | Terraform (Workspaces + Modules) |
| Cloud | AWS (VPC, EKS, ALB, IAM) |
| Monitoring | Prometheus, Grafana |

---

## 🏗 Architecture Highlights

- **Terraform Workspaces** for Dev / QA / Prod isolation
- **Reusable Terraform Modules** (VPC, EKS, ALB, IAM)
- **Kubernetes Namespaces** per environment
- **Jenkins Multi-Stage Pipeline**
- **Manual Approval Gate** for Production
- **Rolling Updates** (Dev & QA)
- **Blue-Green Deployment** (Production)
- **Centralized Monitoring** using Prometheus & Grafana

---

## 📁 Repository Structure

```
multi-env-devops/
├── Jenkinsfile
├── docker/
│   └── Dockerfile
├── app/
│   └── index.html
├── k8s/
│   ├── dev/
│   ├── qa/
│   └── prod/
├── terraform/
│   ├── backend.tf
│   ├── provider.tf
│   ├── versions.tf
│   ├── variables.tf
│   ├── main.tf
│   └── modules/
│       ├── vpc/
│       ├── eks/
│       ├── alb/
│       └── iam/
```

---

## 🔀 CI/CD Workflow

1. **Code Commit** to GitHub branch
2. **Jenkins Pipeline Triggered**
3. Docker image built and pushed
4. Terraform provisions infra using selected workspace
5. Application deployed to Kubernetes namespace
6. **Production requires manual approval**
7. Blue-Green deployment executed for Prod

---

## 🌍 Environment Strategy

| Environment | Terraform Workspace | Kubernetes Namespace | Deployment |
|-----------|-------------------|---------------------|------------|
| Dev | dev | dev | Rolling Update |
| QA | qa | qa | Rolling Update |
| Prod | prod | prod | Blue-Green |

---

## 🏗 Infrastructure Provisioning

- Remote Terraform state stored in **S3**
- State locking enabled via **DynamoDB**
- Same Terraform codebase used for all environments
- Resource naming driven by `terraform.workspace`

---

## ☸ Kubernetes Strategy

- Single EKS cluster (logical isolation)
- Separate namespaces per environment
- Blue & Green deployments in Prod
- ALB routes traffic safely during releases

---

## 📊 Monitoring & Observability

- Prometheus collects cluster & pod metrics
- Grafana dashboards per environment
- Used for post-deployment validation and alerts

---

## 🎯 Interview Value

This project demonstrates:
- Real-world CI/CD pipelines
- Enterprise-grade Terraform design
- Safe production deployments
- Environment isolation & governance
- Cloud-native DevOps best practices

---

## 🧪 How to Run (High-Level)

1. Configure AWS credentials
2. Initialize Terraform
3. Create workspaces (dev / qa / prod)
4. Run Jenkins pipeline per environment
5. Monitor deployments via Grafana

---

## 📌 Future Enhancements

- Helm charts for application deployment
- EKS IRSA (IAM Roles for Service Accounts)
- Multi-account AWS setup
- Canary deployments
- Security scanning in CI/CD

---

## 🧑‍💻 Author

Built for **learning, interviews, and real-world DevOps demonstrations**.

---

⭐ If you find this project useful, feel free to extend it or use it as a reference for enterprise DevOps setups.