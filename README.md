# DevOps Automation Assignment – Flask, Docker, Kubernetes, AWS

## Overview
This repository demonstrates an end-to-end DevOps automation workflow starting from
application containerization to CI/CD, Kubernetes deployment, and cloud infrastructure
provisioning.

The project focuses on:
- Preventing large files in Git repositories
- Automating commits using CRON and Jenkins
- Deploying a Flask application behind Nginx
- Running workloads on Kubernetes (Minikube & AWS EKS)
- Infrastructure provisioning using Terraform

---

## 1. File Size Automation (Bash + CRON + Jenkins)

### Bash Script
A Bash script is used to detect large files in the repository and enforce file size rules.

**Features**
- Detects files larger than 50MB
- Blocks files larger than 2GB
- Automatically commits files smaller than 50MB
- Pushes changes to GitHub

**Script location**


---

### CRON Job
The script is executed automatically every 10 minutes using CRON.

**CRON entry**


This ensures continuous monitoring of file sizes at the OS level.

---

### Jenkins Job
A Jenkins Freestyle job executes the same Bash script as part of CI.

**Key points**
- Runs non-interactively
- Uses GitHub Personal Access Token (PAT) for authentication
- Prevents large files from entering the repository via CI

---

## 2. Docker and Nginx Reverse Proxy

- Flask application runs inside a Docker container
- Nginx runs as a reverse proxy container
- Flask container is NOT exposed directly

**Files**


---

## 3. Kubernetes Deployment (Minikube)

The application is deployed locally on Kubernetes using Minikube.

**Architecture**
- Flask deployed as a Kubernetes Deployment
- Nginx deployed as a Kubernetes Deployment
- Nginx exposed using NodePort
- Traffic flow: Browser → Nginx → Flask

**Manifests**


---

## 4. AWS Deployment (ECR + EKS)

### Amazon ECR
- Docker image is built locally
- Image is pushed to Amazon Elastic Container Registry (ECR)

### Amazon EKS
- Kubernetes cluster created using Terraform
- Managed node group configured
- IAM roles attached for cluster and worker nodes

**Terraform configuration**


---

## 5. Security and Best Practices

- `.terraform` directory excluded from Git
- Terraform state files are not committed
- GitHub Personal Access Token used instead of passwords
- Jenkins runs with controlled permissions
- Large files are prevented at both OS and CI levels

---

## Tools and Technologies Used

- Ubuntu Linux
- Bash Scripting
- Git & GitHub
- Docker & Docker Compose
- Nginx
- Kubernetes (Minikube & EKS)
- AWS (EC2, ECR, EKS, IAM)
- Terraform
- Jenkins
- CRON

---

## Author

**Hema Bharath**  
DevOps Automation Assignment
