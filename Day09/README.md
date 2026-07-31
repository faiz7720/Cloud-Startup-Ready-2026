# Day 09: Application Containerization with Docker & Nginx Deployment

## 📌 Executive Summary
Containerized a lightweight web application using custom Dockerfiles, managed container lifecycles on AWS EC2, and exposed container endpoints across host networking boundaries via explicit port mapping.

---

## 🎯 Production Engineering Steps

### 1. Custom Dockerfile Authoring & Image Build
Authored an optimized `Dockerfile` leveraging Nginx as the base server image to serve static web content:

```bash
# Build custom Docker image tagged as cloud-app
docker build -t cloud-app:v1 .

# Inspect local Docker images
docker images
```

### 2. Container Lifecycle & Network Port Mapping
Provisioned and executed a background container mapping host port `8080` to internal container port `80`:

```bash
# Launch background container with host port binding
docker run -d -p 8080:80 --name cloud-web-container cloud-app:v1

# Inspect running container instances
docker ps
```

---

## 🔐 Engineering Deliverables
- **Containerization:** Decoupled application runtimes using Docker images.
- **Port Forwarding:** Exposed internal container Nginx port `80` to host system port `8080`.
- **Lifecycle Management:** Inspected active processes and managed isolated runtime environments.
