# Day 13: Containerization & Docker Engine Fundamentals

## Technical Implementation
- Installed Docker Engine on Ubuntu 24.04 LTS via APT package manager.
- Configured non-root execution by mapping user to `/var/run/docker.sock` via the `docker` Linux system group.
- Pulled official `nginx:latest` runtime image from Docker Hub.
- Spawned detached container with host-to-container port binding (`-p 8080:80`).
- Validated container runtime health and HTTP payload via local loopback sockets.

## Key Commands
```bash
sudo apt update && sudo apt install docker.io -y
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker
docker run -d -p 8080:80 --name my-web-container nginx
docker ps
curl http://localhost:8080

Verification & Output
Container Status: Up (healthy)

Port Mapping: 0.0.0.0:8080 -> 80/tcp

HTTP Response: HTTP/1.1 200 OK (Served via containerized Nginx instance)


---

**Day13/docker_setup.sh**

```bash
#!/bin/bash
set -euo pipefail

# 1. Update system packages
sudo apt update -y

# 2. Install Docker Engine
sudo apt install docker.io -y

# 3. Enable and start Docker daemon
sudo systemctl enable --now docker

# 4. Add current user to docker group
sudo usermod -aG docker "$USER"

# 5. Run Nginx container with port mapping
docker run -d -p 8080:80 --name my-web-container nginx

# 6. Verify container status
docker ps
curl -I http://localhost:8080
