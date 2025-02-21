# Next.js Dashboard on Kubernetes (Minikube)

This repository contains a **Next.js Dashboard** application, originally taken from the official Next.js course [Next.js Learn - Dashboard App](https://nextjs.org/learn/dashboard-app), and deployed locally using **Kubernetes (Minikube)** with **Docker**.

## 🚀 Features
- Next.js dashboard implementation from the official Next.js course
- Containerized with Docker
- Deployed using Kubernetes on a Minikube cluster
- Uses a **NodePort** service for external access to the app

## 🛠️ Technologies Used
- **Next.js**: React framework for building the dashboard application
- **Docker**: To containerize the application
- **Kubernetes (Minikube)**: For local Kubernetes cluster and deployment

## 🏗️ Deployment Steps  

### **1️⃣ Build and Push the Docker Image**  

**Implemented the Dockerfile** and built the Docker image:  
```sh
docker build -t sarithh/nextjs-dashboard:v2.0 .
```
**Pushed the image** to Docker Hub:
```sh
docker push sarithh/nextjs-dashboard:v2.0
```

### **2️⃣ Start Minikube**
```sh
minikube start
```

### **3️⃣ Create Kubernetes Secret for Docker Login**
```sh
k create secret docker-registry docker-secret \
  --docker-username=<username> \
  --docker-password=<personal_access_token> \
  --docker-email=<email>
```

### **4️⃣ Create and Deploy Kubernetes Deployments and Services**
```sh
k apply -f deployment.yaml
k apply -f service.yaml
```

### **5️⃣ Access the Application**
1. Using **Minikube**:  
```sh
minikube service nextjs-dashboard-service -n nextjs-dashboard
```
2. Using **Port-Forwarding**:
```sh
k port-forward svc/nextjs-dashboard-service 3000:80
```

**This project is for learning purposes only.**
