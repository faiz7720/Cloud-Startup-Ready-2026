# Day 20: Production Observability, CI/CD & DevSecOps Architecture

## 📌 Architecture Overview
This module implements production-grade monitoring, continuous integration, vulnerability scanning, and disaster recovery automation for a distributed microservices setup on AWS EC2.

---

## 🛠️ Stack & Technologies
- **Orchestration:** Docker, Docker Compose
- **CI/CD & DevSecOps:** GitHub Actions, Aqua Security Trivy
- **Observability:** Prometheus, Node Exporter
- **Database & Storage:** MongoDB, Automated Volume Backup Engine
- **Cloud Infrastructure:** AWS EC2 (Ubuntu 24.04/26.04 LTS)

---

## 🚀 Key Features Implemented

### 1. DevSecOps & Automated CI/CD
- GitHub Actions pipeline triggered on `push` to `main`.
- Static container and filesystem vulnerability scan via **Trivy** to intercept critical CVEs.
- Zero-touch automated SSH rolling deployments to AWS EC2.

### 2. Production Observability Stack
- **Prometheus** metrics collection engine configured with a 5s scrape interval.
- **Node Exporter** containerized agent streaming real-time host-level CPU, Memory, Disk I/O, and Network metrics on port `9100`.
- Health endpoint validation via `/metrics` and `/-/healthy`.

### 3. Automated Disaster Recovery (DR)
- Shell-driven snapshot backups for persistent volume directories.
- Automated daily scheduled executions via Linux `crontab`.
- Tested disaster recovery drill restoring live states from compressed tar archives.

---

## 📊 Verification Endpoints
- **Prometheus UI / Health:** `http://<EC2_IP>:9090/-/healthy`
- **Node Exporter Raw Metrics:** `http://<EC2_IP>:9100/metrics`
- **Application Gateway:** `http://<EC2_IP>/`
