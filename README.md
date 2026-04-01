# 🚀 Scalable Infrastructure on AWS using Terraform

## 📌 Project Overview

This project demonstrates how to design and deploy a **production-ready, highly available infrastructure** on AWS using **Terraform (Infrastructure as Code)**.

The architecture follows best practices including:

* Multi-AZ deployment
* Auto Scaling
* Load Balancing
* Secure networking

---

## 🏗️ Architecture

```
User → ALB → EC2 (Auto Scaling) → RDS (MySQL)
```

### Components:

* **VPC** with public and private subnets across multiple AZs
* **Application Load Balancer (ALB)** for traffic distribution
* **Auto Scaling Group (EC2)** for scalability
* **RDS MySQL** for database backend
* **NAT Gateway** for outbound internet access from private subnets

---

## ⚙️ Technologies Used

* Terraform
* AWS (EC2, VPC, ALB, RDS, IAM)
* Linux (Amazon Linux)
* Apache (httpd)
* Git & GitHub

---

## 📁 Project Structure

```
terraform-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   └── rds/
│
└── .gitignore
```

---

## 🚀 Features

* Highly available architecture (Multi-AZ)
* Auto Scaling EC2 instances
* Load balancing using ALB
* Secure private database (RDS)
* Infrastructure fully automated using Terraform
* Modular and reusable code structure

---

## 🔐 Security

* EC2 instances are deployed in private subnets
* RDS is not publicly accessible
* Security Groups restrict traffic:

  * ALB → EC2 (HTTP)
  * EC2 → RDS (MySQL)
* IAM roles used for secure access

---

## 🧪 How to Deploy

### 1️⃣ Clone Repository

```
git clone https://github.com/najafathima9992/terraform-project.git
cd terraform-project
```

---

### 2️⃣ Initialize Terraform

```
terraform init
```

---

### 3️⃣ Validate Configuration

```
terraform validate
```

---

### 4️⃣ Plan Deployment

```
terraform plan
```

---

### 5️⃣ Apply Infrastructure

```
terraform apply
```

---

## 🌐 Access Application

After deployment:

```
terraform output
```

👉 Open the **ALB DNS URL** in your browser to access the application.

---

## ⚠️ Important Notes

* Do NOT commit:

  * `.terraform/`
  * `.tfstate`
* Ensure AWS credentials are configured
* Use IAM roles for production environments

---

## 🧠 Learning Outcomes

* Designed real-world cloud architecture
* Implemented Infrastructure as Code using Terraform
* Understood VPC networking and security
* Deployed scalable and fault-tolerant systems

---

## 📈 Future Improvements

* Add CI/CD pipeline using Jenkins / GitHub Actions
* Use AWS SSM instead of SSH
* Implement HTTPS using ACM + Route53
* Containerize application using Docker & Kubernetes

---

## 👩‍💻 Author

**Naja Fathima**

---



